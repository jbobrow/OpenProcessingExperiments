
PImage littlemouse;
PImage colorwheel; 
color brushColor;



void setup()
{
size (600, 600);
littlemouse = requestImage("littlemouse.jpeg");
colorwheel = requestImage("colorwheel.png");
background(116, 193, 206);
}

void draw ()
{  
  
  
  if (colorwheel.width > 0)
  {
  imageMode(CENTER);
  image(colorwheel, 500, 500, 150, 150);
  
  }
  if(mousePressed == true)
    {
      if (mouseButton == RIGHT)
        {
          
          
          brushColor = get(mouseX, mouseY);
        }
      if(mouseButton == LEFT)
        {
        line(mouseX, mouseY, pmouseX, pmouseY);
        stroke(brushColor);
        strokeWeight(10);
        }
       if(keyPressed)
          {
            //crazy rectangles
          if(key == '4')
            {
            
            rect(mouseX + random(50), mouseY + random(50), 25, 25);
            stroke(brushColor);
            strokeWeight(0);
            }
          if(key == '0')
          //spray paint
          {
            ellipse(mouseX + random(20), mouseY + random(20), 8, 8);
            stroke(brushColor);
            strokeWeight(0);
          }
          if(key == '3')
          //triangle
          {
          stroke(brushColor);
          strokeWeight(0);
          fill(brushColor);
         translate (mouseX, mouseY);
         triangle(25, 25, 50, 50, 0, 50);
          }
          if (key == ' ')
          //a stamp
          {
          image (littlemouse, mouseX, mouseY, 150, 150);
          }
          if (key == 'z')
          //a crazy stamp
          {
          image (littlemouse, mouseX, mouseY, 150, 150);
     
          littlemouse.filter(INVERT);
          }
          } 
      
    }
}


