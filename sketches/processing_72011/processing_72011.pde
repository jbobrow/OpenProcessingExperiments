
float x1=20;
float x2=40;
float x3=60;
float x4=80;
float x5=100;
float x6=120;
float x7=140;
float x8=160;
float x9=180;
float x10=200;
float x11=220;
float x12=240;
float x13=260;
float x14=280;
float x15=300;
float x16=320;
float x17=340;
float x18=360;
float x19=380;
int y=0;
void setup() 
{
  size(400,400);
  background(0);
}
void draw ()
{
  rain();
  if(y>400)
  {
    float x1=20;
    float x2=40;
    float x3=60;
    float x4=80;
    float x5=100;
    float x6=120;
    float x7=140;
    float x8=160;
    float x9=180;
    float x10=200;
    float x11=220;
    float x12=240;
    float x13=260;
    float x14=280;
    float x15=300;
    float x16=320;
    float x17=340;
    float x18=360;
    float x19=380;
    y=0;
  }
}
void rain()
{
  noStroke();
  fill(0,0,0,5);
  rect(0,0,400,400);
  strokeWeight(8);
  stroke(25,25,112);
  point(x1,y);
  stroke(100,149,237);
  point(x2,y);
  stroke(30,144,255);
  point(x3,y);
  stroke(0,178,238);
  point(x4,y);
  stroke(108,166,205);
  point(x5,y);
  stroke(74,112,139);
  point(x6,y);
  stroke(0,154,205);
  point(x7,y);
  stroke(178,223,238);
  point(x8,y);
  stroke(142,229,238);
  point(x9,y);
  stroke(0,134,139);
  point(x10,y);
  stroke(0,0,255);
  point(x11,y);
  stroke(79,148,205);
  point(x12,y);
  stroke(191,239,255);
  point(x13,y);
  stroke(135,206,255);
  point(x14,y);
  stroke(0,0,128);
  point(x15,y);
  stroke(0,205,205);
  point(x16,y);
  stroke(51,161,201);
  point(x17,y);
  stroke(61,89,171);
  point(x18,y);
  stroke(64,224,208);
  point(x19,y);
  x1=x1+random(-5,5);
  x2=x2+random(-5,5);
  x3=x3+random(-5,5);
  x4=x4+random(-5,5);
  x5=x5+random(-5,5);
  x6=x6+random(-5,5);
  x7=x7+random(-5,5);
  x8=x8+random(-5,5);
  x9=x9+random(-5,5);
  x10=x10+random(-5,5);
  x11=x11+random(-5,5);
  x12=x12+random(-5,5);
  x13=x13+random(-5,5);
  x14=x14+random(-5,5);
  x15=x15+random(-5,5);
  x16=x16+random(-5,5);
  x17=x17+random(-5,5);
  x18=x18+random(-5,5);
  x19=x19+random(-5,5);
  y=y+1;
}
