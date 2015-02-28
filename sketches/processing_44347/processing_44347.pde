
void setup() {
  size(600, 600);
  smooth();
  

}


 void draw(){

drawCross();}

void drawCross(){   
  fill(255);
  rect(0, 0, width, height);
  fill(0);
  ellipse(0, 0, 200, 200);
  ellipse(600, 0, 200, 200);
  ellipse(0, 600, 200, 200);
  ellipse(600, 600, 200, 200);
noStroke();
  fill(#E500FF);
  ellipse(mouseX, mouseY, 100, 100);
}


