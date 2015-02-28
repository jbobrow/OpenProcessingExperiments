
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
  
  for (int i=0; i<360; i+=20)
 {
   pushMatrix();
   translate(cos(counter)*100, sin(counter)*100);
   
   float h = map(sin(counter), -1, 1, 0, 26);
   fill(h, 100, 100);
   rotate(radians(i));
   ellipse(0, 0, 20, 20);
   popMatrix();
   
   counter += 0.5;
 }
 
   for (int i=0; i<360; i+=20)
 {
   pushMatrix();
   translate(cos(counter)*100, sin(counter)*100);
   
   translate(-140, -140);
   float h = map(sin(counter), -1, 1, 0, 26);
   fill(h, 100, 100);
   rotate(radians(i));
   triangle(0, 0, 20, 20 , 40, 0);
   popMatrix();
   
   counter += 0.5;
 }
 
   for (int i=0; i<360; i+=20)
 {
   pushMatrix();
   translate(cos(counter)*100, sin(counter)*100);
   
   translate(150, 120);
   float h = map(sin(counter), -1, 1, 0, 26);
   fill(h, 100, 100);
   rotate(radians(i));
   rect(0, 0, 20, 20);
   popMatrix();
   
   counter += 0.5;
 }
 
    for (int i=0; i<360; i+=20)
 {
   pushMatrix();
   translate(cos(counter)*100, sin(counter)*100);
   
   translate(-130, 120);
   float h = map(sin(counter), -1, 1, 0, 26);
   fill(h, 100, 100);
   rotate(radians(i));
   triangle(0, 0, 20, 20 , 40, 0);
   popMatrix();
   
   counter += 0.5;
 }
 
   for (int i=0; i<360; i+=20)
 {
   pushMatrix();
   translate(cos(counter)*100, sin(counter)*100);
   
   translate(130, -150);
   float h = map(sin(counter), -1, 1, 0, 26);
   fill(h, 100, 100);
   rotate(radians(i));
   rect(0, 0, 20, 20);
   popMatrix();
   
   counter += 0.5;
 }
}
