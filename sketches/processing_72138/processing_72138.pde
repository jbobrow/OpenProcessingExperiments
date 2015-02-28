
void setup(){
  size(500, 500);
  background(0);
  
}
void draw(){
  
}
void mouseMoved(){
  fill (random(255));
  if (mouseX>200){
    noStroke();
    ellipse (mouseX, mouseY, 20, 20);
  }
  if (mouseX<200){
    fill(random(255));
    noStroke();
    rect (mouseX, mouseY, 20, 20);
  }
}

void mouseDragged (){
  fill (0,255,0);
  rect (mouseX, mouseY, random(20), random(20));
}

void keyPressed (){
  background(0);
}
