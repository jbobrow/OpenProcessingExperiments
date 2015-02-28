
PFont u;
PFont z;
void setup()
{
  frameRate(14);
  size(800,200);
  background(255);
  
}
  
 void draw()

{
   background(1);
 fill(155,20,250,70);
  u=loadFont("Garamond-Bold-72.vlw");
  textFont(u);
  
text ("fere",random(800),random(200));


fill(15,20,250,70);
  z=loadFont("Helvetica-40.vlw");
  textFont(z);
text ("fere",random(800),random(200));

}

