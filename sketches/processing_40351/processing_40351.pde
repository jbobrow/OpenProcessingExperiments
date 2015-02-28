
float x,y;

void setup()
{
 size(800,600); 
 smooth();
 strokeWeight(5);

}


void draw()
{
  background(#FFF415);
  
  for(int i=0; i<100; i=i+1)
  {
  fill(#FFF415);
  ellipse(random(0,800),random(0,600), 50,50);

  }
}

