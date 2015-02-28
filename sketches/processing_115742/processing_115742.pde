
PImage paletteImage;
PImage bat;
color currentColor;
float prevX;
float prevY;
float thickness = 1;
int brush = 1;
int currentBat = 0; 
float r = 0;
float s =0;
 
void setup()
{
 size(1000,1000);
  
 paletteImage = requestImage("palette.png");
 bat = requestImage("bat.fw.png");
   
     background(255);
   
}
 
void draw()
 
{
 
  if (paletteImage.width > 0)
  {
    image(paletteImage,0,0,100,100);
  }
   
  if (mousePressed == true && mouseButton == RIGHT)
  {
    
  if (paletteImage.width > 0)
  {
    image(paletteImage,0,0,100,100);
  }
    background(255);
  }
   
  if (mousePressed == true)
 { 
    if(mouseButton == LEFT){
         if (brush == 1)
        {
  
              if (overRect(0,0,100,100) == true)
            {
                currentColor = get(mouseX, mouseY);
            }
              else
        {
            thickness = thickness +1;
          if (thickness > 15)
          {
            thickness = 1;
          }
          stroke(red(currentColor), green(currentColor), blue(currentColor));
            strokeWeight(thickness); 
            strokeCap(ROUND);
             line(prevX,prevY,mouseX,mouseY);
 
          }
        

        }
        
        if (brush == 2)
        {
          
              if (overRect(0,0,100,100) == true)
            {
                currentColor = get(mouseX, mouseY);
            }
              else
        {
          thickness = thickness +1;
          if (thickness > 15)
          {
            thickness = 1;
          }
          rectMode(CENTER);
          fill(red(currentColor), green(currentColor), blue(currentColor),random(80,128));
            stroke(0);
            strokeWeight(thickness);
            pushMatrix();
            translate(mouseX, mouseY);
            rect(0,0,random(1,100),random(1,100));
           popMatrix(); 
 
          }
          
        }
     
      
      if (brush == 3)          
      {

    if(bat.height >0)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(random(5,50));
      scale(random(1,4));
      image(bat,0,0,random(25,150),random(5,50));
      popMatrix();
    }
 
      }
 
  }      
    }
prevX = mouseX;
prevY = mouseY;
}
 
void keyReleased()
{
   if (key == '1')
   {
     brush = 1;
   }
   
   if (key == '2')
   {
    brush = 2; 
   }
   
   if (key == '3')
   
   {
    brush = 3;  
   }
   
}
 
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}




