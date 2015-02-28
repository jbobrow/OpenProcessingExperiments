
PFont font;

boolean stage1 = true;
boolean stage2 = false;
boolean stage3 = false;

PImage Next = loadImage("next.png");

PImage Pizza;

PImage Okay;
PImage No;

String Answer = "";

int x = 0;

void setup()
{

  size(800, 800);
  font = loadFont("NanumGothicBold-32.vlw");
  textFont(font);


  Pizza = loadImage("pizzaAndR.png");
  Okay = loadImage("okay.png");
  No = loadImage("no.png");
}

void draw()
{
  background(0);

  pushMatrix();
  translate(-x, 0);
  stage1();
  stage2();
  popMatrix();

  if (stage2)
  {
    if (x != 800)
    {
      x+=5;
    }

    if ( key == ENTER)
    {
      if ( int(Answer) == 60)
      {
        image(Okay, width/2 -300, height/2 -300, 600, 600);
      }

      else
      {
        image(No, width/2 -300, height/2 -300,600, 600);
      }
    }
  }
}

void stage1()
{
  String Info1 = "원의 방정식 일반형을 사용하여 \n반지름을 구하세요!\n반지름이 즉 피자의 크기입니다!\n크기를 맞추지 못하면 \n피자를 먹지 못해요!\n\nx^2+y^2-800x-800y+2840=0";
  text(Info1, 50, 200);

  image(Next, width-100, height-100, 100, 100);
}

void stage2()
{

  translate(800, 0);
  String Problem = "x^2+y^2-800x-800y+2840=0";
  text(Problem, 100, 100);

  image(Pizza, width/2- 200, height/2-200, 400, 400); 

  text("반지름 :  " + Answer, 50, height-100);
}


