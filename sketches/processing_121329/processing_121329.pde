
float counter1 = 0;
float counter2 = 0;
 
void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  background(#8E0427);
   
  translate(width/2, height/2);
  translate(0,0);
   
  for (int i=0; i<360; i+=360)
 {
   pushMatrix();
   translate(0,-70);
   translate(cos(counter2)*100, sin(counter2)*100);
    
   float h = map(sin(counter2), -1, 1, 320, 360);
   fill(h, 100, 100);
   rotate(radians(i));
   noStroke();
   triangle(30, 75, 58, 125, 86, 75);
   
   translate(0,50);
   translate(cos(counter1)*100, sin(counter1)*100);
    
   float g = map(sin(counter1), -1, 1, 320, 360);
   fill(g, 100, 100);
   rotate(radians(i));
   ellipse(0, 0, 50, 60);
   popMatrix();
    
   counter1 += 0.04;
   counter2 += 0.08;
 }}

