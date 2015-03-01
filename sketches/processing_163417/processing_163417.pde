
Probe probe1;

void setup()
{
   size(700, 700);
   background(255);
   smooth();
   probe1 = new Probe(350, 200);
}
 
void draw()
{
  background(255);
  probe1.DrawProbe();
}

class Probe
{
  float X;
  float Y;
  
  Probe(float x, float y)
  {
    X = x;
    Y = y;
  }
  
  void DrawProbe()
  {
  //head
  fill(255);
  ellipse(X, Y, 240, 110);
  
  // body
  fill(255);
  //upper
  rect(X -105, Y+50, 210, 20, 80);
  //lower
  rect(X -105, Y+75, 210, 50, 80);
   
  // line on head
  line(X-120, Y-3, X+120, Y-3);
   
  // eyes
  fill(0);
  strokeWeight(5);
  ellipse(X+29, Y, 40, 40);
  ellipse(X-35, Y+10, 30, 30);
  ellipse(X-75, Y-5, 25, 25);
  ellipse(X+75, Y, 25, 25);
  
  //arms
  //arm 1
  line(X+98, Y+123, X+150, Y+170);
  line(X+150, Y+170, X+180, Y+150);
  //arm 2
  line(X-98, Y+123, X-150, Y+150);
  line(X-150, Y+150, X-180, Y+140);
  //arm 3
  line(X, Y+125, X-10, Y+250);
  line(X-10, Y+250, X, Y+340);
  //arm 4
  line(X-10, Y+125, X-30, Y+200);
  line(X-30, Y+200, X-55, Y+190);
  }

}
 

