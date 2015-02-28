
float rx1,ry1;
float rx2,ry2;

void setup()
{
  size(500,500);
  noCursor();
  background(255,255,255);
  
  rx1 = 160;
  ry1 = 390;
  rx2 = 160;
  ry2 = 390;
}

void draw()
{
   fill(255,255,255);
  noStroke();
  fill(224);
  quad(0,500,0,0,500,0,500,500);
  
  fill(0);
  noStroke();
  triangle(230,70,100,130,100,110);
  triangle(270,70,400,130,400,110);
  triangle(200,300,140,330,80,375);
  triangle(300,300,360,330,420,375);
  
  fill(0);
  float tm = map(-mouseX,0,30,389,393);
  quad(320,tm,330,tm,330,400,320,400);
  
  fill(0);
  float bm = map(mouseX,0,30,399,403);
  quad(320,bm,330,bm,330,400,320,400);
  
  fill(0);
  float tml = map(-mouseX,0,30,390,394);
  rect(rx1,tml,160,10);
  
  fill(0);
  float bml = map(mouseX,0,30,390,394);
  rect(rx2,bml,160,10);
  
  fill(0);
  float le = map(mouseX,0,width,50,150);
  ellipse(330,180,le-30,le);
  
  fill(0);
  float re = map(mouseX,0,width,50,150);
  ellipse(170,180,re-30,re);
  
  fill(255);
  float wle = map(mouseX,0,width,30,100);
  ellipse(330,180,wle-30,wle);
  
  fill(255);
  float wre = map(mouseX,0,width,30,100);
  ellipse(170,180,wre-30,wre);
  
 
  
  
}

