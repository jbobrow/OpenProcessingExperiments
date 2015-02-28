
//Seiji Hall
//7/8/13
//Suprised Face
//DMA Code

void setup(){
  size(500, 500);
  smooth();
  strokeWeight(30);
}

void draw(){
  background(204);
  stroke(102);
  if(mousePressed) {
    stroke(1);
  } else {
    stroke(225);
  }
  ellipse(mouseX-20, mouseY-20, 9, 9);
  ellipse(mouseX+20, mouseY-20, 9, 9);
  ellipse(mouseX, mouseY+35, 18, 18); 
}
