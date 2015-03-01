
PImage pikachu;
color currentColor;
float prevX;
float prevY;
float thickness = 15;
int brush = 1;
int currentPikachu = 0;
float r = 0;
float s =0;


void setup()
{
 size(500,500); 
 pikachu = requestImage("pikachu.jpg");
 background(255,251,250);    
}
  
void draw(){
   if (mousePressed == true && mouseButton == RIGHT)
  {
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
          if (thickness > 50)
          {
            thickness = 15;
          }
          stroke(255,157,226);
            strokeWeight(thickness);
            strokeCap(ROUND);
             line(prevX,prevY,mouseX,mouseY);  
          }
        }
         
         
         
       if (brush == 2)
    {
      strokeWeight(thickness);
        stroke(random(252),random(38),random(5));
        ellipse(prevX, prevY, mouseX, mouseY);
    }

       
      if (brush == 3)         
      {
 
    if(pikachu.height >0)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(random(25,50));
      scale(random(2,3));
      image(pikachu,0,0,random(80,100),random(25,50));
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






