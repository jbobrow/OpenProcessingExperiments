
void setup()

{
  size(600,600);
  strokeWeight(4);
 frameRate(4);
}


void draw()
{
  smooth();
  strokeWeight(random(400));
  stroke(0,0,random(200));
  rect(250,200,100,100);
  
}

