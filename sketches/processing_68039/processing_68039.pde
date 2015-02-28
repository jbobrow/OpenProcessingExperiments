

void setup()
{
  size(500,300);
  background(#FFFFFF);
  noFill(); 
  smooth();
  strokeWeight(5);
}

void draw ()
            {
  
                background(#FFFFFF);
                
                stroke(0,0,255);
                ellipse(50,50,70,70);
                
                stroke(#000000);
                ellipse(110,50,70,70);
                
                 
                stroke(255,255,0);
                ellipse(90,100,70,70);
                
                stroke(0,255,0);
                ellipse(150,100,70,70);
                
                float x=int(random(50,300));
                
                float y=int(random(30,200));
                stroke(#FF0000);
                     if((x!=90)&&(y!=30))
                     {
                       ellipse(x,y,70,70);
                     }
                     else
                     {
                       ellipse(170,50,70,70);
                       noLoop();
                     }
                
              }  

