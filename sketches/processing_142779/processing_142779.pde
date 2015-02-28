
void setup()
{
  size(500,500);
  background(0);
  frameRate(4);
  smooth();
  rectMode(CENTER);
  noStroke();
  colorMode(RGB,500,500,500);
  background(0);
}
void draw()
{
for(int y=0; y<=500; y+=100)
{
  for(int x=0;x<=500; x+=100)
  {
    if(random(500)<250)
    {
      fill(random(50,100),mouseX,mouseY);
      ellipse(x,y,100,100);//
      fill(mouseX,random(0,50),mouseY);
      ellipse(x+random(0,20),y+random(0,20),60,60);//
      fill(mouseY,mouseX,100);
      ellipse(x+random(0,20),y+random(0,20),30,30);//
    }
    else{
      fill(mouseY,random(50,100),mouseX);
      rect(x,y,100,100);
    }
  }
}
}
