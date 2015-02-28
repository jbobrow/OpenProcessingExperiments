
//Hayley G, CP1, mods 14/15  Animation

float x = 400;
float y = 200;
float changeX = 0.1;
float changeY = 0.07;
void setup()
{
  size(400,400);
  smooth();
  frameRate(9); 
}
void draw()
{
  sun();
  moon();
}
void sun()
{
  background(255,235,205);
  noStroke();
  fill(255,255,0);
  ellipse(x,y,60,60);
  x = x - changeX;
  y = y - changeY;
  changeX = changeX + 0.12;
  changeY = changeY + 0.07; 
  stroke(0);
  fill(91,91,91);
  rect(0,100,20,200);
  rect(20,150,70,150);
  rect(90,140,50,160);
  rect(140,210,70,90);
  rect(210,230,40,70);
  rect(250,180,70,120);
  rect(320,150,30,150);
  rect(350,170,50,130);
}
  void moon()
{
if(y < 100)
{
  background(0); 
  fill(255,255,255);
  ellipse(x,y,60,60);
  x = x - changeX;
  y = y - changeY;
  changeX = changeX + 0.05;
  changeY = changeY + 0.02; 
  stroke(0);
  fill(91,91,91);
  rect(0,100,20,200);
  rect(20,150,70,150);
  rect(90,140,50,160);
  rect(140,210,70,90);
  rect(210,230,40,70);
  rect(250,180,70,120);
  rect(320,150,30,150);
  rect(350,170,50,130);
}  
}
