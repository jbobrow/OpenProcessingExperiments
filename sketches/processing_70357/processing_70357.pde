
int x = 2;
int y = 1;
int rainstart = -100;
int rain = 100;
int changex =1;
void setup()
{
  size(800, 600);
}

void draw()
{
  rain();
  cloud();
}

void cloud()
{
  stroke(255);
  ellipse(100+x, 50, 200, 100);
  ellipse(200+x, 50, 200, 100);
  ellipse(300+x, 50, 200, 100);
  ellipse(400+x, 50, 200, 100);
  ellipse(500+x, 50, 200, 100);
 // x=x+1;
}

void rain()
{
  background(0);
  stroke(0, 255, 255);
  y=y+5;
  line(60+x, rainstart+y, 50+x, rain);
  line(70+x, rainstart+y, 60+x, rain);
  line(80+x, rainstart+y, 70+x, rain); 
  line(90+x, rainstart+y, 80+x, rain);
  line(100+x, rainstart+y, 90+x, rain);
  line(110+x, rainstart+y, 100+x, rain);//+y);
  line(120+x, rainstart+y, 110+x, rain);//+y);
  line(130+x, rainstart+y, 120+x, rain);//+y);
  line(140+x, rainstart+y, 130+x, rain);//+y);
  line(150+x, rainstart+y, 140+x, rain);//+y);
  line(160+x, rainstart+y, 150+x, rain);//+y);
  line(170+x, rainstart+y, 160+x, rain);//+y);
  line(180+x, rainstart+y, 170+x, rain);//+y);
  line(190+x, rainstart+y, 180+x, rain);//+y);
  line(200+x, rainstart+y, 190+x, rain);//+y);
  line(210+x, rainstart+y, 200+x, rain);//+y);
  line(220+x, rainstart+y, 210+x, rain);//+y);
  line(230+x, rainstart+y, 220+x, rain);//+y);
  line(240+x, rainstart+y, 230+x, rain);//+y);
  line(250+x, rainstart+y, 240+x, rain);//+y);
  line(260+x, rainstart+y, 250+x, rain);//+y);
  line(270+x, rainstart+y, 260+x, rain);//+y);
  line(280+x, rainstart+y, 270+x, rain);//+y);
  line(290+x, rainstart+y, 280+x, rain);//+y);
  line(300+x, rainstart+y, 290+x, rain);//+y);
  line(310+x, rainstart+y, 300+x, rain);//+y);
  line(320+x, rainstart+y, 310+x, rain);//+y);
  line(330+x, rainstart+y, 320+x, rain);//+y);
  line(340+x, rainstart+y, 330+x, rain);//+y);
  line(350+x, rainstart+y, 340+x, rain);//+y);
  line(360+x, rainstart+y, 350+x, rain);//+y);
  line(370+x, rainstart+y, 360+x, rain);//+y);
  line(380+x, rainstart+y, 370+x, rain);//+y);
  line(390+x, rainstart+y, 380+x, rain);//+y);
  line(400+x, rainstart+y, 390+x, rain);//+y);
  line(410+x, rainstart+y, 400+x, rain);//+y);
  line(420+x, rainstart+y, 410+x, rain);//+y);
  line(430+x, rainstart+y, 420+x, rain);//+y);
  line(440+x, rainstart+y, 430+x, rain);//+y);
  line(450+x, rainstart+y, 440+x, rain);//+y);
  line(460+x, rainstart+y, 450+x, rain);//+y);
  line(470+x, rainstart+y, 460+x, rain);//+y);
  line(480+x, rainstart+y, 470+x, rain);//+y);
  line(490+x, rainstart+y, 480+x, rain);//+y);
  line(500+x, rainstart+y, 490+x, rain);//+y);
  line(510+x, rainstart+y, 500+x, rain);//+y);
  line(520+x, rainstart+y, 510+x, rain);
  line(530+x, rainstart+y, 520+x, rain);
  line(540+x, rainstart+y, 530+x, rain);
  line(550+x, rainstart+y, 540+x, rain);
  x=x+changex;
  if (rainstart>600)
  {
    rainstart=0;
  }
  if (rain>600)
  {
    rain=0;
  }
  if (x>800)
  {
    changex = -1;
  }
  if (x<-100)
  {
    changex = 1;
  }
  println(x);
}
