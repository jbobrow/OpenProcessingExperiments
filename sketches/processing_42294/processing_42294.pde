
//author:robertlun,ncku arch
//purpose: hw2,"a window with a view" 
//concept:try to create tree crazy bees!
//reference:(1)example from 簡聖芬老師(2)www.openprocessing.org/visuals/?visualID=11144

//initial setting
void setup()
{ size(900, 600);
  stroke(0);
background(255);
 smooth();
  frameRate(24);
 
}
//variables
float a=second();
float b=second();
float c=second();
float d=second();
float e=second();
float f=second();
int r=5;
//bees
void bee(){
  ellipse(445+c+5*r,295+d+50,30,60);
  ellipse(445+c+5*r,255+d+50,25,20);
  ellipse(410+c+5*r,275+d+50,40,10);
  ellipse(480+c+5*r,275+d+50,40,10);
  ellipse(410+c+5*r,285+d+50,40,10);
  ellipse(480+c+5*r,285+d+50,40,10);
  ellipse(445+c+5*r,278+d+50,20,1);
  ellipse(445+c+5*r,293+d+50,28,1);
  ellipse(445+c+5*r,310+d+50,20,1);
}
void bee3(){ 
  ellipse(420+e+5*r,300+f+50,30,60);
  ellipse(420+e+5*r,260+f+50,25,20);
  ellipse(385+e+5*r,280+f+50,40,10);
  ellipse(455+e+5*r,280+f+50,40,10);
  ellipse(385+e+5*r,290+f+50,40,10);
  ellipse(455+e+5*r,290+f+50,40,10);
  ellipse(420+e+5*r,283+f+50,20,1);
  ellipse(420+e+5*r,298+f+50,28,1);
  ellipse(420+e+5*r,315+f+50,20,1);
}
void bee2(){
  ellipse(440+a+5*r,290+b+50,30,60);
  ellipse(440+a+5*r,250+b+50,25,20);
  ellipse(405+a+5*r,270+b+50,40,10);
  ellipse(475+a+5*r,270+b+50,40,10);
  ellipse(405+a+5*r,280+b+50,40,10);
  ellipse(475+a+5*r,280+b+50,40,10);
  ellipse(440+a+5*r,273+b+50,20,1);
  ellipse(440+a+5*r,288+b+50,28,1);
  ellipse(440+a+5*r,305+b+50,20,1);
}

//main funtion to draw
void draw(){
  background(255);
  fill(255,190,190);
  ellipse(250,0,150,150);
  ellipse(0,250,150,150);
  ellipse(200,120,130,130);
  ellipse(130,215,130,130);
  ellipse(0,0,500,500);
   fill(255,234,5);
  ellipse(0,0,80,80);
 stroke(0);
 //line 
  fill(random(255,250),random(255,250),random(0,10),random(0,255));
  r=r+45;
  if (r>10)
  {bee2();
  bee();
   bee3();
 r=0;}
  a=a+random(-10,10);
  b=b+random(-5,5);
  c=c=random(-12,12);
  d=d+random(-10,10);
  e=e+random(-18,18);
  f=f=random(-10,10);
}


