
//Hannah Abdel, CP1, Mods 4-5
PImage b;
void setup()
{
 b=loadImage("superman.jpg"); 
 size(300,300);


}
void draw()
{
  background(0);
  image(b,100,165,100,150);
  strokeWeight(10);
  int e=1;
  while(e<=100)
  {
  frameRate(1);
  fill(random(255));
  stroke(random(255));
   ellipse(int(random(290)),int(random(150)),30,30);
  e++;
  }
}



