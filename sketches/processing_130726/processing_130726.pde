
/* @pjs preload="colorCircle.png"; */
float rad = 0.0;
float s = 1.0;
color brushColor;
PImage myimage;

void setup()
{
  size(500, 500);
  myimage = requestImage("colorCircle.png");
  
 
}

void draw()
{
  //rad = rad + 0.1;
  colorMode(HSB);
  image(myimage, 0, 0, 100, 100);
  fill(brushColor);
  
  if (mousePressed == true)
  {
    if (mouseButton == CENTER)
    {
      brushColor = get(mouseX, mouseY);
    }
    if (mouseButton == LEFT)
    {
       fill(random(255), random(255), random(255));
    }
    if (mouseButton == RIGHT)
    {
      fill(brushColor);
    }

    
   pushMatrix();
   translate(mouseX-65, mouseY-60);  
   rotate(rad);
   scale(s);
   triangle((30), (75), (58), (20),  (86), (75));
   popMatrix();


  }
  
 if (keyPressed)
 {
   if (key == '1')
   {
     s = s + 0.1;
   }
   if (key == '2')
   {
     if (s > 0.1)
     {
       s = s - 0.1;
     }
   }
   if (keyCode == RIGHT)
   {
     rad = rad + 0.1;
   }
   if (keyCode == LEFT)
   {
     rad = rad - 0.1;
   }

 }
}


