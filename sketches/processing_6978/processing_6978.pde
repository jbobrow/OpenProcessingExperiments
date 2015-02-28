
void setup(){
 size(640, 480); 
 smooth();
 noCursor();
}

void draw(){
  float color1 = random(0,255);
  float color2 = random(0,255);
  float color3 = random(0,255);
  if(mousePressed){
    background(color1, color2, color3);
  }
  else{
  fill(color1, color2, color3);
  ellipse(mouseX, mouseY, mouseX-150, mouseX-150);
  ellipse(width-mouseX, height-mouseY, mouseX-150, mouseX-150);
  }
}

