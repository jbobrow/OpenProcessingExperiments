
float oscCounter = 0;
float x;
float y;
float rads;
 
void setup() {
   
  size(400,400);
  smooth();
  frameRate(30);
  
}
 
 
void draw() {
   
  background(0);
  
  
  float xTarget = mouseX;
  float yTarget = mouseY;
  
  float radsTarget = atan2(mouseY-y,mouseX-x);
  float distanceTarget = dist(mouseX,mouseY,x,y);
  
   float speed;
  
  if ( distanceTarget > 25 ) {
    rads = radsTarget;
    speed = constrain(distanceTarget,0,10);
  } else {
    speed = 0; 
  }
  

  
  x = cos( rads) * speed + x;
  y = sin( rads) * speed + y;

  
  //oscCounter = oscCounter + 0.1;
  oscCounter = oscCounter + map(speed,0,10,0,0.5) ;
  
  translate(x,y);
  rotate(rads+PI);
  
  float yOffset = cos( oscCounter  ) * 20;
  translate(0, -yOffset);
  
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
