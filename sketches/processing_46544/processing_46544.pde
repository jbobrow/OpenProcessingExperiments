
float xpos=0;
float ypos=0;
float xspeed=1

void setup()
    {
    size(500,500);
    smooth();
    noStroke();
    }

void draw()
    {
    background (200);
    
    if (xpos>500)
        {
        xspeed=-1
        }
        
    //every time we loop increase X by 1
    xpos+=xspeed;
   
   //draw a ball wherever the x and y positions tell us to
   ellipse(xpos, ypos, 50, 50);
   }
