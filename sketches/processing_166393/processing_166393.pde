
void setup() {
background(200);
size (500,500);
rectMode(CENTER);
}


void draw () {
  //background(200);
  fill(200,10);
  rect(width/2,height/2,width,height);
  
  if (mousePressed) {
    fill(255);
    rect(mouseX,mouseY,40,40);
  }
  else {
    fill(255);
    ellipse(mouseX,mouseY,40,40);
  }
}
