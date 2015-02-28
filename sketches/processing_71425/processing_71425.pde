
/* @pjs globalKeyEvents="true"; */
//Julie O, CompProg 1, Mods 4/5, User Input

int eX = 1;
int eY = 2;
int r = 60;
int b = 140;
int bR = 127;
int bG = 239;
int bB = 212;

void setup()
{
  size(400,400);
  background(bR,bG,bB,240);
}

void draw()
{
  int eX = 1;
  int eY = 2;
}

void mouseDragged() //must click 1st & hold down mouse!
{
  fill(r,30,b,140);
  r = r + 1;
  if(r>150)
  {
    r = 60;
  }
  b = b + 1;
  if(b>250)
  {
    b = 140;
  }
  ellipse(mouseX,mouseY,eX,eY);
  ellipse(400-mouseX,400-mouseY,eX,eY);
  eX = eX + 2;
  if(eX>29)
  {
    eX = 1;
  }
  eY = eY + 1;
  if(eY>17)
  {
    eY = 2;
  }
}

void keyPressed()
{
  if(keyPressed == true && key == 'r') //red
  {
    background(255,0,0,240);
  }
  if(keyPressed == true && key == 'o') //orange
  {
    background(210,105,30,240);
  }
  if(keyPressed == true && key == 'y') //yellow
  {
    background(255,255,0,240);
  }
    if(keyPressed == true && key == 'g') //dark green
  {
    background(0,100,0,240);
  }
    if(keyPressed == true && key == 'p') //light pink-purple
  {
    background(216,191,216,240);
  }
    if(keyPressed == true && key == 'x') //black
  {
    background(0,0,0,240);
  }
    if(keyPressed == true && key == 'w') //white
  {
    background(255,255,255,240);
  }

}
