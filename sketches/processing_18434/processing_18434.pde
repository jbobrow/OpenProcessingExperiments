
// Jugando Con Numeros
// Seminario de Matematicas
// Jan 24, 2011: Chris Sugrue.

int total = 200;                  // total circles
int [] xPos = new int[total];    // x positions
int [] yPos = new int[total];    // y positions
int [] radius = new int[total];  // radii


void setup()
{
  size(320,240);
  
  for( int i = 0; i < total; i++)
  {
    xPos[i] = int( random(0,width) );
    yPos[i] = int(random(0,height) );
    radius[i] = int(random(20,40) );
  }
  
}


void draw()
{
  background(255);
  
  for( int i = 0; i < total; i++)
  {
    // calc distance from mouse
    float distance = dist(xPos[i],yPos[i],mouseX,mouseY);
    
    // find percentage of distance from circle center to mouse position 
    // in comparison to max distance (screen width )
    float pct = distance/width;
    
    // apply to red color by mapping percent to color range
    //same as:  int redColor = int(255*pct);
    int redColor = int( map(pct,0,1,0,255) );
    fill(redColor,0,0);
    
    // map radius to distance
    // same as: radius[i] = int( map(pct,0,1,0,100) );
    radius[i] = int(100*pct);
    ellipse(xPos[i],yPos[i],radius[i],radius[i]);


  }
  
  
  
  
}


