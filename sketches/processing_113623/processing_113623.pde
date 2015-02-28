
float a = 150;
float b = 210;
float c =385;
float e=260;
float radius=110;
 
void setup() {
  size( 600, 600);
  smooth();
  
}
 
void draw() {
  background(255);
 
  noStroke();
 
 
  //backgorund random
 
  if (mousePressed) {
 
 
    for (int x = 0; x<width; x +=10) {
 
      for (int y = 0; y<height; y+=20) {
      strokeWeight(random(10));
  stroke (random(255), random(255), random(255));
point ( random(width), random(height));

fill(random(255), random(255), random(255));
rect(random(width), random(height), random(50), random(50));
ellipse (random (width), random(height), random(20), random(20));
      }
    }
  }
 
 
 
  // RECTANGLE
  if ((mouseX >= a) && (mouseX <= a+100) &&
    (mouseY >= b) && (mouseY <= b+120)) {
    fill (0, 174, 179);
  }
  else {
    fill(0, 174, 179);
    rect(a, b, 100, 100);
  }
  if ((mouseX >= a) && (mouseX <= a+100) &&
    (mouseY >= b) && (mouseY <= b+120)) {
    fill(random(255), random(255),random(255));
    triangle(a+50, b, a+100, b+100,a,b+100);
     
       
 
     
  }
  //ELLIPSE
 
  float d = dist(mouseX, mouseY, c, e);
  if (d<=radius) {
    fill(55, 0, 255 );
  }
  else {
    fill(247,22,22);
  }
  if (keyPressed) {
    noFill();
    strokeWeight(90);
    stroke(0);
  }
  ellipse(c, e, radius, radius);
}



