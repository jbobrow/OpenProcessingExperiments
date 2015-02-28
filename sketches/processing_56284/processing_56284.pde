
Cat c1;
Cheez cheez1, cheez2, cheez3, cheez4, cheez5;
Mushroom mush1, mush2, mush3;
Lazer l1;

PImage catty, p1, cheez, bg, mush, title, title2;
PImage zzz, end1;
PImage im1, im2, im3, heart1;

int page = 1;

int c; //time
int sc = 0;
int heart = 9;
int startMillis;

float r = 150;
float g = 96;
float b = 127;

float plus = 1;
float trans = 255;


float begin;
boolean shade = false;


void setup()
{
  PFont font = loadFont("04b25-30.vlw");
  textFont(font);
  imageMode(CENTER);
  smooth();
  size(800, 500); 


  catty = loadImage("cat1.png");
  zzz = loadImage("cheez.png");
  bg = loadImage("game.png");
  mush = loadImage("mush.png");
  im1 = loadImage("1.png");
  im2 = loadImage("2.png");
  im3 = loadImage("3.png");
  title = loadImage("game1.png");
  title2 = loadImage("game2.png");
  end1 = loadImage("end1.png");
  heart1 = loadImage("heart.png");

  c1 = new Cat();
  cheez1 = new Cheez();
  cheez2 = new Cheez();
  cheez3 = new Cheez();
  cheez4 = new Cheez();
  cheez5 = new Cheez();

  mush1 = new Mushroom();
  mush2 = new Mushroom();
  mush3 = new Mushroom();
  
  l1 = new Lazer();
}

void draw()
{
  if (page==1) {
    pageOne();
  }
  else if (page==2) {
    pageTwo();
  }
  else if (page==3) {
    pageThree();
  }
  else if (page==4) {
    pageFour();
  }
  else if (page==5) {
    pageFive();
  }
}

void mousePressed ()
{
  if (page==1)
  {
    page = 2;
  }

  if ((page==2)&&(mouseX>312&&mouseX<475&&mouseY>210&&mouseY<290))
  {
    page = 3;
    begin = millis();
  }

  if ((page==4))
  {
    page = 2;
    sc = 0;
    heart = 9;
    cheez1.xpos = -26;
    cheez2.xpos = -26;
    cheez3.xpos = -26;
    cheez4.xpos = -26;
    cheez5.xpos = -26;
    mush1.xpos = -26;
    mush2.xpos=-26;
    c1.xpos = width/2;
    c1.ypos = height/2;
  }
}

void pageOne()
{
  background(150, 96, 127);
  image(bg, width/2, height/2);
  image(title, width/2, height/2);
  image(catty, width/2, height/2);
}
void pageTwo()
{
  background(150, 96, 127);
  image(bg, width/2, height/2);
  image(title2, width/2, height/2);
  image(catty, width/2, height/2);

  r = 150;
  g = 96;
  b = 127;
  plus = 1;
  trans = 255;
}

void pageThree()
{
  background(r, g, b);
  image(bg, width/2, height/2);


//  l1.display();
//  l1.update();
//  l1.keyPressed();


  c1.display();

  cheez1.display();
  cheez1.update();
  cheez1.check(c1);

  cheez2.display();
  cheez2.update();
  cheez2.check(c1);

  cheez3.display();
  cheez3.update();
  cheez3.check(c1);

  cheez4.display();
  cheez4.update();
  cheez4.check(c1);

  cheez5.display();
  cheez5.update();
  cheez5.check(c1);

  mush1.display();
  mush1.update();
  mush1.check(c1);

  mush2.display();
  mush2.update();
  mush2.check(c1);

  mush3.display();
  mush3.update();
  mush3.check(c1);
  


  //  ////////////TIMER/////////////////////
  //  startMillis = millis();
  //  if (c >= 0)
  //  {
  //    c = int((21 - (millis()-begin)/1000));
  //    println( "SEC: "+c+"");
  //    String message = ("Timer: "+c+"");
  //    fill(255);
  //    text (message, 25, 20, 200, 100);
  //  }

  if ((sc>=10)&&(sc<=13))
  {
    String messagea = (
    "You've got to be kitten me!");
    textAlign(CENTER);
    text (messagea, 175, 220, 500, 200);
  }

  if ((sc>=50)&&(sc<=53))
  { 
    String messageb = (
    "Meeeeeee-yow!");
    textAlign(CENTER);
    text (messageb, 175, 220, 500, 200);
  }
  
    if ((sc>=100)&&(sc<=103))
  { 
    String messagec = (
    "R U FUR REAL?");
    textAlign(CENTER);
    text (messagec, 175, 220, 500, 200);
  }
  //  //////////////////END TIMER////////////////

  textAlign(LEFT);
  String message2 = ("Score: "+sc+"");
  fill(255);
  text (message2, 25, 20, 200, 100);

  image(heart1, 670, 47);
  String message3 = ("x "+heart+"");
  fill(255);
  text (message3, 720, 25, 200, 100);
  if (heart <= 0)
  {
    shade = true;
    heart=0;
  }

  if (shade==true)
  {
    r-=0.5;
    g-=0.5;
    b-=0.5;

    plus=0;
    trans--;
  }

  if (r==0)
  {
    page =4;
  }
}

void pageFour()
{ 
  background(r, g, b);
  image(bg, width/2, height/2);
  image(end1, width/2, height/2);
  shade=false;

  textAlign(LEFT);
  String message2 = ("Score: "+sc+"");
  fill(255);
  text (message2, 25, 20, 200, 100);

  image(heart1, 670, 47);
  String message3 = ("x 0");
  fill(255);
  text (message3, 720, 25, 200, 100);
}

void pageFive()
{
}


