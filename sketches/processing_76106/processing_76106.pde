
float incc;
boolean bol;
 
void setup()
{
  size(400,400);
  background(0);
  strokeWeight(6);
  smooth();
  incc=0;
  bol=true;
  frameRate(7);
}
 
void draw()
{
  background(0);
  packman(incc);
  fill(255,255,0);
  if(incc==0)
  incc=PI/8;
  else
  if(incc==PI/8)
  incc=PI/4;
  else
  incc=0;
 
}
 
void packman(float inc)
{
  fill(255,255,0);
  stroke(255,255,0);
  arc(200,200,100,100,PI/4-inc,2*PI-PI/4+inc);
  fill(0);
  ellipse(180,180,27,27);
  sombrero();
}
 
 
void sombrero()
{
  rotate(PI/8);
  fill(120,0,120);
  stroke(120,0,120);
  arc(250,69,90,20,0,2*PI);
  stroke(120,0,120);
  fill(120,0,120);
  strokeWeight(1);
  arc(250,60,60,90,PI,2*PI);
}


