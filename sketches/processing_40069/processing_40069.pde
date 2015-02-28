
float angle = 0.0;
float offset = 60;
float scalar;
float speed = 0.9;
int x,y;

void setup() {
  size(440,220);
  fill(0);
  smooth();
}

void draw() {
  background(0);
  
  translate(mouseX,mouseY);
  scalar = sin(angle)+2;
  rotate(angle);
  //scale(sin(angle)+2);
  scale(scalar);
  strokeWeight(1.0/scalar);
   fill(12,255,23);
  ellipse(20,20,80,80);
  fill(255,255,0);
  ellipse(-15,-15,30,30);
  rect(-15,-15,30,30);
  fill(255,0,243);
  ellipse(-18,-18,20,20);
  fill(12,155,250);
  ellipse(-15,20,20,20);
 
  angle+=0.1;

}
