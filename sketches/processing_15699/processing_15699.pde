
PImage paper1;
PImage paper2;
PImage paper3;
PImage paper4;
PImage paper5;
PImage paper6;
PImage paper7;
PImage paper8;
PImage paper9;
PImage paper10;

void setup()
{
  size(640, 480);
  smooth();
  paper1 = loadImage("1.png");
  paper2 = loadImage("2.png");
  paper3 = loadImage("3.png");
  paper4 = loadImage("4.png");
  paper5 = loadImage("5.png");
  paper6 = loadImage("6.png");
  paper7 = loadImage("7.png");
  paper8 = loadImage("8.png");
  paper9 = loadImage("9.png");
  paper10 = loadImage("10.png");
}

void draw()
{
  background(255);
  

  if((mouseX > 0) && (mouseX < 64))
  {
    image(paper1, 0, 0);
  }
  else if((mouseX > 65) && (mouseX < 129))
  {
    image(paper2, 0, 0);
  }
  else if((mouseX > 130) && (mouseX < 194))
  {
    image(paper3, 0, 0);
  }
  else if((mouseX > 195) && (mouseX < 259))
  {
    image(paper4, 0, 0);
  }
  else if((mouseX > 260) && (mouseX < 324))
  {
    image(paper5, 0, 0);
  }
  else if((mouseX > 325) && (mouseX < 389))
  {
    image(paper6, 0, 0);
  }
  else if((mouseX > 390) && (mouseX < 454))
  {
    image(paper7, 0, 0);
  }
  else if((mouseX > 455) && (mouseX < 519))
  {
    image(paper8, 0, 0);
  }
  else if((mouseX > 520) && (mouseX < 584))
  {
    image(paper9, 0, 0);
  }
  else if((mouseX > 585) && (mouseX < 640))
  {
    image(paper10, 0, 0);
  }
}

