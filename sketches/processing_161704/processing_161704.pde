
/************************
 * Assignment << 2 >>
 * <<Melissa Thomas >>
 *CSC 103 - Creative Computing - Fall 2014
 *<<<Septemeber 10, 2014>>>
 * <<< flower with sun and cloud>>>
 ************************/


float cloudX;
float cloudY;

void setup() {
  size (500, 500);
  
  cloudX = 285;
  cloudY = 215;
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
} // star function from processing.org

void draw() {
  background (27, 223, 247);

  noStroke ();
  fill(255, 188, 0);
  star (275, 150, 75, 160, 15);
  fill (255, 255, 0);
  ellipseMode(CENTER);
  ellipse (275, 150, 125, 125);// sun

  drawCloud(cloudX, cloudY);
  drawCloud(cloudX + 500, cloudY);
  
  cloudX = cloudX - random (.1-1);
 
  if (cloudX < -200) cloudX = cloudX + 500;
 
  drawCloud (cloudX - 125, cloudY - 150);
  drawCloud (cloudX + 375, cloudY - 150);
  
  drawCloud (cloudX - 200, cloudY + 100);
  drawCloud (cloudX + 300, cloudY + 100); 
  
  
 // if (cloudX < -200) cloudX = cloudX + 375;
 
//println(cloudX); 
 

  noStroke ();
  fill (0, 255, 0);
  rect(0, 450, 500, 50); //GRASS
  rect(100, 325, 15, 150); //STEM
  ellipseMode(CORNER);
  ellipse(81, 415, 55, 10); // leaf

  noStroke ();
  fill (255, 0, 196);
  star (112, 340, 15, 60, 14);
  fill (255, 26, 0);
  star (112, 340, 13, 58, 12);
  fill (207, 0, 255);
  star (112, 340, 11, 56, 10);
  fill (0, 0, 255);
  star (112, 340, 9, 54, 8);
  fill (255, 255, 0);
  ellipseMode(CENTER);
  ellipse (112, 340, 15, 15);//flower
}



void drawCloud(float x, float y) {
  noStroke ();
  fill (255);
  ellipseMode(CENTER);
  ellipse (x, y, 100, 100);
  ellipse (x + 75, y - 10, 100, 100);
  ellipse (x + 150, y - 20, 100, 100);
  ellipse (x + 30, y - 30, 100, 100);
  ellipse (x + 110, y - 40, 100, 100); //cloud
}



