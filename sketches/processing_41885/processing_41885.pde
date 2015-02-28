
PFont f;
//waterdrops
float myDiameter = 10;
float myDiameter1 = 10;
float centery = 0;
float centerx  = 415;
float centerx1 = 160;
float centery1 = 0;
float velocity = 0;
float velocity1 = 0;
int lastminute;
int m;

void setup()
{
  size(600, 500);
  smooth();
  f = loadFont("Impact-48.vlw");
}

void draw()
{

  background(255);

  //time
  int m = minute();
  int h = hour();
  int s = second();
  m = minute();



  //printing the time with a 0 infront of the minutes if the minutes are less than 10
  if (m < 10) {
    String time = (h) + " : " + "0" + m;
    text(time, 300, 300);
  }
  else 
  {
    String time = h + " : " + m;
    text(time, 300, 300);
  }


  minuteBlock();
  hourBlock();


  textAlign(CENTER);
  randomSeed(1*h);
  //random fill color
  fill((random(0, 255))-(m*2), (random(0, 255))-(m*2), (random(0, 255))-(m*2));
  
  waterminutes();
  waterseconds();



  textFont(f);
  textSize(200);
}




void minuteBlock()
{
  noStroke();
  fill(255);
  rect(330, 138, width, 165-(second()*2.7));
  if (hour() < 10)
  {
    rect(270, 138, width, 165-(second()*2.7));
  }
}

void hourBlock()
{
  noStroke();
  fill(255);
 
  if (hour() < 10)
  {
    rect(0, 138,200, 165-(minute()*2.7));
  }
  if (hour() > 10)
  {
     rect(0, 138, 250, 165-(minute()*2.7));
  }
}


void waterseconds()
{
  int s = second();
  s = second();

  centery = centery + velocity;

  if (centery<0+myDiameter/2) {
    velocity = (290/49);
  }

  if ((centery>300-(second()*2.7))) {
    velocity = 0;
    centery = -s*2.7;
    println (centery);
  }
  ellipse (centerx, centery, myDiameter, myDiameter);
}



void waterminutes()
{
  int m = minute();
  m = minute();

  centery1 = centery1 + velocity1;

  if (centery1<0+myDiameter1/2) {
    velocity1 = (290/48.9);
  }

  if ((centery1>300-(minute()*2.7)+20)) 
  {

   velocity1 = 0;
  


    println (centery1);
  }

    if (m != lastminute)
    {
      println ("last minute");
      centery1 = 0;
      lastminute = m;
      fill(255,255,255);
     ellipse (centerx1, centery1, myDiameter, myDiameter);
     
       
    }
  ellipse (centerx1, centery1, myDiameter, myDiameter);
 
}


