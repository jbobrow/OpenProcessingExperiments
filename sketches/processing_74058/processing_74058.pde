
float angle = 0.0;
float speed = 0.05;
float radius = 30.0;
float sx = 2.0;
float sy = 2.0;
int kick1X, kick1Y, kick2X, kick2Y;
 
class Car {
   
  color c;
  float xpos; // x position
  float ypos; // y postiion
  float xvel; // x velosity
  float yvel; // y velosity
   
  // default constructor
  Car() {
     
    xpos = width/2;
    ypos = height/2;
    xvel = 1.0;
    yvel = 1.0;
     
  }
 
  
   
 void display() {
   rectMode(CENTER);
   fill(255);
   ellipse (xpos,ypos,30,30);
 }
  
 void setVelocities(int newxvel, int newyvel) {
   xpos = xpos + newxvel;
   ypos = ypos + newyvel;
      
   if (xpos > width) {
     xpos = 0;
   }
   if (ypos > height) {
     ypos = 0;
   }
   if (xpos < 0) {
     xpos = width;
   }
   if (ypos < 0) {
     ypos = height;
   }
 }
} // end of car class
 
Car jimCar1;
Car jimCar2;
//
void setup (){
size(1000,520,P3D);
background (10);
noStroke();


   
  kick1X = 2;
  kick1Y = 3;
  kick2X = 3;
  kick2Y = -1;
}


//
void draw(){
  background(random(17));
  if(mousePressed == true){
    lights();
  } 
  
  // 3D X + O
  frameRate(60);
  noStroke();
  pushMatrix();
  translate (random(1000), 100,-550);
  rotateY(PI/9);
  //box(mouseX +1000,60,50);
  box(random(30),random(50),mouseY +800);
  pushMatrix ();
  popMatrix();
  translate(0,random(-400),random(100));
  ellipse(mouseX,mouseY,mouseX +200, mouseY +200);
  popMatrix();
  

 
//

rect(mouseX -200,mouseY ,random(60), random(200));


//
smooth();
rotate(-PI/8);
float v = random(100);
float inc=0.1;
noStroke();
fill(random(255),0,0,random(252));
noiseSeed(20);
for(int i=0; i< width; i = i+6){
  float n=noise(v) * 1000.0;
  rect(i,random(20+n), 3, 5);
  v=v+inc;
}
}


