
float oscCounter = 0;

void setup() {
  
  size(400,400);
  smooth();
  frameRate(30);
  
}


void draw() {
  
  background(0);
 
  //oscCounter = oscCounter + 0.1;
  oscCounter = oscCounter + map( mouseY , 0 , height , 0.01 , 0.5) ; 
 
  float oscCenter = height/2;
  float oscRadius = 100;
 
  for ( int i = 0; i < 16; i++ ) {
    
    //float oscOffset = i * 0.1;
    float oscOffset = i * map( mouseX , 0 , width , 0.01 , 0.5);
    
    float y = cos( oscCounter + oscOffset ) * oscRadius + oscCenter;
    float x = i * 25 + 12.5;
    ellipse(x,y,25,25);
  }
 
}
