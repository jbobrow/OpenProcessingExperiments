
int brush=0;
float prevX;
float sTurn=0;
float prevY;
boolean clear = false;
void setup()
{
  background(255);
  size(600, 600);
  
}
 
void draw()
{
  if (brush ==1)
  {
    brush1();
  }
  if (brush == 2)
  {
    brush2();
  }
   if (brush == 3)
  {
    brush3();
  }
  if (clear==true)
  {
    background(255);
    clear=false;
  }
  if (brush == 0)
  {
    brush0();
  }
  
}
void keyReleased()
{
  if (key == '1')
  {
    brush = 1;
  }
  else if (key == '2')
  {
    brush = 2;
  }
  else if (key == '3')
  {
    brush = 3;
  }
  else if (key == 'c')
  {
    clear=true;
  }
   else if (key == '0')
  {
    brush=0;
  }
}

void brush1()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      
    //  colorMode(HSB);
        strokeWeight(10);
        stroke(random(255), 100, 100);
        line(prevX, prevY, mouseX, mouseY);
      
    }
  }
   prevX = mouseX;
  prevY = mouseY;
}
void brush2()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      
    //  colorMode(HSB);
        strokeWeight(10);
        stroke(random(255), 0, random(255));
        line(prevX+20, prevY+20, mouseX+20, mouseY+20);
        line(prevX-20, prevY-20, mouseX-20, mouseY-20);
        line(prevX+40, prevY+40, mouseX+40, mouseY+40);
        line(prevX-40, prevY-40, mouseX-40, mouseY-40);
        line(prevX, prevY, mouseX, mouseY);
      
    }
  }
   prevX = mouseX;
  prevY = mouseY;
}
void brush3()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      fill(random(255),random(255), 0, 128);
        noStroke();
       ellipse(mouseX, mouseY, 40, 40);
       // pushMatrix();
      //translate(mouseX,mouseY);
        strokeWeight(1);
      // rotate(sTurn);
        triangle(mouseX-100,mouseY-100,mouseX-20,mouseY-20,mouseX,mouseY-100);
        rect(mouseX, mouseY, 60, 60);
 //  popMatrix();
   pushMatrix();
      translate(mouseX,mouseY);
        strokeWeight(1);
      // rotate(sTurn);
      fill(random(255),random(255), random(255));
             ellipse(mouseX, mouseY, 40, 40);
             rect(mouseX, mouseY, 60, 60);

        triangle(mouseX-100,mouseY-100,mouseX-20,mouseY-20,mouseX,mouseY-100);
    popMatrix();
       
    }
  }
}
void brush0()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
       pushMatrix();
       fill(255);
       noStroke();
      translate(mouseX,mouseY);
        strokeWeight(1);
       rotate(sTurn);
        rect(mouseX,mouseY,80,80);
   popMatrix();
    }
  }
  sTurn += .09;
}


