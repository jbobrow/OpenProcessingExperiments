
// My_brush by Shubhra Bhatt. 
// To start or stop drawing click the mouse.

int c=0;

void setup()
{ //setting up the canvas
   size(900,600,P3D);   
   background(0,0,0);
   stroke(255,255,255);
   strokeWeight(2);
 
}

void draw()
{
  //checks the mouse clicks. 
  if(c%2 == 1)
  {
    for(int i = 0; i < height ; i++)
    {
       ellipse(mouseX,mouseY,20,20);
       fill(192,62,0);
      // smooth();
    }
    
  }
  if(keyPressed==true)
  {
    background(0,0,0);
  }
  
 
 
// updatePixels();
}

void mousePressed()
{
  
  c=++c;
}


   
   

