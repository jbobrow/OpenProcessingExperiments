
int dragL;
int dragA;
void setup(){
  size (400, 400);
  background(#454142);
}
void draw(){
  fill(#000000);
  ellipse(dragL, dragA, 100, 100);
  ellipse(dragL, dragA, 80, 80);
  ellipse(dragL, dragA, 60, 60);
  ellipse(dragL, dragA, 40, 40);
  ellipse(dragL, dragA, 20, 20);
  fill(#FFFFFF);
  textSize(20);
  text("WAR", dragL, dragA);
  fill(#05ACFF);
  textSize(13); 
  stroke(#A11212); 
  strokeWeight(5);
  text("LOVE", mouseX, mouseY); 
  fill(#DDEB96);
  textSize(25);
  text("♥", mouseX, mouseY-20);
}

void mouseDragged(){
dragL=mouseX;
dragA=mouseY;
}


