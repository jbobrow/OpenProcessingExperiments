
int diameter = 10;
float x =0;
float y =0;
float xspeed=2.2;
float yspeed=5;
 
void setup(){
  size(200,200);
  background(5);
  noStroke();
}

void draw(){
 
  fill(252,28,69);
  x=x-xspeed;
  y=y-yspeed;
  
  if ((x> width-diameter/2) || (x<0)) {
    xspeed=xspeed * - 1;
  }
  if ((y>height-diameter/2) ||( y<0)) {
    yspeed=yspeed * - 1;
 }
  
  ellipse(x,y,diameter,diameter);
}    


