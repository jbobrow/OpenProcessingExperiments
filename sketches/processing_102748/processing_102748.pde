
float magnify = 150; 
float rotation = 50; 
float radius = 50; 
int elements = 136;


void setup()
{
  size(640, 480);
  background(255); 
  
}




void draw()
{
   noFill();
  strokeWeight(5);
  
   rotation = map(mouseX, 0, height, 0, 10);
   radius = map(mouseY, 0, width, 0, 10);
 
   float spacing = TWO_PI/elements; 
   translate(width*0.5,height*0.5);
 
  
  for (int i = 5; i < elements;i++) {
      stroke(i*2,255*i,255*i);
      
      pushMatrix();
      translate(sin(spacing*i*radius)*magnify, 0);
      rotate(spacing*i*rotation);
      rect(50,50,20*i,20*i);
      popMatrix();
  }
}



