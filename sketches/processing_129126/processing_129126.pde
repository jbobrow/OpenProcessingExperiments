
PImage myimage;
PImage myimage2;

//float opacity = 0;

void setup()
{
  size(500, 500);
  myimage= requestImage ("animal.jpg");
  myimage2= requestImage ("smallcat.jpg");
  //strokeWeight(3);
  //smooth();
}

void draw()
{
    if (myimage.width > 0)
    {
      myimage.filter(GRAY);
      myimage.filter(INVERT);
      image(myimage, 0, 0, width, height);
    }
   
    if (myimage2.width > 0)
    {
     image(myimage2, 75, 400, 75, 75);
    }  
     
   filter (POSTERIZE, 4);
    stroke (#00FF7F);
    strokeWeight(2);
    
    
   // ellipse (425, 175, 30, 30);
   //ellipse (445, 195, 20, 20);
   // ellipse (455, 165, 10, 10);
   // ellipse (420, 145, 10, 10);
   // ellipse (465, 135, 25, 25);
   // ellipse (415, 105, 30, 30);
    noFill ();
    
    triangle (100, 65, 80, 95, 50, 50);
    triangle (80, 95, 85, 135, 45, 120);
    triangle (85, 135, 105, 155, 65, 180);
    
    triangle(380, 65, 400, 95, 430, 50);
    triangle(400, 95, 395, 135, 435, 120);
    triangle(395, 135, 375, 155, 415, 180);
    //background (#00FF7F);
   if (mouseX > 400)
   {
      tint(255, 0, 0);
   }
   else
   {
     noTint();
   }
  
}






