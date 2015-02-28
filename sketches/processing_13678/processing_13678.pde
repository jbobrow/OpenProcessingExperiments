
float b=0;
void setup()
{
  size(200,200);
}

void draw()
{
 for(int y=0; y<200; y=y+1)
 {
  for( int x=0; x<200; x=x+1)
{

      float e = sin(x)*cos(y);
  {
  float c=(sin(radians(e*b))+1)*100;
  ellipse(x,c,20,20);
  stroke(random(255),random(255),random(255));
  fill(random(200),random(200),random(255));
  strokeWeight(2);

} 
}
  b=b+0.05;
}
}
