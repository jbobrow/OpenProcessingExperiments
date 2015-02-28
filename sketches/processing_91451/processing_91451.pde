
Pimage img;
Pimage img2;
Pimage img3;
Pimage img4;

int radius = 40;
float x = 110;
float z = 350;
float speed = 0.09;
float bug = 1;
int direction = 1;

float angle = 0.0;
float offset = 60;
float scalar = 30;

float m = 100;
float n = 310;

float l = 100;



void setup(){
  frameRate(120);
  size(720,480);
  img = loadImage("bg2.jpg");
  img2 = loadImage("bear.png");
  img3 = loadImage("fly.png");
  img4 = loadImage("roach.png");
  smooth();
  ellipseMode(RADIUS);
  
}
void draw(){
  image(img,0,0);
//  x += speed * direction;
//  if ((x > width-radius) || (x < radius)) {
//    direction = -direction;
//  }
//  
//  image(img3,x,random(200),radius,radius);
  
  float a = offset+cos(angle) * scalar;
  float b = offset+sin(angle) * scalar;
  //rotate(angle);
  image(img3,a,b);
  image(img3,a+400,b);
  angle += speed;
  
  if (keyPressed && (key == CODED)){
    if (keyCode == LEFT) {
      (m--) && (l-200);
    } else if (keyCode == RIGHT){
      m++;
    }
  }
   if(mousePressed){
    (n = 260) && image(img2,m,n-50,l,100); 
  } else {
    (n = 310) && image(img2,m,n,l,100);
    }
//image(img2,m,n,100,100);
z += bug* direction;
  if ((z > width-radius) || (z < radius)) {
    direction = -direction;
  }
  if (direction == 1) {
    image(img4,z,350,100,100);
  } else {
    image(img4,z,350,-100,100);
  }
}


