
/**
 * Assignment #4 : Chart Sketching <br>
 * <br><br>
 *
 * Michelle Phung<br>
 * Feb 23, 2015<br><br>
 * <br><br>
 *
 * Introduction to Interactive Data Visualization<br>
 * New York University
 */
 
 int [] categories = new int [360];
 
 void setup () {
   size(780,435);
   background(randomColor());
   frameRate(3);
 }
 
void draw () {
   
  int angle = 360 / categories.length;
  
  for (int i = 0; i < categories.length; i++) {
    fill(randomColor());
    drawBar(width/2,height/2, i); 
  }
}
 
color randomColor () {
  return color(random(255),random(255),random(255));
}

void drawBar (float centerx, float centery, int i) {
  int r = 60; //innerDistanceFromCenter
  int R = 200; //outerDistanceFromCenter
  int angle = (360 / categories.length) ;
  
  int ax = floor(r),
      ay = floor(0),
      bx = floor(R),
      by = floor(0),
      cx = floor( (R * cos(getRad(angle)))),
      cy = floor( (R * sin(getRad(angle)))),
      dx = floor( (r * cos(getRad(angle)))),
      dy = floor( (r * sin(getRad(angle))));
  
  //noStroke();
  strokeWeight(1);
  stroke(randomColor());
  ellipse(centerx,  centery, 10, 10);
  pushMatrix();
  translate(centerx,  centery);
  rotate(getRad(angle) * i);
  beginShape();
  vertex(ax, ay);
  vertex(bx, by);
  vertex(cx, cy);
  vertex(dx, dy);
  endShape();
  popMatrix();
}
 
float getRad (float deg) {
  return map(deg, 0, 360, 0, 2 * PI);
}


