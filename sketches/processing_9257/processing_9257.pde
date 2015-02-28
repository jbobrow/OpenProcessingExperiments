
float r= 200;
float g= 250;
float b= 300;
float a= 300;

float diam = 20;
float x= 100;
float y= 100;

void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(5);
}
void draw() {
  stroke(0);
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(mouseX+pmouseY,mouseY+pmouseX,mouseX,mouseY);
  
  if (!mousePressed) {
    rect (b,a,r,g);
  } else {
    ellipse (mouseX,mouseY,r,g);
  }
}

