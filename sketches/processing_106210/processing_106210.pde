
float angle = 0.0;
float red = 20;
float blue = 20;
float triX = mouseX + 20;
float triY = mouseY + 20;

void setup() {
  size(400, 400);
//  stroke(0);
  frameRate(24);
  background(200, 200, mouseX + 50, mouseY);
  
}

void draw() {
  
  translate(mouseX, mouseY);
  
  
  for (int i = 0; i < width; i += 10) {
    tri(triX + i, triY, red, blue, (dist(pmouseX, pmouseY, mouseX, mouseY)/24));
  }
    
  
  if (mouseX > 200) {
    red += 5;
    blue -= 5;
  }else{
    red -= 5;
    blue += 5;
  }
  
}

// tri(x, y, red colour, speed)
void tri(float x, float y, float z, float q, float speed) {
  fill(z, 0, q);
  rotate(angle);
  triangle(x, y, x + 10, y + 20, x + 20, y + 10);
  angle += speed;
 
} 

void mousePressed() {
  stroke(0);
}


