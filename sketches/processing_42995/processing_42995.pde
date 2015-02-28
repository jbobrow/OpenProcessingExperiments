


void setup()
{
  size(600,600);
  background(255);
  smooth();
  noStroke();
}
 
int rows = 20;
int columns = 20;
 
void draw()
{
 background (255);



  float side = 20;
    for(int r = 1; r<rows; r++)
  {
    for(int c = 1; c<columns; c++)
    {
  
      
      fill(0);
      pushMatrix();
      translate(r*20, c*20 );
    
      rotate(radians(45));
      
      rectMode(CENTER);
  
      rect(0,0,mouseX, mouseX);

      
 
      popMatrix();
    }
  }
}

