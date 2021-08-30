import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class donut_processing extends PApplet {

//iterar de 0 a 2pi
int a  = 0;
z_buffer deepness;
public void setup(){
  frameRate(60);
  
  stroke(18,105,199);
  deepness = new z_buffer(550,550);
}

public void draw(){
  float r2 = 50;
  float r1 = 35;
  //for(int a=0; a<360; a+=50){ // girar en torno a x
    float rad_a = radians(a);
    float sin_a = sin(rad_a);
    float cos_a = cos(rad_a);
    for(int phi=0; phi<360; phi+=2){ // toroide (gira en torno a y)
      float rad_phi = radians(phi);
      float sin_phi = sin(rad_phi);
      float cos_phi = cos(rad_phi);
      for(int theta=0; theta<360; theta+=10){//circulo
        float rad_theta = radians(theta);
        float sin_tetha = sin(rad_theta); float cos_tetha = cos(rad_theta);
        float aux = r2+(r1*cos_tetha);
        float x = aux*cos_phi;
        float y = (r1*sin_tetha*cos_a) + ((-1*sin_a)*sin_phi*aux);
        float z = (r1*sin_tetha*sin_a) + (sin_phi*cos_a*aux);
        point_3D current = new point_3D(x,y,z);
        //println(current._z);
        //println(current.x_2d,current.y_2d,current._z);
        //chequeamos en el buffer, si está más cerca se grafica
        if(phi==0)println(z);
        point(current.x_2d+100,current.y_2d+100);
        // if(deepness.buffer_matrix[int(x)+100][int(y)+100] >= current._z){
        //     point(current.x_2d+100,current.y_2d+100);
        //     deepness.buffer_matrix[int(x)+100][int(y)+100] = current._z;
        // }

      }
    }
  //}
  a+=1;
  //a%=360;
  //println(a);
  //if(a%70==0)noLoop();
  if(a%4==0)background(240);

}
class point_3D{
  float _x;
  float _y;
  float _z;
  float _k1 = 50;
  float _k2 = 105;
  float x_2d;
  float y_2d;
  float z_2d;
  point_3D(float x, float y, float z){
    _x = x;
    _y = y;
    _z = z;
    x_2d = coord_to_2d(_x);
    y_2d = coord_to_2d(_y);
    z_2d = coord_to_2d(_z);
  }
  public float coord_to_2d(float coor){
    return (_k1*coor)/(_k2+_z);
  }
}
class z_buffer{
  float[][] buffer_matrix;

  z_buffer(int m, int n){
    buffer_matrix = new float[m][n];
    for(int i=0; i<m; i+=1){
      for(int j=0; j<n; j++){
        buffer_matrix[i][j] = 90;
      }
    }
  }
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "donut_processing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
