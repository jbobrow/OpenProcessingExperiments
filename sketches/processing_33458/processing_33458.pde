
void setup(){
  size (700,400);
  background (0);
}

void draw (){
  fill (255);
  noStroke();
  
  ellipse (355, 200, 30, 30);
  fill (255); 
  
  ellipse (300, 150, 50, 50);
  ellipse (400, 150, 50, 50);
  float leftEyePos = map (mouseX, 0, width, 275, 325);
  float rightEyePos = map (mouseX, 0, width, 375, 420);
  fill (0,0,0);
  
  ellipse (leftEyePos, 150, 20, 20);
  ellipse (rightEyePos, 150, 20,20);
  float lidPos = map (mouseY, 0, height, 0, 400);
  rect(0, 0, width, lidPos);
  
}


