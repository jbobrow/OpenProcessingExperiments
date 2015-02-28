
float x,y,angle,rad;
int direction=1;
 
 
void setup(){
  size(600, 600);
  background (0);
  angle = 1;
  rad = 1;
  direction = +1;
  smooth();
}
 
void draw(){
  x = cos(radians(angle)) * rad+width/2;
  y = sin(radians(angle)) * rad+height/2;
  fill(random(255),random(255), random(255));
  ellipse(x,y,50,50);
  angle+= 10;
  rad+=direction;
}

