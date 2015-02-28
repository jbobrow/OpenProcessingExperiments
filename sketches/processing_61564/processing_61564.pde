
PFont font;
PImage Friend; 
PImage Me;
PImage Okay;
PImage No;
PImage pizza;

PImage Next;

boolean stage1 = true;
boolean stage2 = false;
boolean stage3 = false;

boolean bCheck = false;

String Answer = "";


int x = 0;
int timer=0;
float mySpeed = 0;
float pizzaSpeed = 0;

void setup()
{
  size(800, 800);
  font = loadFont("NanumGothicBold-32.vlw");
  textFont(font);

  Friend = loadImage("friend.png");
  Me = loadImage("me.png");
  Okay = loadImage("okay.png");
  No = loadImage("no.png");
  pizza = loadImage("pizzaDilivery.png");

  Next = loadImage("next.png");
}

void draw()
{
  background(0);

  if (stage2)
  {
    if ( x!= 800)
    {
      x+=5;
    }
  }

  if ( stage3)
  {
    if ( x!= 1600)
    {
      x+=5;
    }
  }


  translate(-x, 0);
  stage1();
  stage2();
  stage3();
}

void stage1()
{
  String Info1 = "피자를 주문하였다\n피자집과 친구집은 같은 위치에있다.\n피자집&친구집과 우리집 사이의 거리는 12km이다.\n피자 배달부의 오토바이는 시속 60km/h로 움직인다.\n친구가 xkm/h로 자전거를 타고 갈 때\n1시간이 더 걸려서 도착한다고 한다.\n친구는 몇 km/h로 가야하는가?";
  text(Info1, 50, height/3);

  image(Next, width-200, height-200, 200, 200);
}

void stage2()
{

  if (key == ENTER)
  {
    timer++;



    if (mySpeed < 480)
      mySpeed += float (Answer) / 10;

    if (timer>=400)
      if (pizzaSpeed < 480)
        pizzaSpeed += 6;
  }

  translate(800, 0);

    text("진행한 거리 " +  int(mySpeed/40)+" km", width/2, height/2);



  pushMatrix();
  translate(mySpeed, 0);
  image(Friend, 100, 100, 150, 150);
  popMatrix();


  pushMatrix();
  translate(pizzaSpeed, 0);
  image(pizza, 100, 500, 150, 150);
  popMatrix();


  String Info2 = "Enter the Answer";

  text(Answer+"km/h", width/2 - 50, 300);
  text("60km/h", width/2 - 50, 700);

  if ( pizzaSpeed >= 480 && mySpeed >= 480)
  {
    if ( float(Answer) == 10)
    {
      image(Okay, width/2 -200, height/2 -200, 400, 400);
    }
    else {
      image(No, width/2 -200, height/2 -200, 400, 400);
      text("멍청이, 넌 피자를 먹지 못해", width/2-200, height-150);
    }
  }
}

void stage3()
{
  translate(1600, 0);
}


