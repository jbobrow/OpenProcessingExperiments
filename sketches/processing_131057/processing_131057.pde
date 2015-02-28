
//www.instructables.com/id/Control-a-RepStrap-RepRap-CNCCartesian-Bot-usi/step20/3D-Bouncing-Ball-Processing/

PVector pos;
PVector velocity;
//change sphere so bounces off walls when scaled

PVector sFactor;
PVector scaleSpeed;

float posX, posY,posZ,radius;
// helf width of the shape
float speedX, speedY, speedZ;
int xdirection = 1;
int ydirection = 1;
int zdirection = 1;


float xpos, ypos, zpos;    // Starting position of shape   
float depth;
void setup(){
  size(450,550,P3D);

  posX = width/2;
  posY = height/2;
  posZ = -height/2;
  //note that z-axis goes 'into' the screen
  depth = -height;
  pos = new PVector(200, 200);
  velocity = new PVector(2, 2);
  
  sFactor = new PVector(0.1,0);
  scaleSpeed = new PVector(0.1, 0.1);
  speedX = 2;
  speedY = 2;
  speedZ=2;
  radius=40;
}
void draw(){
  background(150);
  stroke(255);
//back
line(0,0,depth,width,0,depth);            
line(0,height,depth,width,height,depth);
line(0,0,depth,0,height,depth);
line(width,0,depth,width,height,depth);
//corners
line(0,0,0,0,0,depth);
line(0,height,0,0,height,depth);
line(width,0,0,width,0,depth);
line(width,height,0,width,height,depth);

  ball();
}
void ball(){
  
if (speedX>0&&speedY>0) {
posX = posX + ( speedX * xdirection );
posY = posY + ( speedY * ydirection );
posZ = posZ + ( speedZ * zdirection );
if (posZ>0||posZ<(-height-radius)){
    zdirection *= -1;
  }
if (posX > width-radius || posX < radius) {
    //radius///0
xdirection *= -1;
}
if (posY > height-radius || posY < radius) {
  //radius///0
ydirection *= -1;
}}
noStroke();
lights();
translate(posX, posY, posZ);
sphere(radius);
}


