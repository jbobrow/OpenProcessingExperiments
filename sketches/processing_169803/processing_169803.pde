
/*
------- HOW TO USE THIS -------
- paint by clicking and holding with your mouse
- paint your brush in another colour by pressing:
    r - red
    g - green
    b - blue
    e - erase / black
    any other key - white with black outline - draw different shades of grey by altering your mouse speed
- you can clear your working space by pressing space
*/

//circle declaration

int whiteboxSize=25;

void setup()
{
  size(1600,900);
  background(0);
}

void draw()
{
    //clear
    if (keyPressed) 
        {
         if(key == ' '|| key == ' ') 
           {
             background(0);
           }
        }
                
    //draw or not
    if (mousePressed == true) 
      {
          rotate(0);
      }
    else 
      {
          rotate(PIE);
      }
    
    //colour (black)
    if (keyPressed) 
      {
         if(key == 'e'|| key == 'E')
           {
             fill(0);
             noStroke();
           }
      } 
    else 
      {
         if(mousePressed == true) 
           {
             stroke(255);
             fill(255);
           }
         else 
           {
             stroke(0);
             fill(255);
           }
      }
         
     //colour (red)
     if (keyPressed) 
       {
         if(key == 'r'|| key == 'R')
           {
             fill(255,0,0);
             noStroke();
           }
         
       } 
     else 
       {
         if(mousePressed == true)
           {
             stroke(255);
             fill(255);
           }
         else 
           {
             stroke(0);
             fill(255);
           }
       }
                
     //colour (blue)
     if (keyPressed) 
       {
         if(key == 'b'|| key == 'B') 
           {
             fill(0,0,255);
             noStroke();
           }  
       } 
     else 
       {
         if(mousePressed == true)
           {
             stroke(255);
             fill(255);
           }
         else 
           {
             stroke(0);
             fill(255);
           }
       }
                 
     //colour (green)
     if (keyPressed) 
       {
         if(key == 'g'|| key == 'G') 
           {
             fill(0,255,0);
             noStroke();
           }
         
       }
     else 
       {
         if(mousePressed == true) 
           {
             stroke(255);
             fill(255);
           }
         else
           {
             stroke(0);
             fill(255);
           }
       }
       
     ellipse(mouseX,mouseY,whiteboxSize,whiteboxSize);
}
