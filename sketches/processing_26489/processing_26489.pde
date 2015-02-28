
float y = 100;  

void setup() {   
  size(200, 200);  
  smooth();  
}   


void draw() {   
  background(255);  
  float r = random(1);  
  if (r < 0.1) {
    y--;
  } else if (r < 0.3) {
    y++;
  } 
  stroke(0);
  fill(175);
  ellipse(width/2, y, 16, 16);  
}

