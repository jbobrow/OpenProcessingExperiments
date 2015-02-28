
int dragX = 80,dragY= 420,moveX,moveY;
int drag2X = 250,drag2Y= 420;
int drag3X = 420, drag3Y = 400;
int SX = 250;
int CX = 400;
int SCA = 60, SCY = 50;
int TX = 80,TY = 20, TX2 = 50, TY2 = 80, TX3 = 110,TY3 = 80;
float running = 0;
float chase = 0;
float move = 0;
float mX = 0;
float mY = 0;
float timer = 0;
float fly = 0;
float timer2 = 0;
boolean ready= false;
boolean meteor2 = false;
boolean BHorse = false;
boolean grass= false;
boolean clean = false;
boolean okay2 = false;
boolean sunshine = false;
boolean victim = false;
boolean alive = false;
boolean grab = false;
boolean select = false;
PImage rainbow;
PImage sun;
PImage flowers;
PImage chainsaw;
PImage run;
PImage okay;
PImage notOkay;
PImage puddle;
PImage horse;
PImage meteor;
PImage explosion;
PImage arrow;
PImage dead;

void setup()
{
  size(500,500);
  smooth();
  noStroke();
  rectMode(CENTER);
  rainbow = requestImage("rainbow.png");
  sun = requestImage("sun.png");
  flowers = requestImage("flowers.png");
  chainsaw = requestImage("chainsaw.png");
  run = requestImage("run.png");
  okay = requestImage("okay.png");
  notOkay = requestImage("Notokay.png");
  puddle = requestImage("Puddle.png");
  horse = requestImage("horse.png");
  meteor = requestImage("Meteor.png");
  explosion = requestImage("explosion.png");
  arrow = requestImage("arrow.png");
  dead = requestImage("dead.png");
}



void draw()
{
  background(255);
  //Shape Holes
  fill(150);
  rect(SX,SCY,SCA,SCA);
  ellipse(CX,SCY,SCA,SCA);
  triangle(TX,TY,TX2,TY2,TX3,TY3);
  
  //Shapes
  fill(220,10,10);
  rect(dragX,dragY,40,40);
  fill(10,10,220);
  ellipse(drag2X,drag2Y,40,40);
  fill(10,220,10);
  triangle(drag3X,drag3Y,drag3X-20,drag3Y+40,drag3X+20,drag3Y+40);

  //Square Slot
  if (SX > (dragX-20) && SCY > (dragY-20) && SX < (dragX + 20) && SCY < (dragY + 20))
  {
    image(rainbow,10,100,480,300);
  }
  //Circle Slot
  if (CX > (drag2X-15) && SCY > (drag2Y-15) && CX < (drag2X + 15) && SCY < (drag2Y + 15))
  {
    sunshine = true;
    image(sun,400,100,100,100);
  }
  //Triangle Slot
  if (TX > (drag3X-30) && TY > (drag3Y-30) && TX < (drag3X + 30) && TY < (drag3Y + 30))
  {
    image(flowers,220,350,50,50);
    grass = true;
  }
  else
  {
    grass = false;
  }
  
  //Wrong Slot Circle-Square
  if (SX > (drag2X-20) && SCY > (drag2Y-20) && SX < (drag2X + 20) && SCY < (drag2Y + 20))
  {
    BHorse = true;
    image(horse,270,320,100,70);
  }
  //Wrong Slot Triangle-Square
  if (SX > (drag3X-40) && SCY > (drag3Y-40) && SX < (drag3X + 40) && SCY < (drag3Y + 40))
  {
    okay2 = true;
    ready = true;
    fill(255);
    image(okay,200,310,103,94);
    //melting
    if ((sunshine == true) && (okay2 == true))
    {
      fill(255);
      rect(250,350,120,100);
      image(notOkay,200,310,110,94);
    }
    if ((clean == true) && (sunshine == true) && (okay2 == true))
    {
      rect(250,350,120,100);
      image(puddle,200,310,110,94);
    }
    else
    {
      sunshine = false;
      okay2= false;
    }
  }
  //Wrong Slot Square-Circle
  if (CX > (dragX-20) && SCY > (dragY-20) && CX < (dragX + 20) && SCY < (dragY + 20))
  {
    meteor2 = true;
    image(meteor,(mX + 10),(mY + 10),70,78);
    if ((meteor.Y < 320) && BHorse == true && grass == true)
    {
      timer = timer + (1.0/30.0);
    }
    if (timer > 0 && timer < 3)
    {
      mX = mX + 3;
      mY = mY + 3;
    }
    else
    {
      mX = mX;
      mY = mY;
    }
    if (timer> 3)
    {
      image(explosion,170,220,200,200);
    }
  }
  //Wrong Slot Triangle-Circle
  if (CX > (drag3X-40) && SCY > (drag3Y-40) && CX < (drag3X + 40) && SCY < (drag3Y + 40))
  {
    image(chainsaw,(chase+20),310,103,94);
    alive = true;
  }
  //Wrong Slot Circle-Triangle
  if (TX > (drag2X-60) && TY > (drag2Y-60) && TX < (drag2X + 60) && TY < (drag2Y + 60))
  {
    victim= true;
    if (victim == true && ready == true && meteor2 == true)
    {
      fly = fly + 3;
      timer2 = timer2 + (1.0/30.0);
    }
    if (timer2 < 3)
    {
      image(arrow,(-80+fly),350,40,40);
    }
    if (timer2 > 3)
    {
      fill(255);
      rect(280,355,103,94);
      image(dead,200,310,100,70);
    }
    else
    {
      fill(255);
      rect(240,355,120,94);
      image(run,(running +200),310,103,94);
    }
  }
  //Wrong Slot Square-Triangle
  if (TX > (dragX-60) && TY > (dragY-60) && TX < (dragX + 60) && TY < (dragY + 60))
  {
    clean = true;
  }
  //Chainsaw Chase
  if ((alive == true) && (victim==true))
  {
    if ((run.X-chainsaw.X)<200)
    {
      running = running+ 3;
      chase = chase +3;
    }
  }
  else
  {
    running = 0;
    chase = 0;
  } 
}

void mouseDragged()
{
  if (mouseX > (dragX-20) && mouseY > (dragY-20) && mouseX < (dragX + 20) && mouseY < (dragY + 20))
  {
    dragX = mouseX;
    dragY = mouseY;
  }
  if (mouseX > (drag2X-15) && mouseY > (drag2Y-15) && mouseX < (drag2X + 15) && mouseY < (drag2Y + 15))
  {
    drag2X = mouseX;
    drag2Y = mouseY;
  }
  if (mouseX > (drag3X-30) && mouseY > (drag3Y-30) && mouseX < (drag3X + 30) && mouseY < (drag3Y + 30))
  {
    drag3X = mouseX;
    drag3Y = mouseY;
  }
}


