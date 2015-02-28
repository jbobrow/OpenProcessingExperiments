
int x;
int directionX;
int y;
int directionY;

void setup(){
size (700,400);
smooth();
background(0);
x = 45;
directionX = 1;
y = 125;
directionY = 1;
}


void draw(){
  x += directionX;
  y += directionY;
 stroke(random(255), random (255), random (255));
 strokeWeight(5);
 fill(random(255), random (255), random (0));
  
  ellipse(x,y,35,35);
  
if(y > 400)
  directionY=-1;
 
if(y< 1)
  directionY=1; 
if(x>700)
  directionX=-1;
if(x<1)
  directionX=1;
 
}
  


