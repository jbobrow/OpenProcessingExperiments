
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
  frameRate(15);
}


void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(mouseX, mouseY,b,a);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(mouseX+pmouseY,mouseY+pmouseX,mouseX,mouseY);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(mouseX-pmouseY,mouseY-pmouseX,mouseX,mouseY);
  
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(mouseY+pmouseX,mouseX+pmouseY,mouseY,mouseX);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(mouseY-pmouseX,mouseX-pmouseY,mouseY,mouseX);
  
  
  
  if (!mousePressed) {
    ellipse (mouseX,mouseY,pmouseX,pmouseY);
  } else {
    ellipse (pmouseX+a,pmouseY+b,r,g);
  }
  
  /*
  if (!keyPressed) {
    ellipse (b,a,r,g);
  } else {
    triangle (pmouseX+mouseX,pmouseY+mouseY,r,g,a,b);
  }*/
  
}

