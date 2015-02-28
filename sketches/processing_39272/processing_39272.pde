
float r = 50;
float theta = 0;

void setup() {
  size(900,450);
  background(255);
  smooth();
}

void draw() {
  
  if (mousePressed && (mouseButton == LEFT)) {
      
      float x = r * cos(theta);
      float y = r * sin(theta);
    
      noStroke();
      fill(random(255),random(255),random(255),random(255));
      
      ellipse(x+mouseX, y+mouseY, 16, 16); 
    
      theta += 1.2;
      
  }
}
