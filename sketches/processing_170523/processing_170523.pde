
/* @pjs font="Georgia.ttf,Impact.tff"; */
int worldClock;
PFont georgia;
PFont impact;
PImage angerimpact;

void setup()
{
  size(900,618);
  worldClock=0;
  georgia=createFont("Georgia",32);
  impact=createFont("Impact",48);
  textFont(impact);
  angerimpact=loadImage("angerimpact.png");
  
}



void draw() {

  background(#2D2833);

  
  worldClock++;
  if(worldClock<1800)
  {
    pushMatrix();
    scale(-2.0, 2.0);
    image(angerimpact,-angerimpact.width-0,0);
    popMatrix();
  }
  else{
    pushMatrix();
    scale(-2.0, 2.0);
    tint(#2DCCC9);
    image(angerimpact,-angerimpact.width,0);
    popMatrix();
  }
  if(worldClock<360)
  {
    text("Isn’t this face great?",450,200);
    if(worldClock>180)
      text("I mean, look at it",450,400);
  }
  if(worldClock>360&&worldClock<720)
  {
    text("This is a face of pure",400,300);
    text("anger",400,350);
    if(worldClock>480)
      text("rage",450,400);
    if(worldClock>600)
      text("hatred",500,450);
  }
  if(worldClock>720&&worldClock<900)
  {
    text("It actually has a name,",450,309);
    text("you know",450,359);
    textSize(18);
    if(worldClock>800)
      text("*and I swear I didn't make this up",450,400);
    textSize(48);
  }
  if(worldClock>900&&worldClock<1200)
  {
    textSize(150);
    text("ANGER",450,230+random(10));
    if(worldClock>990)
      text("IMPACT",420,400+random(10));
  }
  if(worldClock>1200&&worldClock<1380)
  {
    textSize(48);
    text("so much",480,300);
    if(worldClock>1260)
      text("in just",480,350);
    if(worldClock>1320)
      text("two words",480,400);  
  }
  if(worldClock>1380&&worldClock<1680)
  {
    textSize(150);
    text("ANGER",450,230+random(10));
    if(worldClock>1470)
      text("IMPACT",420,400+random(10));
  }
  if(worldClock>1680&&worldClock<1800)
  {
    textFont(georgia);
    text("Magnifique.",600,300);  
  }
  if(worldClock>1800&&worldClock<1980)
  {
    textFont(impact);
    text("And it comes from ",450,230);
    text("a strong contender for",450,280);
    if(worldClock>1890)
      text("“worst game I ever played”",370,400);
  }
  if(worldClock>1980&&worldClock<2340)
  {

    text("This game",450,230);
    if(worldClock>2070)
    {
      textSize(12);
      text("which I will not name because it's that bad",460,300);
      textSize(48);
    }
    if(worldClock>2160)
      text("is pure awful",470,400);
  }
  if(worldClock>2340&&worldClock<2700)
  {

    text("It's boring",450,309);
    if(worldClock>2400)
      text("stupid",750,100);
    if(worldClock>2460)
      text("tedious",700,500);
    if(worldClock>2520)
      text("illiterate",350,170);
    if(worldClock>2580)
      text("monotonous",400,444);
    if(worldClock>2640)
      text("just plain bad",600,200);
    
  }
  if(worldClock>2700)
  {
    text("Something so great",450,200);
    text("from something so",450,250);
    text("crap",450,300);
    if(worldClock>2880)
      text("Strange, no?",450,400);
  }
}




