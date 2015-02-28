
float angle = 0.0;
float x = 40;

 
void setup() {

  size(250, 250);
  smooth();
  background(255);
  frameRate(180);
  fill(#4ECBFA,40);
  strokeWeight(.3);
  noCursor();
}


void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  ellipse(-15, -15, x, x);
  angle += random(0.9);
  x-=0.1;
  if (x<0){
    x=40;}
  if (mousePressed == true){
    background(255);
  }
}


