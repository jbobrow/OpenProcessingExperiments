
int circX;
int circY;

int radpink;
int radwhite;

int recstroke;

void setup() {
  size(1000, 1000);
  smooth();
  
  circX = width/2;
  circY = height/2;
  
  radpink = 15;
  radwhite =15;


recstroke = 50;
  
}
  
  
void draw() {
  
  noStroke();
  fill(50, 50, 100);
  rect(0, 0, width, height);
  
  fill(20, 255, 100);
  ellipse(circX, circY, 30, 30);
  
  fill(255, 100, 255);
  ellipse(mouseX, mouseY, 30, 30);
  
  float distance = dist(circX, circY, mouseX, mouseY);
  
  
 if(distance <= radpink +15 && distance <= radwhite + 15){ 
  strokeWeight(recstroke += 1);
  stroke(255, 0, 0);
  noFill();
  rect(0, 0, width, height);
  
 }
  
  if(recstroke >= 1000) {
  recstroke = 0;
  
 
 } 
}

void keyPressed() {

if(keyCode == DOWN) {
  circY += 100;
}
  if(keyCode == UP) {
    circY -= 100;
  }
  
  if(keyCode == LEFT){
    circX -= 100;
  }
  
  if(keyCode==RIGHT){
    circX += 100;
  }
  
  if(mouseX == circX && mouseY == circY){
    background(255, 0, 0);
  }
  
  
  
  }

