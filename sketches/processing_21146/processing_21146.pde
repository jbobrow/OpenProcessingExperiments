


void setup() {
  size(200,200);
  smooth();
  noStroke();
}


void draw() {
  background(100);
  
  if ( mouseInsideCircle( 100 , 100 , 40 ) ) {
    fill(255,0,0); 
  } else {
     fill(0,0,255); 
  }
  
  ellipse( 100 , 100 , 40, 40 );
  
}


 
boolean mouseInsideCircle( float circleX, float circleY , float circleDiameter) {
   
  float distance = dist( circleX , circleY , mouseX , mouseY);
   
  boolean result = distance < circleDiameter*0.5;
   
  return result;
   
}
