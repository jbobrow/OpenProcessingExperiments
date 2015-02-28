
float angle;
float speed = 0.01;

void setup() {
  size(500, 250);
  smooth();
  rectMode(CENTER);
 
}

void draw() {
  background(0);
  
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    
    strokeWeight(3);
    stroke(255, 0, 0);
    line(-width, 0, width, 0);
    stroke(0, 0, 255);
    line(0, -height, 0, height);
    noStroke();
    
    rect(0, 0, 100, 100);
  popMatrix();
  
  pushMatrix();
    translate(width/2 + 100, height/2);
    rotate(angle);
    scale(sin(angle) * 3);
    rect(0, 0, 100, 100);
  popMatrix();
  
  angle += speed;
  println(angle);
  
}
