

void setup()
 { 
  size(400, 600);
   background(255, 255, 255);
   smooth();
   frameRate(99999);
 
} 


void draw() 
{
   fill(255, 255, 255, 30); 
  rect( 50, 50, width, height);
  noStroke();
  fill(255, 50, 100);
   ellipse( mouseX, mouseY, 30, 30 );
 
}


