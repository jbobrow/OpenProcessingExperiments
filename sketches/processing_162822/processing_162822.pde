
void setup() {
  size(700, 700);
}
void draw() {
  background(255);
  drawStickfigure(mouseX, mouseY);
  }

void drawStickfigure(int x, int y) {
  fill(70);
 
   ellipse(width/2,125,50,50);
  fill(0,0,0);
  ellipse(width/2-25,100,30,30);
   fill(0,0,0);
  ellipse(width/2+25,100,30,30);
  strokeWeight(10);
  line(width*.5, height*.22, width*.5, height*.65);
  line(width*.5, height*.35, width*.65, height*.45);
  line(width*.5, height*.35, width*.35, height*.45);
  line(width*.5, height*.65, width*.40, height*.82);
  line(width*.5, height*.65, width*.60, height*.82);
}

