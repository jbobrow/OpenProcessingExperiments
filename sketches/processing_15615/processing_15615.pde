
PFont f;
int wCen;
int hCen;

void setup()
{
  size(500,500);
  smooth();
  f=loadFont("HYnamL-48.vlw");
}

void draw()
{

  int s=second();
  int m=minute();
  int h=hour();

  background(0);

  //second//
  fill(0,0);
  strokeWeight(15);
  strokeCap(MITER);
  colorMode(HSB,255);
  stroke((4.5*m)-1,180,255);
  ellipse(width/2,180,70,70);
  strokeWeight(26);
  stroke(0);
  colorMode(RGB);
  arc(width/2,180,70,70,radians(s*6-102),radians(s*6-92));
  strokeWeight(26);
  stroke(0);
  colorMode(RGB);
  arc(width/2,180,70,70,radians(s*6-88),radians(s*6-78));

  //minutes// 
  fill(0,0);
  strokeWeight(20);
  strokeCap(MITER);
  colorMode(HSB,255);
  stroke((4.5*s)-1,180,255);
  ellipse(width/2,180,130,130);
  strokeWeight(2);
  ellipse(width/2,180,160,160);
  strokeWeight(26);
  stroke(0);
  colorMode(RGB);
  arc(width/2,180,130,130,radians(m*6-102),radians(m*6-92));
  strokeWeight(26);
  stroke(0);
  colorMode(RGB);
  arc(width/2,180,130,130,radians(m*6-88),radians(m*6-78)); 

  //hour// 
  wCen = width/2; 
  hCen=180;
  float h2=map(hour()%12, 0,12,0,TWO_PI) - HALF_PI;
  colorMode(HSB,255);
  stroke(h/2,180,255);
  strokeWeight(10);
  strokeCap(ROUND);
  line(wCen,hCen,cos(h2)*110+wCen,sin(h2)*110+hCen);

  //timeline//
  stroke(255);
  strokeWeight(4);
  line(wCen,70,wCen,90);  
  stroke(255);
  strokeWeight(4);
  line(wCen,270,wCen,290); 
  stroke(255);
  strokeWeight(4);
  line(140,hCen,160,hCen); 
  stroke(255);
  strokeWeight(4);
  line(340,hCen,360,hCen); 

  colorMode(HSB,255);
  fill((4.5*s)-1,180,255);
  textAlign(CENTER);

  textFont(f);
  text(s,320,370);
  text(":",285,370);
  text(m,250,370);
  text(":",215,370);
  text(h,180,370);
}




