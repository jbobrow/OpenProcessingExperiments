

float[] monTableauX;
float[] monTableauY;
float[] monTableauV;

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  
 
  
  monTableauX = new float[400];
  monTableauY = new float[400];
  monTableauV = new float[400];
  
  for ( int i = 0 ; i < 400 ; i++ )  {
    monTableauX[i] = random( 0, width);
    monTableauY[i] = random( 0, height);
    monTableauV[i] = random( 1, 10);
  }
  
}


void draw () {
  background(0);
  
  for ( int i = 0 ; i < 1; i++ )  {
    float x = monTableauX[i];
    float y = monTableauY[i];
    stroke(255);
    strokeWeight(monTableauV[i]);
    point(x,y);
    
    y = y + monTableauV[i] ;
   
    if ( y > width )  {
       y = 0;
      x = random( 0, width);
    }
    
    monTableauY[i] = y;
    monTableauX[i] = x;
   
  }
  
}
