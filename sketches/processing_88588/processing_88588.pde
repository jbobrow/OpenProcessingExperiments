
void setup (){
  size (255,255);
}

void draw(){
  background (mouseX, mouseY);
  fill(255);
  strokeWeight (5);
  ellipseMode(CORNER);
  ellipse (40, 65, 51, 130);
  ellipse (92, 65, 51, 130);
  fill (mouseX, mouseY, 3);
  ellipseMode (CENTER);
  ellipse (75, 140, 10, 30);
  ellipse (110, 140, 10, 30);
  stroke (4);
  line (90, 30, 20, 80);
  line (160, 80, 100, 30);
  fill(28, 147, 234);
  strokeWeight (0);
  ellipseMode(CENTER);
  ellipse(100, 200,10,25);
  ellipse(120, 210, 10, 25);
  ellipse (105, 230, 10, 25);
}



