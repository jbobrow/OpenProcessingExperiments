
void setup() {
  size(200,200);
  smooth();
  noStroke();
}
 
 
void draw() {
  background(100);
   
   
   for ( int j = 20 ; j < height ; j = j + 40 ) {
     for ( int i = 20; i < width ; i = i + 40 ) {
         dessinerEllipse(i,j);
     }
   }
}
 
 
 void dessinerEllipse( float x, float y) {
   
   if ( mouseInsideCircle(x,y) == true ) {
    fill(255,0,0);
  } else {
     fill(0,0,255);
  }
   
  ellipse( x , y , 40, 40 );
   
 }
 
 
boolean mouseInsideCircle ( float x, float y  ) {
  
   float distance = dist( x , y , mouseX , mouseY);

  return distance < 20;
}
