
//slide you mouse,you will see some different
//kang yu,liu

void setup() {
  background(0);
  size(480, 480);
  smooth();
}

void draw() {
  
  if (mousePressed) {
    stroke(1);
    fill(53,108,175,100);
    
  } 
  else {
    fill(178,219,199,30);
    stroke(240,201,28);
    strokeWeight(1);
  }
  rect(mouseX, mouseY, mouseX/3, mouseY/5);
  bezier(mouseX,mouseY,60,80,200,150,40,50);
}



