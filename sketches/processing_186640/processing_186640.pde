
/*-----------------------------
Using Functions
certain bubbles in fixed spots and all the rest 
are not constrained and give a random picture each time

Created Feb 16, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified February 18, 2015

project URL
-----------------------------*/
void setup()
{
  size(600,750); 
  background(0);
  smooth();  
}


void draw()
{
Bubbles();
}

void Bubbles()
{
 fill(0,9);
 strokeWeight(random(.01,3));                                                                   
 frameRate(800);                                                                                                                                              stroke(255);                      
  
  for(int i = 0; i < 200; i++)
  {
    for (int j = 0; j < 50; j++)
    {
      ellipse(random(600),random(750),j,j);
    }
    ellipse(0,0,i,i);
    //top left corner
    ellipse(width,height/2,i,i);
    //mid right side
    ellipse(width/2,height,i,i);
    //bottom middle edge
    ellipse(width/4,height/4,i,i);
    //middle top bubble
    ellipse(width/2,height/8,i,i);
    //bottom slightly right
    ellipse(width/1.5,height,i,i);
    //middle left
    ellipse(width/7,height/1.5,i,i);
    
  }

   noLoop(); 
}
