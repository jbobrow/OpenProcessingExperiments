
void setup ()
{
  
 size(500,500);
 background(255);
 }
void draw()
{
  background(255);
  fill(100);
  noStroke();
  rect(50,50,5,150);
  rect(60,60,5,150);
  rect(70,70,5,150);
  rect(80,80,5,150);
  rect(90,90,5,150);
  rect(100,100,5,150);
  rect(110,110,5,150);
  rect(120,120,5,150);
  rect(130,130,5,150);
  rect(140,140,5,150);
  rect(150,150,5,150);
  rect(160,160,5,150);
  rect(170,170,5,150);
  rect(180,180,5,150);
  rect(190,190,5,150);
  rect(200,200,5,150);
  
  
  
rect(300,200,5,150);
rect(310,190,5,150);
rect(320,180,5,150);
rect(330,170,5,150);
rect(340,160,5,150);
rect(350,150,5,150);
rect(360,140,5,150);
rect(370,130,5,150);
rect(380,120,5,150);
rect(390,110,5,150);
rect(400,100,5,150);
rect(410,90,5,150);
rect(420,80,5,150);
rect(430,70,5,150);
rect(440,60,5,150);
rect(450,50,5,150);
 pushMatrix();
 translate(250,200);
 float winkel = map(0,mouseX,4500,0,0.5*PI);
  rotate (winkel);
  fill(0,255,0);
  noStroke();
  rect(0,0,5,70);
  popMatrix();
  resetMatrix();
  pushMatrix();
  translate(250,200);
  float winkel1=map(0,mouseX,4500,0,0.5*PI);
   rotate (winkel1);
 rect(0,80,5,70);
  popMatrix();
  resetMatrix();
}
