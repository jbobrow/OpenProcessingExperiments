
PImage img;

void setup()
{
   size(600,600);
   img = loadImage("clock.JPG");
   smooth();
   fill(72);
   noStroke();
}
 
void draw()
{
   background(img);
   for(int x=0; x<=width; x+=20)
   {
      for(int y=0; y<=height; y+=20)
      {
         float diameter = dist(mouseX,mouseY, x,y) / 4;
         ellipse(x,y, diameter, diameter); 
      }
   }
}


