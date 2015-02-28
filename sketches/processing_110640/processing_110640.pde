
float vx, vy, x, y, raiox, raioy, atrito;
void setup() {
  size(900, 600);
  smooth();
  background(255);
  stroke(255);
  y=height/2;
  x=width/2;
  atrito=0.99;
  noCursor();
} 

void draw() {
  
  vx=atrito*(vx+(mouseX-x)/1000);
  x= x+vx;
  vy=atrito*(vy+(mouseY-y)/1000);
  y= y+vy;
  raiox=raiox+(dist(x,y,mouseX,mouseY)/1.5-raiox)/50;
  raioy=raiox;
colorMode(RGB, 150);
  fill (abs(9*vx),abs(9*vy),0,20);
  strokeWeight(sq(dist(mouseX,mouseY,x,y))/70000);
 noStroke();
  ellipse(x, y, raiox, raioy);
}
