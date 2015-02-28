
void setup()
{
  size(900, 400);
  background(102);
  smooth();
}
void draw() 
{
 mouSer(mouseX, mouseY, pmouseX, pmouseY);
}
void mouSer(int x, int y, int px, int py) 
{
  //float mouSerSpeed = abs(x-px) + abs(y-py);
   float mouSerSpeed = constrain(sq(x-px),0,255) + constrain(sq(y-py),0,255);
   //println(x);
   fill(100,200,mouSerSpeed);
  stroke(255,0,mouSerSpeed);
  //rect(x, y, mouSerSpeed, mouSerSpeed);
  //arc(x, y,200,300, mouSerSpeed, mouSerSpeed);
  ellipse(x, y, mouSerSpeed, mouSerSpeed);
  //quad(x, y,x/mouSerSpeed,y/mouSerSpeed,mouSerSpeed/x,mouSerSpeed/y, mouSerSpeed, mouSerSpeed);
}
