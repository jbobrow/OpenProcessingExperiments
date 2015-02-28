
void setup()
{
size(400,400);
frameRate(75);
}
void draw()
{
   stroke(random(0),random(255),random(0));
  
  strokeWeight(4);
   line(0,0,random(200),random(200));
 
  line(400,400,random(200),random(200));
  line(400,0,random(200),random(200));
  line(0,400,random(200),random(200));
 strokeWeight(random(100));
  point(390,390);
  point(390,0);
  point(0,390);
  }


