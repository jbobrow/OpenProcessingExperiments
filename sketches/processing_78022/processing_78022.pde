
float shouldDraw=0;
float whichWord;
float x;
float i;
float p = 0;
float q = 0;
float w = 0;
float z = 0;
PImage kind;
PImage dillon;
PImage nice;
PImage thoughtful;
PImage perfect;
PImage generous;
PImage sentence;
PImage sentence2;
float whiteExpand=0;
void setup()
{
  size(500,500);
  smooth();
  background(255);
  perfect = loadImage("Perfect.png");
  dillon = loadImage("Person.png");
  generous = loadImage("Generous.png");
  kind = loadImage("Kind.png");
  nice = loadImage("Nice.png");
  thoughtful = loadImage("Thoughtful.png");
  sentence = loadImage("Sentence.png");
  sentence2 = loadImage("Sentence2.png");
}
void draw() 
{
   float currentTime = millis() / 1000.0;//thanks to Brian Schrank
  noStroke();
  //Draws the person
  if(currentTime<1)
  {
    image(dillon,0,0);//person
  }
  if(currentTime > 2 && currentTime<12)
  {
    image(sentence,115,20);
  }
  if(currentTime>3&&currentTime<3.5)
  {
    image(nice,50,100);
  }
  if(currentTime>3.75&&currentTime<4)
  {
    image(kind,350,400);
  }
  if(currentTime>4.5&&currentTime<4.75)
  {
    image(thoughtful,100,350);
  }
  if(currentTime>5.4&&currentTime<5.65)
  {
    image(generous,360,60);
  }
  if(currentTime > 6 && currentTime <11)
  {
    whichWord=random(8);
    if(shouldDraw==0)
    {
      if(whichWord<2)
      {
        image(thoughtful,random(500),random(500));
      }
      else if(whichWord<4)
      {
        image(generous,random(500),random(500));
      }
      else if(whichWord<6)
      {
        image(kind,random(500),random(500));
      }
      else
      {
        image(nice,random(500),random(500));
      }
      shouldDraw=1;
    }
    else if(shouldDraw>0)
    {
      shouldDraw--;
    }
  }
  if (currentTime>11&&currentTime<13)
  {
    fill(255);
    ellipse(250,250,5+whiteExpand,5+whiteExpand);
    whiteExpand=whiteExpand+30;
  }
  if(currentTime>13&&currentTime<14)
  {
    fill(255,255,255,255-(p*4));
    image(perfect,200,240);
    rect(0,0,500,500);
    p++;
  }
  if(currentTime>15.5&&currentTime<17)
  {
    fill(255,255,255,0+(q*4));
    rect(0,0,500,500);
    q++;
  }
  if(currentTime>17)
  {
    fill(255);
    rect(0,0,500,500);
    image(dillon,0,0);//person
    i++;
    fill(255,255,255,255-(i*4));
    rect(0,0,500,500);
    w++;
    image(sentence2,560-(w*5),0);
  }
  if(currentTime>19)
  {
    fill(0,0,0,0+(z));
    rect(0,0,500,500);
    z++;
  }
}

