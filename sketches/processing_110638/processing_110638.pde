
float vx, vy, x, y, centerx, centery, raiox, raioy, atrito;
void setup() {
  size(900, 600);
  smooth();
  background(255);
  stroke(255);
  centerx=320;
  centery=100;
  y=320;
  atrito=0.99;
} 

void draw() {
  
  vx=atrito*(vx+(mouseX-x)/1000);
  x= x+vx;
  vy=atrito*(vy+(mouseY-y)/1000);
  y= y+vy;
  raiox=raiox+(dist(x,y,mouseX,mouseY)/1.5-raiox)/50;
  raioy=raiox;
// fill (abs(9*vx));
  fill(255);
  stroke(abs(9*vy));
  strokeWeight(sq(dist(mouseX,mouseY,x,y))/70000);
  ellipse(x, y, raiox, raioy);
}

void keyPressed() {
  if (key==' ') background(255);
  if(key=='s') save("desenho"+ int(random(50)) + ".png");
  println(key);
}
