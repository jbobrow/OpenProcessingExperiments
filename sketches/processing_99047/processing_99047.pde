
void setup()
{ 
  size(400, 600);
  background(165,176,227);
  smooth();
  frameRate(20);
} 

void draw() 
{ 
 strokeWeight(3);
    fill( 255,255,255 );
   triangle(mouseX, mouseY, mouseX-10, mouseY+10, mouseX+10, mouseY+10 );

  stroke(random(255), random(255), random(255));
  line(0, 0, width, frameCount);
  
  fill(49,177,201,5);
  rect(0,0,400,600);
  fill( 255, 255,255,127 );
  ellipse( mouseX, mouseY, 50, 50 );
  
  
}
