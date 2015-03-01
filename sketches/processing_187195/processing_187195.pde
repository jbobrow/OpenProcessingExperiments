
float x=0;
float y=0;

void setup() 
{
  size(200,900);
  background(200);
  smooth();
}
 
void draw () 
{
  noFill();
  translate(650,250);
  rotate(x);

  stroke(random(705),0,random(785));
  rect(0,0,200,800);
  x++;
  
  }
