
void setup() {  //setup function called initially, only once
  size(300, 300);
}

void draw() {  //draw function loops 
  background(255);
  Checker(0,0);
  noStroke();
  fill(random(255),150,255,100);
  if(mouseX<150 && mouseY<150) { 
    ellipse(mouseX, mouseY, 20, 20);
  }
  fill(200,0,random(200),100);
  if(mouseX>150 && mouseY<150) {
    rect(mouseX, mouseY, 40, 40);
  }
  fill(255,random(75,155),100,100);
  if(mouseX<150 && mouseY>150) { 
    ellipse(mouseX, mouseY, 40,40);
  }
  fill(random(250),200,175,100);
  if(mouseX>150 && mouseY>150) { 
    rect(mouseX, mouseY, 20,20);
  }
}
void Checker(int x, int y){
  smooth();
  fill(0);
  rect(150,0,150,150);
  rect(0,150,150,150);
}
