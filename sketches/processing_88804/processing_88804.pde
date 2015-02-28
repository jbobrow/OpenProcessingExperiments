
//prisca ohito, hw4 48-257 2.7.13, 
//copyright by prisca a ohito 2013;

float x, y, wd, ht;

color eColor;
void setup()
{
  size(400,400);
  background(0);
  smooth();
  println(frameCount);
eColor = color(255);
}

void draw()
{
   //big ellipse
  fill (eColor);
   ellipse(mouseX, mouseY, random(100), random(100));
   wd = wd;
   ht = ht;
   fill(random(255),random(255), random(255), 20);
   noStroke();  

  //lines
  
  stroke(random(255), random(255), random(255), 200);
  line(pmouseX-50, pmouseY-50, wd, ht);
  wd = wd * 2.50;
  ht = ht * .75;

} 
 
 
 void mousePressed()
 {
   eColor = color(random(255),random(255), random(255), 20);
 }
