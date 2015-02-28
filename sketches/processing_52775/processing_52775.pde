
int value = 0;


float x = 200;
float y = 400;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 300;

void setup() {
  size(1300, 800);
  smooth(); 
  strokeWeight(random(50.0));
  stroke(0, 1000);
}

void draw() {
  background(random(255),random(255),random(255),10);
  
  angle1 = (mouseX/float(width) - 3.75) * -PI;
  angle2 = (mouseY/float(height) - 30.75) * PI;
  

  pushMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();
  
  quad(mouseX,mouseY, 310, 456, 520, 169, 63, 390);
  fill(random(255),random(255),random(255),50);
  strokeWeight(5);
}

void segment(float x, float y, float a) {
  stroke(random(255),random(255),random(255),random(100));
  translate(x, y);
  rotate(a);
  for(int i = 0;i<30;i++){
    line(i*25, i*50, segLength, 0);
  }
}

void mousePressed(){
  background(mouseX,mouseY);
  background(255);
}

