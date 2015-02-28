
//Drawing Tool
//GeoffMatheson
//Jan, 27, 2011


//http://www.openprocessing.org/visuals/?visualID=8231
//thanks to wen yuan for helping me understand processing draw() a little better

void setup() {
  size(900, 550);
  noStroke();
  //fill(100);
  background(0,0,0);
}

void draw() {
  fill(255,60,30);
  ellipse(mouseX,mouseY,20,20);
  fill(0,0,0,10);
  rect(0,0,900,550);
}

void mousePressed() {
  saveFrame("Pic_##");
  fill(255,255,255);
  ellipse(mouseX, mouseY, 200,200);
  
  
}

