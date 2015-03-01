
PImage mask;
PImage football;
PImage bro;
PImage spoiled;
PImage gamer;
PImage runner;
PImage writer;
PImage mad;
PImage jay;
 
int X=0;
 
PFont write;
 
void setup()
{
  write = createFont("Comic Sans");
   
  frameRate(10);
   
  size(600,400);
  background(#FFFFFF);
  
  mask = loadImage("mask.jpeg");
  football = loadImage("football.jpg");
  bro = loadImage("bro.jpg");
  spoiled = loadImage("spoiled.jpg");
  gamer = loadImage("gamer.jpg");
  runner = loadImage("runner.jpg");
  writer = loadImage("writer.jpg");
  mad = loadImage("mad.jpg");
  jay = loadImage("jay.jpg");
}
 
 
void draw()
{
  X++;
  mask.resize(600,400);
  image(mask, 0 ,0);
  textFont(write, 40);
  fill(#620C0C);
  text("Who is the man under the mask?", 0, 300);
  if(X>20)
  {
    fill(#7E3737);
    text("first the mask", 100, 350);
  }
  if(X>30)
  {
    football.resize(600,400);
    image(football, 0, 0);
    fill(#032C0E);
    text("So you think I'm a jock?", 0, 50);
  }
  if(X>40)
  {
    fill(#FFFFFF);
    text("well you're sorta right...", 50, 350);
  }
  if(X>50)
  {
    bro.resize(600,400);
    image(bro, 0, 0);
    fill(#DC10E8);
    text("Total BRRRROOO right?", 50, 200);
  }
  if(X>60)
  {
    fill(#E77CED);
    text("nope, just a dude", 25, 300);
  }
    if(X>70)
  {
    spoiled.resize(600,400);
    image(spoiled, 0, 0);
    fill(#DE1C12);
    text("Seriously? Screw my roommate...", 0, 300);
  }
  if(X>80)
  {
    fill(#DE5312);
    text("yeah, he's wrong", 25, 350);
  }
  if(X>90)
  {
    gamer.resize(600,400);
    image(gamer, 0, 0);
    fill(#36DE12);
    text("Real me...", 100, 250);
  }
  if(X>100)
  {
    fill(#55CDF0);
    text("....just not that attractive", 0, 350);
  }
  if(X>110)
  {
    runner.resize(600,400);
    image(runner, 0, 0);
    fill(random(100,100,100));
    text("Yeah, still do", 300, 300);
  }
  if(X>120)
  {
    fill(#BB8EF7);
    text("just not competitively", 100, 350);
  }
  if(X>130)
  {
    writer.resize(600,400);
    image(writer, 0, 0);
    fill(#580904);
    text("I like writing stories", 50, 50);
  }
  if(X>140)
  {
    fill(#D8D02E);
    text("and sometimes poems...", 100, 325);
  }
    if(X>150)
  {
    mad.resize(600,400);
    image(mad, 0, 0);
  }
  if(X>165)
  {
    jay.resize(600,400);
    image(jay, 0, 0);
    fill(#FFFFFF);
    text("sorry, not sorry Jay", 200, 350);
  }
}


