

float x, y;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 50;

PImage img;

void setup() {
  size(320, 240);
  strokeWeight(30);
  stroke(255, 160);
  
  
  x = width * 0.3;
  y = height * 0.5;
}

void draw() {
  background(img = loadImage("http://timothyklofski.de/other/learning_code/mannequin.png"));
  
  if (mousePressed) {

  angle1 = (mouseX/float(width) + 0.5) * -PI;
  angle2 = (mouseY/float(height) + 0.5) * PI;
    
  } else {
  
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  
  }

  
  pushMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();
  
  
  
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 1);
}


