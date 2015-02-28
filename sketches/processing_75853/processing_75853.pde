
/* @pjs globalKeyEvents= "true"; */

int myLimit= 1; 
  
void setup()
{
  size(500,500);
  frameRate(1);
}

void draw()
{
  background(0);
  int a=1;
  while(a<=myLimit)
  {
  int c= int (random(0,255));
  fill(c, c, 255-c, c);
  ellipse(int(random(500)), int(random(500)),50,50);
  rect(int(random(500)), int(random(500)), 50,50);
  a++;
  }
  myLimit= myLimit*2;
  myText();
 if (myLimit>=400)
 {
   myLimit=1;
 }
}

void myText()
{
  textSize(24);
  fill(255,255,255);
  text(myLimit,100,100);
}
