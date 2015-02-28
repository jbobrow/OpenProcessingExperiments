
void setup()
 { 
  size(600, 800);
   background(255, 255, 255);
   smooth();
   frameRate(20); 

} 


void draw() 
{ 
  background(0, 0, 0);
   fill(random(255), random(255),random(255) );
   text("happy new year 2013!",random(width),random(height));
   textSize(40);
  ellipse( 200, frameCount, 200, 200 );
 
  println( "frameCount: " + frameCount );
 
}



