
int xpos, ypos, size;
float angle_base = 0;
Cloud c;

void setup() {
  size(640, 400);
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  size = 120;

  xpos = size + 20;
  ypos = 380;

  c = new Cloud(0, 60, 50);
}

void draw() {
  background(0, 0, 255);
  background(0, 0, 255);
  
  noStroke();
  // Draw the sun
  //stroke(255, 255, 0);
  fill(200, 200, 0);
  
  // draw some rays
  for ( int angle = 0; angle < 360; angle += 30 ) {
    float dx = cos(radians(angle+angle_base-10)) * 1000;
    float dy = sin(radians(angle+angle_base-10)) * 1000;

    float dx2 = cos(radians(angle+angle_base)) * 1000;
    float dy2 = sin(radians(angle+angle_base)) * 1000;

    triangle(xpos-size/2, ypos-size/2, dx, dy, dx2, dy2);
  }  


  fill(235, 235, 0);
  for ( int angle = 0; angle < 360; angle += 15 ) {
    float dx = cos(radians(angle-angle_base-5)) * 1000;
    float dy = sin(radians(angle-angle_base-5)) * 1000;

    float dx2 = cos(radians(angle-angle_base)) * 1000;
    float dy2 = sin(radians(angle-angle_base)) * 1000;

    triangle(xpos-size/2, ypos-size/2, dx, dy, dx2, dy2);
  }  


  fill(255, 255, 0);
  for ( int angle = 0; angle < 360; angle += 30 ) {
    float dx = cos(radians(angle-angle_base-10)) * 1000;
    float dy = sin(radians(angle-angle_base-10)) * 1000;

    float dx2 = cos(radians(angle-angle_base)) * 1000;
    float dy2 = sin(radians(angle-angle_base)) * 1000;

    triangle(xpos-size/2, ypos-size/2, dx, dy, dx2, dy2);
  }  

  angle_base += 0.35;

  ellipse(xpos-size/2, ypos-size/2, size, size);
  
  fill(0);
  ellipse(xpos-size/2-20, ypos-size/2-20, 10, 10);
  ellipse(xpos-size/2+20, ypos-size/2-20, 10, 10);

  stroke(0);
  strokeWeight(5);

  noFill();
  curve(xpos-size/2-60, ypos-size/2-100,
        xpos-size/2-40, ypos-size/2+20,
        xpos-size/2+40, ypos-size/2+20,
        xpos-size/2+60, ypos-size/2-100);

  c.update();
}

class Cloud { 
  float xpos, ypos, size; 
  float speed = 0.5;
  Cloud (float x, float y, float s) {  
    xpos = x; 
    ypos = y; 
    size = s; 
  } 

  void update() { 
    xpos += speed; 
    if (xpos > width + size) { 
      xpos = -size*2; 
    } 

  noStroke();
  // Draw the sun
  //stroke(255, 255, 0);
  fill(255, 255, 255);
  
  ellipse(xpos, ypos, size, size);
  ellipse(xpos - size*0.8, ypos, size, size);
  ellipse(xpos + size*0.8, ypos, size, size);
  ellipse(xpos, ypos + size*0.4, size, size);
  ellipse(xpos, ypos - size*0.4, size, size);

  } 
}

