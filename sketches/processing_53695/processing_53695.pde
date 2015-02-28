
//Kim Sipkens
//PS2_Q4
void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(83);
  rectMode(CENTER);
  
  if(intersect(mouseX, mouseY, 210, 200, 100, 100, 150, 150)) 
  fill(100, 149, 237, 100);
  else fill(1, 0, 128);
}


boolean intersect(float x, float y, float x2, float y2, float w, float h, float w2, float h2) {
  rect(x, y, w, h);
  rect(x2, y2, w2, h2);
  
  float d = dist(x, y, x2, y2);
  if(w/2+w2/2 < d || h/2+h2/2 < d) return false;
  else return true;
}

                
                
