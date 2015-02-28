
boolean isellipse=true;
void setup()
{
  size(500,750);
  frameRate(1);
  textSize(50);
 
}

int val=1;
void draw()
{
  background(0);
  int num=1;
  while(num<=val)
  {
    float siz= random(20,50);
    fill(random(0,256),random(0,256),random(0,256));
    stroke(random(0,256),random(0,256),random(0,256));
    if(isellipse==true)
    {
    ellipse(random(0,501),random(0,751),siz,siz);

    }
    else
    {
      rect(random(0,501),random(0,751),siz,siz);
    }
    num++;
  }
  val=val*2;
  text(num-1,30,50);
  if(num>4500)
  {
    num=1;
    val=1;
  }
}
void mousePressed()
{
  isellipse=!isellipse;
}
