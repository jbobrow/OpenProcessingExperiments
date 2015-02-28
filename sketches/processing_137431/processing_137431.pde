
float timer = 0.00;
float x= 0;
float x2 = 0;
float x3 = 0;
float y = 0;
float y2 = 0;
float y3 = 0;
 
void setup()
{
  size(500,500);
}
 
void draw()
{
  background(255);
  x= x + 2;
  timer = timer + (1.0/30); 
  fill(0,150,200);
  textSize(32);
  text("Creative",(510 - x), 250);
   
  if (timer > 2)
  {
   y = y + 4;
  }
  fill(200,50,50);
  textSize(20);
  text("Boring", 160, (510 - y), 140);
   
    if (timer > 3)
    {
    x2 = x2 + 4;
    }   
    fill(0,150,200);
    textSize(34);
    text("Inspired", (510- x2), 300);
 
      if (timer > 4)
      {
      y2 = y2 + 2;
      } 
      fill(200,50,50);
      textSize(20);
      text("Stupid", 310, (510- y2), 210);
      
        if (timer > 5)
        {
        x3 = x3 + 4;
        }   
        fill(0,150,200);
        textSize(34);
        text("Naturally Skilled", (510- x3), 175);

          if (timer > 6)
          {
          y3 = y3 + 1;
          }
          fill(0,200,100);
          textSize(20);
          text("Potential", 200, (510 - y3), 200);
          
            if (timer > 7)
            {
            y = y + 1;
            }
            fill(200,50,50);
            textSize(20);
            text("Lazy", 160, (510 - y), 140);
           
            if (timer > 7)
            {
            x = x + 2;
            }
            fill(0,150,200);
            textSize(20);
            text("Knowledgeable", (510 - x), 50);
            
              if (timer > 8)
              {
              y2 = y2 + 4;
              }
              fill(200,50,50);
              textSize(20);
              text("Talentless", 160, (510 - y2), 100);
                
                if (timer > 8)
                {
                x3 = x3 + 4;
                }
                fill(0,150,200);
                textSize(20);
                text("Artistic", (510 - x3), 400);
   
   
}



