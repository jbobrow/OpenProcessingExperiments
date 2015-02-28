
 
float r = 0; //hey playgramming! this is a VARIABLE used to control the rotation
float s = 0;
float counter = 0;

float hue = 0.0;
float offset = 10;

void setup() 
{
  size(400, 400);
}
 
void draw() 

{ 
  counter += 1;
  
   background(0);
   
   pushMatrix();
   fill(227,30,30);
   if (s >= 300)
    {
      s = -s;
    }
   else if (s < 0 || s < 300)
    {
      s = s + 2;
    }
   ellipse(width/2, height/2, s, s);
   popMatrix();
   
   if (counter <= 250)
   {
     r = r + 0.1; 
   }
   else if(counter > 250)
     {
       r = r - 0.1;
     }
   if (counter > 100)
   {
  
    pushMatrix(); 
    translate(200,200);  
    rotate(r); 
    fill(31,29,152);
    rect(-25,-25,50,50); 
    popMatrix(); 
    
   }
     if(counter > 170)
     {
     drawEllipse();
     }
     
   
}

float ellipseX = 0.0;

void drawEllipse()
{
  ellipseX += 1;
  hue += offset;
  rotate(r);
   if (ellipseX > width)
  {
    ellipseX = -ellipseX;
  }

  if (hue >= 360)
  {
    offset = -offset;
  }
  else if (hue < 0)
  {
    offset = -offset;
  }
  fill(hue, 100, 100);
  float ellipseY = 250 * sin(radians(ellipseX * 2));
  ellipse(ellipseX, ellipseY, 100, 100);
}


