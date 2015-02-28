

float[] monTableauX;
float[] monTableauY;

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  
  strokeWeight(10);
  
  monTableauX = new float[400];
  monTableauY = new float[400];
  
  for ( int i = 0 ; i < 400 ; i++ )  {
    monTableauX[i] = random( 0, width);
    monTableauY[i] = random( 0, height);
  }
  
}


void draw () {
  background(0);
  
  for ( int i = 0 ; i < 400 ; i++ )  {
    float x = monTableauX[i];
    float y = monTableauY[i];
    
    stroke(255);
    point(x,y);
    
    y = y + 5;
   
    if ( y > width )  {
       y = 0;
    }
    
    monTableauY[i] = y;
   
  }
  
}
