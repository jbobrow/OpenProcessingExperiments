
void setup() {
  size(400,400);
  background (255);
  //frameRate();
  smooth ();
  colorMode(RGB);
}

void draw () {
  
  if(mousePressed) {
  fill(0, 20);
  rect(0,0,width, height);
  fill (255,0,0);
  noStroke();
  ellipse(mouseX,mouseY, mouseX, mouseX);
  }
  else {
  fill (255, 20); 
  rect(0,0,width, height);
  }
  
}
