
int x=40;
int ysol=0;
void setup ()
{
  size (200, 200);
}
void draw () {

  background (198, 226, 255); 
  fill (255, 165, 0);
  ellipse (60, ysol, 20, 20);
  ysol=ysol+1;

  fill (255, 228, 196);
  stroke (235, 200, 156);
  rect (50, 130, 100, 70);
  stroke (142, 35, 35);
  line (110, 70, 110, 90);
  int x=40;
  stroke (142, 35, 35);
  while (x<104) {
    line(x, 175-x, x+10, 170-x);
    x=x+4;
  }
  x=40;
  while (x>0) {
    line(160-x, 135-x, 150-x, 130-x);
    x=x-4;
  }
  stroke (139, 71, 38);
  fill (108, 166, 205);
  rect (70, 160, 20, 20);
  if ((mouseX>110)&&(mouseX<130)&&(mouseY>160)) {
    fill(255);
  } 
  else {
    fill (139, 71, 38);
  }
  rect (110, 160, 20, 40);
  fill (255, 228, 196);
  stroke (142, 35, 35);
  beginShape();
  vertex(50, 130);
  vertex(110, 70);
  vertex(110, 90);
  vertex(150, 130);
  endShape();
}

