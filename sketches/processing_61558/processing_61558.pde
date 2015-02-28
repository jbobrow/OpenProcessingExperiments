
PImage Menu;
PImage Large;
PImage Lunch;
PImage Regular;

PImage SEL1;
PImage SEL2;
PImage SEL3;

PImage problem1;

PImage OK;
PImage NO;

PImage Next;

int price;
int myMoney = 50000;
int nSelect = 0;
int x = 0;
boolean stage1 = true;
boolean stage2 = false;
boolean stage3 = false;

String Answer = "";
void setup()
{
  size(800, 800);
  noStroke();
  smooth();

  Menu = loadImage("menu.png");
  Regular = loadImage("regular.png");
  Lunch = loadImage("lunch.png");
  Large = loadImage("large.png");
  SEL1 = loadImage("one.png");
  SEL2 = loadImage("two.png");
  SEL3 = loadImage("three.png");

  problem1 = loadImage("problem1.png");

  OK = loadImage("okay.png");
  NO = loadImage("no.png");
  
  Next = loadImage("next.png");
}

void draw()
{
  background(0);

  switch(nSelect)
  {
  case 1:
    {
      stroke(255);
      strokeWeight(5);
      rect( 150, 250, 300, 100);
      break;
    }
  case 2:
    {
      stroke(255);
      strokeWeight(5);
      rect( 150, 400, 300, 100);
      break;
    }
  case 3:
    {
      stroke(255);
      strokeWeight(5);
      rect( 150, 550, 300, 100);
      break;
    }
  }

  if ( stage1)
  {
  }
  if ( stage2)
  {
    if ( x!= 800)
    {
      x+=10;
    }
  } 

  if ( stage3)
  {
    if ( x != 1600)
    {
      x+=10;
    }
    if ( key == ENTER)
    {

      if ( int(Answer) == (myMoney - price) )
      {
        image(OK, width/2-300, height/2-300,600,600);
      }
      else
      {
        image(NO, width/2-300, height/2-300,600,600);
      }
    }
  }
  translate(width - x, 0);
  pushMatrix();
  firstStage();
  imageInit();
  secondStage();
  popMatrix();
}

void mouseClicked()
{
  if ( stage1)
  {
    stage1 = false;
    stage2 = true;
    stage3 = false;
  }


  if ( stage2)
  {
    if ( x == 800)
    {
      if ( mouseX >= 50 && mouseX <= 450)
      {
        if ( mouseY >= 250 && mouseY <= 350)
        {
          println("Lunch");
          nSelect = 1;
          price = 15000;
        }

        if ( mouseY >= 400 && mouseY <= 500)
        {
          println("Regular");
          nSelect = 2;
          price = 25000;
        }

        if ( mouseY >= 550 && mouseY <= 650)
        {
          println("Large");
          nSelect = 3;
          price = 35000;
        }
      }

      if ( mouseX > width -200 && mouseY <100)
      {

        nSelect = 0;
        stage1 = false;
        stage2 = false;
        stage3 = true;
      }
    }
  }
}

void imageInit()
{
  image(Menu, width/2 - 100, 100, 200, 100);
  image(Lunch, 150, 250, 300, 100);
  image(Regular, 150, 400, 300, 100);
  image(Large, 150, 550, 300, 100);



  image(SEL1, 50, 250, 100, 100);
  image(SEL2, 50, 400, 100, 100);
  image(SEL3, 50, 550, 100, 100);

  image(Next, width -200, 0 ,190,100);
//  rect( width - 200, 0, 190, 100);
}

void firstStage()
{
  image(problem1, width/2 - (400 + width), height/2-300, 800, 500);
}

void secondStage()
{
  PFont font;
  font = loadFont("NanumGothicBold-48.vlw");
  textFont(font);

  String s = ""+myMoney + "  -  " + price + "  =  ? ";

  text(s, width+200, height/2);


  text("Enter the Answer", width + 200, height/2 +100);

  text(Answer, width + 200, height/2 + 200);


  //  rect( width + width/2, height/2, 300, 300);
}


void keyPressed()
{
  if (stage3)
  {
    switch(key)
    {
    case '1' :
      {
        Answer += 1;
        break;
      }
    case '2' :
      {
        Answer += 2;

        break;
      }
    case '3' :
      {
        Answer += 3;
        break;
      }
    case '4':
      {
        Answer += 4;
        break;
      }
    case '5' :
      {
        Answer += 5;
        break;
      }
    case '6' :
      {
        Answer += 6;
        break;
      }

    case '7' :
      {
        Answer += 7;
        break;
      }

    case '8' :
      {
        Answer += 8;
        break;
      }

    case '9' :
      {      
        Answer += 9;
        break;
      }

    case '0' :
      {      
        Answer += 0;
        break;
      }
//      case ENTER:
//      {
//
//      }
    case BACKSPACE :
      {
        Answer = "";
      }
    }
  }
}


