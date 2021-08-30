//iterar de 0 a 2pi
int a  = 0;
z_buffer deepness;
void setup(){
  frameRate(60);
  size(500,500);
  stroke(18,105,199);
  deepness = new z_buffer(550,550);
}

void draw(){
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
