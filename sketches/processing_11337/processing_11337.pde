
void setup()
{
  size(720,480);
  background(0);
}
int frame=0;
void draw()
{
  frame++;
  translate(360,240);
  fill(255,70,180,50);
  rotate(-0.5*frame);
  if (mouseX>400) {
    fill(255,50);

  }
  noStroke();
  triangle(-10,mouseX,10,mouseY,50,50);
}

