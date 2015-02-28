
void setup() {
  size(300, 300);
  background(255);
  smooth();
}


void draw() {
  background(255);

  noStroke();    
  fill(220);
  ellipse(0, 0, 220, 220);
  ellipse(width, 0, 220, 220);
  ellipse(0, height, 220, 220);
  ellipse(width, height, 220, 220);


  drawCross(mouseX-12, mouseY-12, 24, 4, 4);//croce


  noStroke();
  fill(#9CC9ED);
  ellipse(0, 0, 180, 180);
  ellipse(width, 0, 180, 180);
  ellipse(0, height, 180, 180);
  ellipse(width, height, 180, 180);
  fill(#73ADDB);
  ellipse(0, 0, 140, 140);
  ellipse(width, 0, 140, 140);
  ellipse(0, height, 140, 140);
  ellipse(width, height, 140, 140);

  drawCross(mouseX-12, mouseY-12, 6, 4, 4);//TopLeft
  drawCross(mouseX-12, mouseY+6, 6, 4, 4);//BL
  drawCross(mouseX+6, mouseY-12, 6, 4, 4);//TR
  drawCross(mouseX+6, mouseY+6, 6, 4, 4);//BR
  
  drawCross(10,10, 24, 4, 4);
  drawCross(10,height-34, 24, 4, 4);
  drawCross(width-34,10, 24, 4, 4);
  drawCross(width-34,height-34, 24, 4, 4);
  
  
}


void drawCross(float x, float y, float crossSize, int c, float w) {

  stroke(20, 135, 220);
  strokeWeight(3);
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}


