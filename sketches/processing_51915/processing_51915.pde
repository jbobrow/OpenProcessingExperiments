
float c = 0;
int x = 0;
int y =0;
void setup()
{
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  frameRate(200);
}
void mouseDragged()
 
{
  fill(c,c,c);
  ellipse(mouseX, mouseY,50,50);
 
}

void keyPressed()
{
  if (key=='c')
  {c=random(0,255);}
}
void draw()
{
  stroke(random(255),random(255),random(255));
  fill(random(255), random(255), random(255));
  rect(random(600), random(600), 3, 3);
  ellipse(random(600),random(600),3,3);
  if (key=='s')
  {
  noStroke();
    fill(0,0,0);
    rect(random(600), random(600),50,50);


  }
}

