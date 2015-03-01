
// Once I have more practice with drawing I can finish this snowman

// Setup
void setup(){
 size(500, 500); 
}

void draw(){
  background(0);
  stroke(0);
  strokeWeight(1);
  drawMyEllipse(250, 450, 200, 200); 
  drawMyEllipse(250, 350, 150, 150);
  drawMyEllipse(250, 250, 100, 100);
  
}

void drawMyEllipse(int x, int y, int w, int h){
  fill(255);
  ellipse(x, y, w, h);
}






