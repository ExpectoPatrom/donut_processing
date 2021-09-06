//iterar de 0 a 2pi
int a  = 0;
boolean playing = true;
float camera_distance = 90;
int zoomHudX = 370;
int zoomHudY = 470;
int zoomHudWidth = 100;
int zoomHudHeight = 10;
float pos_x = 100;
float pos_y = 100;
float last_x = 0;
float last_y = 0;
void setup(){
  frameRate(60);
  size(500,500);
  stroke(0);
}
void draw(){
  background(255);
  clip(0, 0, 500, 450);
  float r2 = 50;
  float r1 = 35;
    float rad_a = radians(a);
    float sin_a = sin(rad_a);
    float cos_a = cos(rad_a);
    for(int phi=0; phi<360; phi+=7){ // toroide (gira en torno a y)
      float rad_phi = radians(phi);
      float sin_phi = sin(rad_phi);
      float cos_phi = cos(rad_phi);

      for(int theta=0; theta<360; theta+=5){//circulo
        float rad_theta = radians(theta);
        float sin_tetha = sin(rad_theta); float cos_tetha = cos(rad_theta);
        float aux = r2+(r1*cos_tetha);
        float x = aux*cos_phi;
        float y = (r1*sin_tetha*cos_a) + ((-1*sin_a)*sin_phi*aux);
        float z = (r1*sin_tetha*sin_a) + (sin_phi*cos_a*aux);
        point_3D current = new point_3D(x,y,z);
        point(int(current.x_2d)+pos_x,int(current.y_2d)+pos_y);
      }
    }
  a+=1;
  a%=360;
  if(a%4==0 && a!=180){
    background(255);
  }
  noClip();
  rect(zoomHudX, zoomHudY, zoomHudWidth, zoomHudHeight);
  float eq = ((camera_distance*-5)/8) + 156.25;
  rect(zoomHudX+eq-15,zoomHudY-5,30,20);
  fill(0);
  rect(zoomHudX+eq-1,zoomHudY-3,2,15);
  rect(zoomHudX+eq-8,zoomHudY+3.5,15,2);
  if(playing==false){
    rect(50,zoomHudY-13,2,25);
    rect(60,zoomHudY-13,2,25);
  }
  fill(250);
  last_x = mouseX;
  last_y = mouseY;
}

void mouseClicked() {
  if (playing == true) {
    playing = false;
    draw();
    noLoop();
  } else {
    playing = true;
    if(a%4==0 && a!=180)a--;
    loop();
  }
}

void mouseWheel(MouseEvent event){
  float delta = event.getCount();
  if(delta<=0){
    camera_distance -= 10;
    camera_distance = max(90.0,camera_distance);
  }
  else{
    camera_distance += 10;
    camera_distance = min(250.0,camera_distance);
  }
}

void mouseDragged()
{
  pos_x = max(pos_x-(0.5*(last_x-mouseX)),15);
  pos_x = min(pos_x,490);
  pos_y = max(pos_y-(0.5*(last_y-mouseY)),15);
  pos_y = min(pos_y,435);
}
