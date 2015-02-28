
float counter = 0;

 
void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  background(0);
   
  translate(width/2, height/2);
   
  for (int i=1; i<50; i+=50)
 {
   pushMatrix();
   translate(cos(counter)*200, sin(counter)*200);
    
   float h = map(sin(counter), -1, 1, 180, 240);
   fill(h, 100, 100);
   rotate(radians(i));
   ellipse(0, 0, 40, 40);
   popMatrix();
    
   counter += 100.5;
 }

for (int i=1; i<50; i+=50)
 {
   pushMatrix();
   translate(cos(counter)*200, sin(counter)*200);
   
   translate(-30, -30);    
   float h = map(sin(counter), -1, 1, 0, 10);
   fill(h, 100, 100);
   rotate(radians(i));
   ellipse(0, 0, 40, 40);
   popMatrix();
    
   counter += 100.5;
 }
  
  
}

