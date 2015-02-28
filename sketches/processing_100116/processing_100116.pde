
void setup()
{
  size(500,500);
}

void matt()
{
  frameRate(7);
  float a=random(255);
  float b=random(255);
  float c=random(255);
  background(a,b,c);
  
noStroke();
ellipse(a*2,b*2,c/2,c/2);
}

void draw(){
matt();
}



