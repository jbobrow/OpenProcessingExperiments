
//Ryan S, User Imput, CP1 mods 19-20
float w=20;
float changeW=5;
void setup()
{
  size(500, 500);
  smooth();
  frameRate(40);
  noCursor();
}
void keyPressed()
{
  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  fill(random(256), random(256), random(256));
  ellipse(mouseX, mouseY, w, w);
  ellipse(500-mouseX, 500-mouseY, w, w);
  ellipse(500-mouseX, mouseY, w, w);
  ellipse(mouseX, 500-mouseY, w, w);
  w=w+changeW;
  if (w<50)
  {
    changeW=changeW+1;
  }
  if (w>50)
  {
    changeW=changeW-1;
  }
}
void draw()
{
  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  fill(random(256), random(256), random(256));
  ellipse(mouseX, mouseY, 25, 25);
  ellipse(500-mouseX, 500-mouseY, 25, 25);
  ellipse(500-mouseX, mouseY, 25, 25);
  ellipse(mouseX, 500-mouseY, 25, 25);
}
