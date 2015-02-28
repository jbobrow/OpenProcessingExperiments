
//Global Varibale!
PImage img;
Ball[] balls;
int unit = 20;
int count;

//float s = random(10,600);
//float s2 = random(10,600);
//float s3 = random(10,200);
float gravity = 0.1;

void setup () {
  
 size(800,600);
 frameRate(50);
 int wideCount = width / unit;
 int highCount = height / unit;
 count = wideCount * highCount;
 balls = new Ball[count];
 
 int index = 0;
 for (int y = 0; y < highCount; y++) {
   for(int x = 0; x < wideCount; x++) { 
     //float xx, float yy, float ww, float ss
     //intialise ball objects whilst going through array
     balls[index++] = new Ball(x*unit, y*unit, unit/2, unit/2);
   }
 }

}

void draw() {
  //img = loadImage("opo0635a.jpg");
  background(255,130,5);

  fill(255,243,5,80);

  
  for(int i = 0; i< count; i++) {
    balls[i].display();
    balls[i].move();
  }
}

class Ball {
 
  float x; // x position of ball
  float y; // Y position of ball
  float speed; //speed of ball
  float w; // size of ball
  
  //Ball constructor
  Ball(float xx, float yy, float ww, float ss) {
   x = xx;
   y = yy;
   w = ww; 
   speed = ss;
  }
 
 //Ball function
 void display() { 
   noStroke();
   ellipse(x, y, w, w);
   
 }  
 
 void move() {
   //move
   y = y + speed; 
   //add gravity
   speed = speed + gravity;
   //if ball reaches bottom
   if(y > (height-w)) {
    speed = speed * -0.95; 
    //x = x;
   }
 }
}




