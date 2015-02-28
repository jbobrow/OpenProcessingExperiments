
float[] monTableauX;
float[] monTableauY;
color[] monTableauC;

int indexChoisi = 257;
 
void setup() {
  size(400,400);
  smooth();
   
  strokeWeight(10);
   
  monTableauX = new float[400];
  monTableauY = new float[400];
  monTableauC = new color[400];
   
  for ( int i = 0 ; i < 400 ; i++ )  {
    monTableauX[i] = i % 20 * (width/20) + 10;
    monTableauY[i] = int( i / 20) * (height/20) + 10 ;
    monTableauC[i] = color(255);
  }
   
}
 
 
void draw () {
  background(0);
  stroke(255);
   
  for ( int i = 0 ; i < 400 ; i++ )  {
    float x = monTableauX[i];
    float y = monTableauY[i];
     
    monTableauY[i] = monTableauY[i] + 1;
    if ( monTableauY[i] > height ) monTableauY[i] = 0;
    stroke(monTableauC[i]);
    
    point(x,y);
     
    
  }
   
}


void mousePressed() {
  
  for ( int i = 0 ; i < 400 ; i++ )  {
    float distance = dist( monTableauX[i], monTableauY[i], mouseX, mouseY );
    
    if (distance < 20 ) {
       monTableauC[i] = color(255,0,0);
    }
  }
  
  
  
}
