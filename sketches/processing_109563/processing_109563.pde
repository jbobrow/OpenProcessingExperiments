
float x,y,w,h;
 
 void setup()
{
  size(400,400);
  frameRate(15);
  
  x=width *.2;
  y=height*.2;
  w=width *.2;
  h=height*.2;
}
 
 void draw()
{
  noStroke();
   background(255);
   
   //myDiameter+=20;
   
   ellipse(mouseX,mouseY,w,h);
 
   ellipse(mouseX,mouseY,w*.5,h*.5);
   if (mousePressed)
   {w=width *.2;
    h=height*.2;}
   
      

  
}

  void keyPressed()
  {
  
   if(keyCode==UP)
  {h=h+11;}
  else if (keyCode==DOWN)
  {h=h-10;}
  else if(keyCode==RIGHT)
  {w=w+10;}
  else if(keyCode==LEFT)
  {w=w-10; }
  }

   void mouseMoved()
   {fill( random(255), random(255), random(255));}
