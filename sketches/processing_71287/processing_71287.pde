
//Simon Liu, User Input, CP1 Mods 14-15

void setup()
{
  size(500,500);
}
void draw() 
{
  white
  ();
  paint();
  circle(); 
}
void white()
{
  fill(255,255,255,10);
  rect(-10,-10,600,600);
}
void circle()
{
  ellipse(mouseX,mouseY,30,30);
  ellipse(500 - mouseX,500 - mouseY,30,30);
  ellipse(500 - mouseX,mouseY,30,30);
  ellipse(mouseX,500 - mouseY,30,30);
}
void paint()
{
  keyPressed();
  //pink
  if(key == '1')
  {
    stroke(255,192,203);
    fill(255,192,203);
  }
  //green
  else if(key == '2')
  {
    stroke(0,255,0);
    fill(0,255,0);
  }
  //sky blue
  else if(key == '3')
  {
    stroke(135,206,235);
    fill(135,206,235);
  }
  //yellow
  else if(key == '4')
  {
    stroke(255,255,0);
    fill(255,255,0);
  }
  //orange
  else if(key == '5')
  {
    stroke(255,165,0);
    fill(255,165,0);
  }
  //brown
  else if(key == '6')
  {
    stroke(165,42,42);
    fill(165,42,42);
  }
  //red
  else if(key == '7')
  {
    stroke(255,0,0);
    fill(255,0,0);
  }
  //purple
  else if(key == '8')
  {
    stroke(128,0,128);
    fill(128,0,128);
  }
  //cyan
  else if(key == '9')
  {
    stroke(0,255,255);
    fill(0,255,255);
  }
  //blue
  else if(key == '0')
  {
    stroke(0,0,255);
    fill(0,0,255);
  }
  //black
  else
  {
    stroke(0);
    fill(0);
  }
}
