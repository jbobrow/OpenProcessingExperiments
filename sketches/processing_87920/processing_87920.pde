
float oscCounter = 0;
float x;
float y;
float rads;
 
void setup() {
   
  size(400,400);
  smooth();
  frameRate(30);
   
  x = 30;
  y = height * 0.5;
}
 
 
void draw() {
   
  background(0);
  
 
  oscCounter = oscCounter + 0.1 ;
  
  translate(x,y);
  
  float xSegment = 0;
  
 int max = 8;
  for ( int i = 0; i < max; i++ ) {
     
    float oscOffset = i * 0.5;
    float oscRadius = 30;
    float ySegment = cos( oscCounter - oscOffset ) * oscRadius;
    
    float taille = map(i,0,max-1,50,1);
    fill(map(i,0,max-1,255,50));
    ellipse(xSegment,ySegment,taille,taille);
    xSegment = xSegment + taille;
  }
 
 if ( x < -220 ) x = width + 50;
 
  
}
