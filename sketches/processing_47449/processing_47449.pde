
//Initialize ball location
final float dia = 25;
float x = dia/2;
float y = 10;
int xd = 1;
boolean del = false;

//Initialize speed and gravity(g)
float speed = 0;
float g = 0.2;

void setup(){
  size(500,500);
  fill(255,100,15);
  smooth();
  
}

void draw(){
  background(255);
  //The Ball
  noStroke();
  ellipse(x,y,dia,dia);
  
  //Variables of Ball
  y += speed;
  x += 0.2*xd; //Move ahead in given direction
  speed += g; 
  
  //Bouce back mechanism, cont decrease
  if (y > height-dia/2) { 
    speed *= -0.95;
    y = height-dia/2; //this makes sure the change doesn't keep happening over and over
  } 
 
  if(x>width-dia/2 || x<dia/2)
   xd *= -1; //bouncing sideways
   
}

