
float laser_x=0;
void setup() {
  size(600, 600);
  rectMode(CENTER);
  noStroke();
}
  
  void draw() {
 background(0);
 fill(0, 210, 0);
    rect(550, 500, 100, 50);
    rect(550, 300, 100, 50);
    rect(550, 100, 100, 50);
    triangle(500, 475, 500, 525, 450, 500);
    triangle(500, 275, 500, 325, 450, 300);
    triangle(500, 75, 500, 125, 450, 100);
  
    
    fill(255, 0, 0);
    rect(50, 100, 100, 50);
    rect(50, 300, 100, 50);
    rect(50, 500, 100, 50);
    ellipse(100, 500, 50, 50);
    ellipse(100, 100, 50, 50);
    ellipse(100, 300, 50, 50);
    fill(255, 0, 0);
  }

