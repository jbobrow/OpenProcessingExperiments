
float inc;
float rad;
float keyX;
float keyY;
float increment;

void setup() {
  size(800, 800);
  background(0);
  smooth();
  inc = 0;
  rad = 3;
}

void draw() {
  
  
  translate(width/2,height/2);
  keyX = cos(radians(inc))*rad;
  keyY = sin(radians(inc))*rad;

  module(keyX,keyY);
  
  inc += 2;
  rad += 0.1;
 
}

void module(float xPos, float yPos) {
  increment += 0.1;
  rotate(increment);
  noFill();
  stroke(random(255), random(255), random(255), 180);
  beginShape(TRIANGLE_FAN);
  vertex(xPos, yPos); 
  vertex(xPos-100, yPos-150); 
  vertex(xPos-20, yPos-180);
  vertex(xPos, yPos);
   noFill();
  stroke(random(255), random(255), random(255), 180);
  beginShape(TRIANGLE_FAN); 
  vertex(xPos, yPos);
  vertex(xPos-15, yPos-140);
  vertex(xPos+80, yPos-150); 
  vertex(xPos, yPos);
  endShape();
   noFill();
  stroke(random(255), random(255), random(255), 180);
  beginShape(TRIANGLE_FAN);
  vertex(xPos, yPos);
  vertex(xPos+30, yPos-180);
  vertex(xPos+115, yPos-140); 
  vertex(xPos, yPos); 
  endShape();
   noFill();
  stroke(random(255), random(255), random(255), 180);
  beginShape(TRIANGLE_FAN);
  vertex(xPos, yPos);
  vertex(xPos-40, yPos-100);
  vertex(xPos+30, yPos-120); 
  vertex(xPos, yPos);
  endShape();
}


