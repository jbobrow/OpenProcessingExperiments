
boolean filler=false;
float sBig=1;
float sTurn=0;
color cColor;
PImage cchoice;
void setup()
{
  size(500,500);
  cchoice= requestImage("color.jpg");
}

void draw()
{
  if (cchoice.width > 0)
  {
    image(cchoice, 0, 0, 100, 100);
  }
color101();
cColor=get(mouseX, mouseY);
}

void paintbrush()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX,mouseY);
        strokeWeight(1);
       rotate(sTurn);
        triangle(mouseX,mouseY,mouseX+10,mouseY+10,mouseX+20,mouseY);
   popMatrix();
  }
  }
      
}
void keyReleased()
{
  if (key == 'f' && filler==false)
  {
    filler=true;
  }
  else if (key == 'f' && filler == true)
  {
    filler =false;
  }
  if (keyCode == LEFT)
    {
      sTurn += .09;
    }
   else if (keyCode == RIGHT)
    {
      sTurn -= .09;
    }
    if (keyCode == UP)
    {
      sBig += 1;
    }
   else if (keyCode == DOWN )
    {
      sBig -= 1;
    }
}
void color101()
{
  if (filler==false)
  {
    fill(100);
     if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      
            pushMatrix();
            translate(mouseX,mouseY);

        strokeWeight(1);
        scale(sBig);
       rotate(sTurn);
       triangle(0, -40, -20, 0, 20, 0);
       // triangle(mouseX,mouseY,mouseX+30,mouseY+30,mouseX+50,mouseY);
   popMatrix();
    
  }
  }
      
    
  }
  else if (filler == true)
  {
    noFill();
     if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
            pushMatrix();
            translate(mouseX,mouseY);

      
        strokeWeight(1);
       rotate(sTurn);
       scale(sBig);
       triangle(0, -40, -20, 0, 20, 0);
       // triangle(mouseX,mouseY,mouseX+30,mouseY+30,mouseX+50,mouseY);
   popMatrix();
   
  }
  }
      
  }
}



