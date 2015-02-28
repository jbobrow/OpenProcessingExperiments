
// adapted by Rupert Russell from
// Position and Direction
// http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-08.pdf
// by: by Rob Saunders


float angle = 0.0; // Direction of motion
float speed = 0.5; // Speed of motion

  float x = width /2; // X-coordinate
  float y = height /2; // Y-coordinate
  
  
void setup() {
   x = width /2; // X-coordinate
   y = height /2; // Y-coordinate
  size(250, 250);
  background(0);
  stroke(255, 130);
  randomSeed(121); // Force the same random values
}
void draw() {

  angle += random(-0.3, 0.3);
  x += cos(angle) * speed; // Update x-coordinate
  y += sin(angle) * speed; // Update y-coordinate
  translate(x, y);
  rotate(angle);
  line(0, -10, 0, 10);
  
  if (x > width || x < 0){
      x = width /2; // X-coordinate
      y = height /2; // Y-coordinate
      stroke(random(255),130);
  }
  
    if (y > height || y < 0){
      x = width /2; // X-coordinate
      y = height /2; // Y-coordinate
      stroke(random(255),130);
  }
  
}

void mouseClicked() {
  x = width /2; // X-coordinate
  y = height /2; // Y-coordinate
  stroke(random(255),130);
}
