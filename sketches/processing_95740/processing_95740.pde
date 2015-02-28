
float f1x=100;
float f1y=200;

float f2x=300;
float f2y=200;
  
float wide=f2x-f1x;

float f3x=300;
float f3y=300;

float f4x=100;
float f4y=300;
float high=f4y-f1y;
  
float vx=75;
float vy=25;
  
float b1x;
float b2x;
float b1y=150;
float b2y=b1y;
float dy=b1y-f1y;
  
float slopeLeft;
float slopeRight;
float dxLeft;
float dxRight;

float dx;
float slopeBotRight;
  
  
void setup()
{
  size(400,400);
}

void draw()
{
  //clear screen
  background(255);
  
  //draw vanishing point
  ellipse(vx,vy,5,5);
  
  // draw red front square 
  fill(247,12,12,125);
  rect(f1x,f1y,wide,high);
  
  /*calculate backTopLeft Vertex*/
  slopeLeft=(vx-f1x)/(vy-f1y); //(run/rise)...this give amount to move over per amount moved up
  dxLeft=slopeLeft*dy; //this gives the amount the left top edge has to move over as it rises up the screen
  b1x=f1x+dxLeft; // gives x coordinate of back, top, left vertex if depth is represented by dy
 
  //calculate backTopRight Vertex
  slopeRight=(vx-f2x)/(vy-f2y);
  dxRight=slopeRight*dy;
  b2x=f2x+dxRight;
  //Draw top quadrilateral
  fill(56,145,222);
  quad(f1x,f1y,b1x,b1y,b2x,b2y,f2x,f2y);

  //calculate and draw right side
  slopeBotRight= (vy-f3y)/(vx-f3x); //this slope is change in y per change in x
  dx = b2x-f3x;
  float b3x=b2x;
  float dyBotRight=slopeBotRight*dx;
  float b3y=f3y+dyBotRight;
  fill(69,227,34,125);
  quad(f2x,f2y,f3x,f3y,b3x,b3y,b2x,b2y);
  
  //calculate and draw left side
  float slopeBotLeft= (vy-f4y)/(vx-f4x); //this slope is change in y per change in x
  dx = b1x-f4x;
  float b4x=b1x;
  float dyBotLeft=slopeBotLeft*dx;
  float b4y=f4y+dyBotLeft;
  fill(213,34,227,125);
  quad(f1x,f1y,f4x,f4y,b4x,b4y,b1x,b1y);
  

  //draw back, bottom edge
  line(b4x,b4y,b3x,b3y);
  


  

  if (keyPressed)
  {
    char letter = key;
    
    switch(letter)
    {
      case 'a':
        vx=vx-1;
        break;
      
      case 'd':
        vx=vx+1;
        break;
        
      case 'w':
        vy=vy-1;
        break;
      
      case 's':
        vy=vy+1;
        break;
       
        
    }
    
    if(vx>width)
    {
      vx=width;
    }
     if(vx<0)
    {
      vx=0;
    }
     if(vy>b1y)
    {
      vy=b1y;
    }
     if(vy<0)
    {
      vy=0;
    }
    
  }
  
    


}




