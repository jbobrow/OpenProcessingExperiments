
/**
 * Rotating Blocks
 * by Nigel Parker
 * 
 * Each column of blocks rotates at a different rate with the centre 
 * column remaining static and the left an right sides rotating in 
 * a different direction
 */
 
int [] r    =  new int[6];
int [] rVal =  new int[6];

void setup() {

  // Set up initial rotation speeds
  rVal[0]=10;
  rVal[1]=8;
  rVal[2]=6;
  rVal[3]=4;
  rVal[4]=2;
  rVal[5]=0;

  // Set the initial screen size etc  
  size(640,640); 
  smooth(); 
  noStroke();
  
}

void draw() 
{

    background(0);
    
    for(int i=0;i<6;i++)
    {
        int xxLeft  = 65  + (50 * i);
        int xxRight = 565 - (50 * i);
        
        // We will be drawing 11 boxes in a line
        for(int j=0;j<11;j++)
        {
          int yy = 65 + (50 * j);
          drawBox(xxLeft,yy,30,30,radians(r[i]));
          
          // Don't need to draw the centre column twice
          if (i < 5) 
          {
            drawBox(xxRight,yy,30,30,radians((-1 * r[i])));
          }
        }  
        r[i] = (r[i] + rVal[i]) % 360;        
    }

}

void drawBox(int x, int y, int w, int h, float rot)
{
  fill(0,148,255);
  
  // Move the origin of the co-ordinate system to be the
  // centre of the box we are going to draw
  translate(x,y); 
  
  // Rotate the co-ordinate system by the required amount
  rotate(rot);
  
  // Draw the rectangle based around the centre co-ordinates
  rectMode(CENTER);
  rect(0,0,w,h);  
  
  // Rotate the co-ordinate system back by the required amount  
  // We have to do this as rotate is cumulative
  rotate((rot * -1));  
  
  // Move the origin of the co-ordinate system back to 
  // its original position
  // We have to do this as translate is cumulative
  translate(-x,-y);  
}


