
float w;
float h;
float a;
float b; 
float c;
float d; 
float e;
float sWeight;

//float opacity;

void setup () {
  b = random(1,255);
  //opacity = ((mouseX-pmouseX)+(pmouseY-pmouseY))*10;
  size(600,400);
  background(255);
  smooth();
  frameRate(30);
}

void draw() {
 
  
  //a = random(1000);
  float c = (mouseX);
  float d = (mouseY);
  float e = random(1,10);
  float f = random(30);
  float x = abs(mouseX-pmouseX);
  float y = abs(mouseY-pmouseY);
  
  sWeight = abs(((f-e)*x - (f-e)*y) / 10);
  
  a = abs(e+(x+y));
  
  stroke(a,(x+y)*7);
  //stroke(a);
  strokeWeight(sWeight);
  rectMode(CENTER);
  rect(c,d,(f-e)*x,(f-e)*y);
  // ellipseMode (CENTER);
  //ellipse(c*f,d*f,,d);
  //line(int(random(1,5000)),int(random(1,5000)),int(random(1,5000)),int(random(1,5000)));
 }
 
 void mousePressed() {
  float c = (mouseX);
  float d = (mouseY);
  float e = random(1,10);
  float f = random(30);
  float x = abs(mouseX-pmouseX);
  float y = abs(mouseY-pmouseY);
  sWeight = abs(((f-e)*x - (f-e)*y) / 10);
  a = abs(e+(x+y));
  stroke(252,0,0);
  strokeWeight(sWeight);
  rectMode(CENTER);
  rect(c,d,(f-e)*x,(f-e)*y);
  }
  
  void keyPressed() {
  float c = (mouseX);
  float d = (mouseY);
  float e = random(1,10);
  float f = random(30);
  float x = abs(mouseX-pmouseX);
  float y = abs(mouseY-pmouseY);
  sWeight = abs(((f-e)*x - (f-e)*y) / 10);
  a = abs(e+(x+y));
  stroke(0,0,255);
  strokeWeight(sWeight);
  rectMode(CENTER);
  rect(c,d,(f-e)*x,(f-e)*y);
  }



