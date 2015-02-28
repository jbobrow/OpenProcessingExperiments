
PFont f;
PFont fa;

void setup()
{
  size(500,700);
  smooth();
  f=loadFont("HelveticaNeue-Light-20.vlw");
  fa=loadFont("HelveticaNeue-MediumCond-22.vlw");
}

void draw()
{


  int s=second();
  int m=minute();
  int h=hour();
  int y=year();
  int mo=month();
  int d=day();

  background(0);

  //YMD,HMS definition line//
  strokeWeight(0.3);
  stroke(255);
  line(295,355,295,690);

  //ellipse//
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
  arc(width/2,180,130,130,radians(0-90),radians(s*6-90));


  fill(255);
  stroke(255);
  strokeWeight(0.3);

  //second grid//
  line(450,420,450,670);
  for(int a=424; a<660; a+=4)
  {
    line(440,a,450,a);
  }
  //minute grid//
  line(410,420,410,670);
  for(int a=424; a<660; a+=4)
  {
    line(400,a,410,a);
  }
  //hour grid//
  line(365,420,365,670);
  for(int b=420; b<670;b+=10 )
  {
    line(345,b,365,b);
  }
  //day grid//
  line(270,420,270,670);
  for(int b=420; b<670;b+=8 )
  {
    line(250,b,270,b);
  }
  //month grid//
  line(215,420,215,670);
  for(int b=420; b<670;b+=20 )
  {
    line(195,b,215,b);
  }
  //year grid//
  line(135,420,135,670);
  for(int b=420; b<670;b+=12.5 )
  {
    line(115,b,135,b);
  }

  //clock bar//
  noStroke();
  strokeJoin(ROUND);
  colorMode(HSB,255);
  fill((4.5*s),200,255);
  rect(431,420,20,s*4);
  colorMode(RGB,255);
  strokeWeight(0);

  fill(255,158,0);
  rect(381,420,30,m*4);

  fill(203,255,0);
  rect(315,420,50,h*10);

  fill(0,255,121);
  rect(230,420,40,d*8);

  fill(0,138,255);
  rect(155,420,60,mo*20);

  fill(255,0,230);
  rect(56,420,80,((y-1992)*8));

  //text//
  fill(255);
  textAlign(CENTER);

  textFont(f);
  text(s,440,400);
  text(":",370,400);
  text(m,395,400);
  text(":",417,400);
  text(h,340,400);

  text(d,250,400);
  text("/",145,400);
  text(mo,185,400);
  text("/",222,400);
  text(y,95,400);

  textFont (fa);
  text("sec",440,375);
  text("min",395,375);
  text("hr",340,375);
  text("Year",95,375);
  text("Month",185,375);
  text("Day",250,375);



  //parrarel line//
  stroke(255);
  strokeWeight(2);
  line(30,420,470,420);
  strokeWeight(1);
  line(30,417,470,417);
}


