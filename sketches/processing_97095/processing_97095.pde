
int i=0;

void setup () {
  size(200, 200); 
  background(64, 224, 208);
}
void draw () {
  
  stroke(0);
  background(64, 224, 208);
    fill(255, 255, 255);
  ellipse(mouseX, mouseY, 40, 10);
  fill(255, 245, 36);
  ellipse(160, i, 60, 60);
  i=i+1;

  fill(44, 142, 56);
  rect(0, 180, 200, 20);

  fill(216, 179, 142);
  rect(60, 20, 80, 160);

  fill(143, 50, 17);
  rect(90, 30, 20, 140);

  int x;
  int y;

  fill(156, 208, 236);
  for (x=65;x<136;x=x+50)
  {
    for (y=35;y<126;y=y+30)
    {
      rect(x, y, 20, 20);
    }
  }

  fill(140, 48, 12);
  rect(25, 160, 5, 20);
  fill(39, 135, 62);
  ellipse(27.5, 145, 30, 30);
}
