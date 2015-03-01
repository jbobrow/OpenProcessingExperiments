
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
  translate(820,600);
  rotate(x);

  stroke(random(700),0,random(800));
  rect(0,0,200,800);
  x++;
  
  }
