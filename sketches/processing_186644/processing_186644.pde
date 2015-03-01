

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
  translate(450,350);
  rotate(x);

  stroke(random(255),0,random(255));
  rect(0,0,200,800);
  x++;
  
  }
