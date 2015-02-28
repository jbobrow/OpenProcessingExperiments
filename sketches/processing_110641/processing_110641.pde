
float vx, vy, x, y, raiox, raioy, atrito;
void setup() {
  size(800, 800);
  smooth();
  background(0);
  stroke(255);
  atrito=0.99;
  noCursor();
  noStroke();
} 

void draw() {
  
  vx=atrito*(vx+(mouseX-x)/1000);
  x= x+vx;
  vy=atrito*(vy+(mouseY-y)/1000);
  y= y+vy;
  raiox=raiox+(dist(x,y,mouseX,mouseY)/1.8-raiox)/50;
  raioy=raiox;
  colorMode(RGB, 100);
  fill (abs(9*vx),abs(9*vy),0);
  strokeWeight(sq(dist(mouseX,mouseY,x,y))/70000);
  ellipse(x, y, raiox, raioy);
}
