
int counter = 0;
int angle = 0;
int curve = 0;

float trans_x, trans_y;

void setup() {
  size(800, 800);
  background(0);
 // noLoop();
}

void draw() {  
  drawRotSpiral();
  strokeWeight(1);
  stroke(255, 70); 
    translate(width/2, height/2);
    rotate(radians(angle));  
    float yPoint = 0;
    float randomX = random(1, width-1);
    fill(125, random(0, 255));
    
    while (yPoint < height/2) {
      float randomWidth = random(1, 20);
      float towerHeight = random(1, 100);
      float spacing = random(1, 20);
      rect(randomX, yPoint + spacing, randomWidth, towerHeight);
      yPoint += towerHeight + spacing;
    }    

 if (counter > 100) {
   background(0);
   counter = 0; 
 }
 
  if (angle > 360) {
   angle = 0;
   trans_x = random(0, width);
   trans_y = random(0, height);
   curve = 0;

 }
 
 counter++;
 angle++;
}

void mouseClicked() {
  reset();
}

void reset() {
  background(0);
  counter = 0;
  angle = 0;
  
}


void drawRotSpiral() {
 pushMatrix();
 translate(trans_x, trans_y);
  rotate(radians(angle));
  for (int j = 0; j < 10; j++) {
    beginShape();
    for(int i = 0; i < 10; i++)           {
       float x = sin(radians(i));
       float y = cos(radians(i));
       float r = i*.2;
       float y_v = y*(r*.3)+j+(i*.3)+j;
       float x_v = (x*r)+j;
       Dots d = new Dots();
       d.display();
    }
    endShape();
  }
  
  endShape();
  popMatrix();
}
class Dots {
  float x, y, diam;
  
  public Dots() {
    x = random(width);
    y = random(height);
    diam =  random(0, 10);
  }

  void display() {
    pushMatrix();
      translate(x, y);
      ellipse(0, 0, diam, diam);
    popMatrix();
  }
  
}
