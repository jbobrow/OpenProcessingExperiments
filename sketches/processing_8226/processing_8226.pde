
//Made By Andrew Wong (Graphics belong to Andrew Wong)
//With Assistance from Altun Luu and Mike Wang

PFont font;
PImage DiceEmpty;
PImage Dice0;
PImage Dice1;
PImage Dice2;
PImage Dice3;
PImage Dice4;
PImage Dice5;
PImage Dice6;
PImage Dice7;
PImage Dice8;
PImage Dice9;
PImage DiceBG;
int value = 9000;
int writingx = 20;
int writingy = 40;


void setup ()
{
  size(600,600);
  background(25);
  //DiceBG = loadImage("DiceBG.png");
  smooth();
  stroke(255);
  font = loadFont("TimesNewRomanPSMT-25.vlw");
  textFont(font);
  DiceEmpty = loadImage("10SidedDie.png");
  Dice0 = loadImage("0Dice.png");
  Dice1 = loadImage("1Dice.png");
  Dice2 = loadImage("2Dice.png");
  Dice3 = loadImage("3Dice.png");
  Dice4 = loadImage("4Dice.png");
  Dice5 = loadImage("5Dice.png");
  Dice6 = loadImage("6Dice.png");
  Dice7 = loadImage("7Dice.png");
  Dice8 = loadImage("8Dice.png");
  Dice9 = loadImage("9Dice.png");
  DiceBG = loadImage("DiceBG.png");
  imageMode(CENTER);
  image(DiceEmpty,width/2,height/2);


}

void draw ()
{
float x=width/1.12;
float y=height/1.09;
float widthx=width/14.286;
float heighty=height/26.08696;


  fill(255);
  text("Roll", width/1.12,height/1.05);
  fill(255,255,255,0);
  rect(x,y,widthx,heighty);


    /*if (mouseX<=1.12 && mouseX>= widthx &&
    mouseY <= 1.05 && mouseY>= heighty)
    {       value= (int)random(0,9);
      fill(255);
      text(value,width/2,height/2);
    }
    */
    
  
}

void mouseReleased()
    {  

      if (mouseX > width*.88333 && mouseY > height*.88333) // dice will only roll when mouse is over 500
      {
      value= (int)random(0,10);
      if (value<1)
    {
  image(Dice0,width/2,height/2);
  fill(255);
  text("0",writingx,writingy);
  writingx = writingx + 20;
    }
      if (value<2 && value>0)
    {
  image(Dice1,width/2,height/2);
  fill(255);
  text("1",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<3 && value>1)
    {
  image(Dice2,width/2,height/2);
  fill(255);
  text("2",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<4 && value>2)
    {
  image(Dice3,width/2,height/2);
  fill(255);
  text("3",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<5 && value>3)
    {
  image(Dice4,width/2,height/2);
  fill(255);
  text("4",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<6 && value>4)
    {
  image(Dice5,width/2,height/2);
  fill(255);
  text("5",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<7 && value>5)
    {
  image(Dice6,width/2,height/2);
  fill(255);
  text("6",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<8 && value>6)
    {
  image(Dice7,width/2,height/2);
  fill(255);
  text("7",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<9 && value>7)
    {
  image(Dice8,width/2,height/2);
  fill(255);
  text("8",writingx,writingy);
  writingx = writingx + 20;
    }
    if (value<10 && value>8)
    {
  image(Dice9,width/2,height/2);
  fill(255);
  text("9",writingx,writingy);
  writingx = writingx + 20;
    }
    
  if (writingx>561)
  {
    writingx = 20;
    writingy= writingy + 30;
  }
  if (writingy>240 && writingy<399)
  {
    writingy = 400;
  }
      }
/*float widthx=width/14.286;
float heighty=height/26.08696;

    if (mouseX<=1.12 && mouseX>= widthx &&
    mouseY <= 1.05 && mouseY>= heighty)
    {
      value= (int)random(0,9);
      fill(255);
      text(value,width/2,height/2);
    }*/
    }

