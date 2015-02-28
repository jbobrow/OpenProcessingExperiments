
float rx1,ry1;
float rx2,ry2;
float q;
float randleft;

void setup()
{
  size(500,500);
  noCursor();
  background(255,255,255);
  rectMode(CENTER);
  
  rx1 = 160;
  ry1 = 390;
  rx2 = 160;
  ry2 = 390;
  q = 0;
}

void draw()
{
  fill(255,255,255);
  noStroke();
  fill(244);
  quad(0,500,0,0,500,0,500,500);
  
 
  
  fill(0);
  noStroke();
  
  
 
 
  triangle(200,300,140,330,80,375);
  triangle(300,300,360,330,420,375);
  
  //fill(0);
  //float tm = map(-mouseX,0,30,389,393);
  //quad(320,tm,330,tm,330,400,320,400);

  fill(0);
  float m = map(mouseX,0,width,0,120);
  rect(330,390,10,m);

  stroke(0);
  strokeWeight(10);
  line(330,388-m/2,173,388-m/2);
  line(330,388+m/2,173,388+m/2);
  
  //fill(0);
  //float tml = map(-mouseX,0,width,390,394);
  //rect(rx1,tml,160,10);
  
  
  fill(0);
  float le = map(mouseX,0,width,50,150);
  ellipse(330+mouseY/40,180+mouseX/20,le-25,le);
  
  
  fill(0);
  float re = map(mouseX,0,width,50,150);
  ellipse(170,180-mouseX/20,re-20-mouseX/20,re+mouseY/18);
  
  fill(255);
  float wle = map(mouseX,0,width,30,100);
  ellipse(330,180,wle-20,wle);
  
  fill(255);
  float wre = map(mouseX,0,width,30,100);
  ellipse(170,180,wre-30,wre);
  
  fill(255);
  stroke(0);
  strokeWeight(3);
  rect(253,385-mouseX/11.5,145,re/6-6);

  fill(255);
  stroke(0);
  strokeWeight(3);
  rect(253,385+mouseX/10,145,re/6-6);
  
  fill(0);
  noStroke();
  triangle(230,70-re/3,100-re/2,130,100-re/3,110-re/3);
  triangle(270,70-re/4,400+re/3,130+re/3,400+re/2,110);
  

  
}

