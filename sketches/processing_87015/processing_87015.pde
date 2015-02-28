
float r = 0;
float theta = 0;

void setup() {
  size(800,800);
  smooth();
     background(0);
       noStroke();
  fill(255);
  ellipse (450, 350, 750, 750);
}

void draw() {

  // Draw an ellipse at x,y
  noStroke();
  fill(0);
  // Adjust for center of window
  
  float x = r * cos(theta)*2.6;
float y = r * sin(theta)*2.6;
  ellipse(x+width*0.7, y+height*0.35, r*1.2, r*1.2); 
 
  // Increment the angle
  theta += 12;
  // Increment the radius
  r += 5;
}
