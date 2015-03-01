
float x=0;
float y=0;

void setup() 
{
  size(900,700);
  background(50);
  smooth();
}
 
void draw () 
{
  noFill();
  translate(820,400);
  rotate(x);

  stroke(random(795),0,random(855));
  rect(0,0,200,800);
  x--;
  
  }
