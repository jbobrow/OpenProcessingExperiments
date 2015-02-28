
PImage myImage;

float a1=0;
float a2=0;
float a3=0;
float a4=0;
float a5=0;
float a6=0;
float x=0;
float rectw=50;
float recth=10;
float y=300;
float speed=0;
float speedx = 0;
float speed1=3;
float speed2=3;
float speed3=3;
float speed4=3;
float speed5=3;
float speed6=3;

float gravity = 0.5;
float circlex= 150;

void setup() {
 size(300, 600);
a1 = height;
myImage = loadImage("city 2.png"); 
}

void draw() {
  image(myImage, 0, 0, 300, 600); 

  fill(255);
  Ball();
  lines(0);
  lines2(50);
  lines3(100);
  lines4(150);
  lines5(200);
  lines6(250);
 // if (collision(circlex, y, x, rectw,  a1,  recth)) {
 //   speed = speed * -1;
//println("collision!");
  }
//}
  
 
 void lines(int x){
rect(x, a1, rectw, recth);
rect(x, a1+300, 50, 10);
rect(x, a1+ 600, 50, 10);
 stroke(255);

if (a1 > height+30) {
    speed1=speed1*-1;
  }
  else if (a1<0-650) {
    speed1 = speed1*-1;
  }
   a1 = a1 + speed1;
}
  


 void lines2(int x){
rect(x, a2, 50, 10);
rect(x, a2+300, 50, 10); 
rect(x, a2+500, 50, 10);  
 stroke(255);

 a2 = a2 - 3;
  if (a2 < 0-500) { 
    a2 = height; 
  }
} 
void lines3(int x){
rect(x, a1+50, 50, 10);
rect(x, a1+200, 50, 10);
rect(x, a1+ 500, 50, 10); 
 stroke(255);

if (a1 > height+30) {
    speed1=speed1*-1;
  }
  else if (a1<0-650) {
    speed1 = speed1*-1;
  }
   a1 = a1 + speed1;
}

void lines4(int x){
rect(x, a4+50, 50, 10);
rect(x, a4+200, 50, 10);
rect(x, a4+ 500, 50, 10);
 stroke(255);

 a4 = a4 - 3;
  if (a4 < 0-500) { 
    a4 = height; 
  }
} 
void lines5(int x){
rect(x, a5+50, 50, 10);
rect(x, a5+200, 50, 10);
rect(x, a5+ 500, 50, 10);
 stroke(255);

 a5 = a5 - 3;
  if (a5 < 0-600) { 
    a5 = height; 
  }
} 
void lines6(int x){
 rect(x, a6, 50, 10); 
 stroke(255);

 a6 = a6 - 3;
  if (a6 < 0-500) { 
    a6 = height; 
  }
}

 
  void Ball(){
   ellipseMode(CENTER);
  ellipse(circlex, y, 10, 10);
   y = y + speed;
  circlex = circlex + speedx;
   speed = speed + gravity;
  if(circlex < 0 || circlex > width) {
    speedx = -speedx;
  }
  if (y > height) {
speed = speed * -0.95;
  }   
  }

//boolean collision(float circlex,float y,float x,float rectw, float a1, float recth ) {
//return !(circlex>=x+recth|| y>a1+recth || circlex<=x+recth&&y>a1+recth);
 



void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
   speedx=+5;
    }
    if (keyCode == LEFT) {
      speedx=-5;
  }
}
}
  




