
int x = 500;
int y = 500;
  
void setup() {
  size(500,500);
  ellipseMode(CENTER);
  frameRate(25);
}
   
void draw() {
  background(255, 215, 0);
    
//Eyes
  fill(255);
  ellipse(x/2 - 80, y/2, 150, 110);
  ellipse(x/2 + 80, y/2, 150, 110);
    
float x1 = map(mouseX, 0, width, 145, 195);
float y1 = map(mouseY, 0, height, 225, 275);
float x2 = map(mouseX, 0, width, 305, 355);
float y2 = map(mouseY, 0, height, 225, 275);
     
//eyeball
  fill(85, 107, 47);
  ellipse(x1, y1, 55, 45);
  ellipse(x2, y2, 55, 45);
     
//pupil
  fill(0);
  ellipse(x1, y1, 30, 30);
  ellipse(x2, y2, 30, 30);
}



