
int a=RIGHT;
int b=LEFT;
int x=15;
int y=250;
int c=485;
int d=250;
int e=1;
int l=0;
int m=0;
int n=0;
int compc=485;
int compd=250;
int compb=LEFT;
int compx=15;
int compy=250;
int compa=RIGHT;
int z=0;
float s=60;
int unlock=0;
float k=.1;
int abc=1;

void setup()
{

  size(500, 500);
  background(0);
  if (z==0)
  {
    draw();
  }
}
void draw ()
{
  frameRate(s*500);
  //  s=s+k;
  //  if(s>120)
  //  {
  //    k=0;
  //  }
  if (z==0)
  {
    textSize(50);
    text("TRON", 180, 175);
    textSize(25);
    fill(l, m, n);
    text("For 2 Players Hit 2", 150, 275);
    text("To Play the Computer Hit 3", 107, 325);
    text("For Single Player Training Hit 1", 85, 225);
    text("For Craziness Hit 1 Then 4" ,100,375);
  }
  stroke(255, 0, 0);
  l=int(random(255));
  m=int(random(255));
  n=int(random(255));
  fill(l, m, n);
  line(0, 0, 500, 0);
  line(0, 0, 0, 500);
  line(499, 0, 499, 499);
  line(0, 499, 4990, 499);

  if (get(x, y) != color(0, 0, 0))
  {
    //    GameOverForOrange();
    a=5;
  }
  if (get(c, d) != color(0, 0, 0))
  {
    //    GameOverForGreen();
    b=5;
  }
  if (z==2)
  {
    playerVsPlayer();
  }
   if (z==3)
  {
    computerVsPlayer();
  }
 if (z==1)
  {
    singlePlayer();
  }
 if (z==5)
  {
    ComputerVsComputer();
  }

}
void singlePlayer()
{
  while (e<2)

  {
    e++;
    background(0);
  }
  if (abc==1)
  {
    int a=DOWN;
  }

  stroke(255);
  line(50, 325, 50, 475);
  line(25, 25, 25, 175);
  line(50, 200, 50, 300);
  line(50, 325, 100, 325);
  line(50, 300, 100, 300);
  line(100, 325, 100, 425);
  line(125, 225, 125, 425);
  line(100, 200, 100, 300);
  line(125, 425, 300, 425);
  line(100, 450, 325, 450);
  line(100, 425, 75, 425);
  line(75, 425, 75, 475);
  line(75, 475, 475, 475);
  line(475, 475, 475, 25);
  line(325, 325, 325, 450);
  line(300, 425, 300, 375);
  line(300, 375, 125, 375);
  line(300, 350, 125, 350);
  line(150, 375, 150, 400);
  line(150, 400, 275, 400);
  line(125, 325, 300, 325);
  line(0, 175, 150, 175);
  line(0, 200, 450, 200);
  line(125, 225, 150, 225);
  line(475, 25, 25, 25);
  line(350, 450, 350, 300);
  line(375, 450, 375, 275);
  line(400, 450, 400, 250);
  line(425, 450, 425, 225);
  line(450, 450, 450, 200);
  line(350, 300, 150, 300);
  line(425, 225, 175, 225);
  line(400, 250, 150, 250);
  line(375, 275, 175, 275);
  line(150, 300, 150, 250);
  line(150, 200, 150, 75);
  line(125, 175, 125, 125);
  line(125, 125, 75, 125);
  line(125, 75, 125, 25);
  line(150, 100, 50, 100);
  line(100, 100, 100, 50);
  line(75, 75, 75, 25);
  line(50, 150, 50, 50);
  line(50, 150, 100, 150);
  line(150, 50, 150, 100);
  line(150, 50, 175, 50);
  line(175, 50, 175, 75);
  line(200, 25, 200, 100);
  line(225, 100, 175, 100);
  line(150, 125, 200, 125);
  line(225, 100, 225, 150);
  line(225, 150, 175, 150);
  line(150, 175, 250, 175);
  line(250, 175, 250, 50);
  line(275, 125, 475, 125);
  line(475, 175, 425, 175);
  line(400, 200, 400, 150);
  line(400, 150, 450, 150);
  line(375, 125, 375, 175);
  line(350, 200, 350, 150);
  line(325, 125, 325, 175);
  line(300, 200, 300, 150);
  line(275, 125, 275, 175);
  line(250, 100, 300, 100);
  line(325, 125, 325, 75);
  line(325, 75, 275, 75);
  line(250, 50, 350, 50);
  line(350, 50, 350, 100);
  line(375, 125, 375, 75);
  line(400, 50, 400, 100);
  line(450, 50, 350, 50);
  line(425, 125, 425, 75);
  line(450, 50, 450, 100);
  line(225, 50, 250, 50);
  line(200, 75, 225, 75);





  stroke(0);
  line(125, 325, 125, 300);
  line(150, 375, 175, 375);
  line(150, 350, 175, 350);
  line(75, 300, 45, 300);
  line(75, 325, 45, 325);
  line(125, 350, 125, 375);
  line(100, 350, 100, 375);
  line(475, 225, 475, 275);

  line(125, 175, 150, 175);



  stroke(247, 122, 0);
  point (x, y);

  if (a==RIGHT)
  {
    x++;
  }
  if (a==LEFT)
  {
    x--;
  }
  if (a==UP)
  {
    y--;
  }
  if (a==DOWN)
  {
    y++;
  }
}
void playerVsPlayer()
{
  while (e<2)
  {
    e++;
    background(0);
  }
  stroke(247, 122, 0);
  point (x, y);
  stroke(7, 240, 63);
  point (c, d);
  if (a==RIGHT)
  {
    x++;
  }
  if (a==LEFT)
  {
    x--;
  }
  if (a==UP)
  {
    y--;
  }
  if (a==DOWN)
  {
    y++;
  }
  if (b==RIGHT)
  {
    c++;
  }
  if (b==LEFT)
  {
    c--;
  }
  if (b==UP)
  {
    d--;
  }
  if (b==DOWN)
  {
    d++;
  }
}
void computerVsPlayer()
{
  while (e<2)
  {
    e++;
    background(0);
  }
  stroke(247, 122, 0);
  point (x, y);
  //  }
  if (a==RIGHT)
  {
    x++;
  }
  if (a==LEFT)
  {
    x--;
  }
  if (a==UP)
  {
    y--;
  }
  if (a==DOWN)
  {
    y++;
  }
  stroke(7, 240, 63);
  point (compc, compd);
  if (compb==RIGHT)
  {
    compc++;
    if (get(compc+5, compd) !=color(0, 0, 0))
    {
      if (get(compc, compd-5) !=color(0, 0, 0))
      {
        compb=DOWN;
      }
      else if (get(compc, compd+5) !=color(0, 0, 0))
      {
        compb=UP;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=DOWN;
        }
        else
        {
          compb=UP;
        }
      }
    }
  }

  if (compb==LEFT)
  {
    compc--;
    if (get(compc-5, compd) !=color(0, 0, 0))
    {
      if (get(compc, compd+5) !=color(0, 0, 0))
      {
        compb=UP;
      }
      else if (get(compc, compd-5) !=color(0, 0, 0))
      {
        compb=DOWN;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=DOWN;
        }
        else
        {
          compb=UP;
        }
      }
    }
  }
  if (compb==UP)
  {
    compd--;
    if (get(compc, compd-5) !=color(0, 0, 0))
    {
      if (get(compc-5, compd) !=color(0, 0, 0))
      {
        compb=RIGHT;
      }
      else if (get(compc+5, compd-5) !=color(0, 0, 0))
      {
        compb=LEFT;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=RIGHT;
        }
        else
        {
          compb=LEFT;
        }
      }
    }
  }
  if (compb==DOWN)
  {
    compd++;
    if (get(compc, compd+5) !=color(0, 0, 0))
    {
      if (get(compc+5, compd) !=color(0, 0, 0))
      { 
        compb=LEFT;
      }
      else if (get(compc-5, compd) !=color(0, 0, 0))
      {
        compb=RIGHT;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=RIGHT;
        }
        else
        {
          compb=LEFT;
        }
      }
    }
  }
}
void ComputerVsComputer()
{
   while (e<2)
  {
    e++;
    background(0);
  }
  stroke(7, 240, 63);
  point (compc, compd);
  if (compb==RIGHT)
  {
    compc++;
    if (get(compc+5, compd) !=color(0, 0, 0))
    {
      if (get(compc, compd-5) !=color(0, 0, 0))
      {
        compb=DOWN;
      }
      else if (get(compc, compd+5) !=color(0, 0, 0))
      {
        compb=UP;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=DOWN;
        }
        else
        {
          compb=UP;
        }
      }
    }
  }

  if (compb==LEFT)
  {
    compc--;
    if (get(compc-5, compd) !=color(0, 0, 0))
    {
      if (get(compc, compd+5) !=color(0, 0, 0))
      {
        compb=UP;
      }
      else if (get(compc, compd-5) !=color(0, 0, 0))
      {
        compb=DOWN;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=DOWN;
        }
        else
        {
          compb=UP;
        }
      }
    }
  }
  if (compb==UP)
  {
    compd--;
    if (get(compc, compd-5) !=color(0, 0, 0))
    {
      if (get(compc-5, compd) !=color(0, 0, 0))
      {
        compb=RIGHT;
      }
      else if (get(compc+5, compd-5) !=color(0, 0, 0))
      {
        compb=LEFT;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=RIGHT;
        }
        else
        {
          compb=LEFT;
        }
      }
    }
  }
  if (compb==DOWN)
  {
    compd++;
    if (get(compc, compd+5) !=color(0, 0, 0))
    {
      if (get(compc+5, compd) !=color(0, 0, 0))
      { 
        compb=LEFT;
      }
      else if (get(compc-5, compd) !=color(0, 0, 0))
      {
        compb=RIGHT;
      }
      else
      {
        if (random(1)<.5)
        {
          compb=RIGHT;
        }
        else
        {
          compb=LEFT;
        }
      }
    }
  }
  
   stroke(247, 122, 0);
  point (compx, compy);
  if (compa==RIGHT)
  {
    compx++;
    if (get(compx+5, compy) !=color(0, 0, 0))
    {
      if (get(compx, compy-5) !=color(0, 0, 0))
      {
        compa=DOWN;
      }
      else if (get(compx, compy+5) !=color(0, 0, 0))
      {
        compa=UP;
      }
      else
      {
        if (random(1)<.5)
        {
          compa=DOWN;
        }
        else
        {
          compa=UP;
        }
      }
    }
  }

  if (compa==LEFT)
  {
    compx--;
    if (get(compx-5, compy) !=color(0, 0, 0))
    {
      if (get(compx, compy+5) !=color(0, 0, 0))
      {
        compa=UP;
      }
      else if (get(compx, compy-5) !=color(0, 0, 0))
      {
        compa=DOWN;
      }
      else
      {
        if (random(1)<.5)
        {
          compa=DOWN;
        }
        else
        {
          compa=UP;
        }
      }
    }
  }
  if (compa==UP)
  {
    compy--;
    if (get(compx, compy-5) !=color(0, 0, 0))
    {
      if (get(compx-5, compy) !=color(0, 0, 0))
      {
        compa=RIGHT;
      }
      else if (get(compx+5, compy-5) !=color(0, 0, 0))
      {
        compa=LEFT;
      }
      else
      {
        if (random(1)<.5)
        {
          compa=RIGHT;
        }
        else
        {
          compa=LEFT;
        }
      }
    }
  }
  if (compa==DOWN)
  {
    compy++;
    if (get(compx, compy+5) !=color(0, 0, 0))
    {
      if (get(compx+5, compy) !=color(0, 0, 0))
      { 
        compa=LEFT;
      }
      else if (get(compx-5, compy) !=color(0, 0, 0))
      {
        compa=RIGHT;
      }
      else
      {
        if (random(1)<.5)
        {
          compa=RIGHT;
        }
        else
        {
          compa=LEFT;
        }
      }
    }
  }
}

//void GameOverForGreen()
//{
//  
//  fill(255);
//  b=5;
//  textSize(30);
//   text( "GAMEOVER! Orange Loses ", 1000, 325);
//  text( "GAMEOVER! Green Loses!", 70, 175);
//}
//void GameOverForOrange()
//{
//  fill(255);
//  a=5;
//  textSize(30);
// text( "GAMEOVER! Orange Loses ", 1000, 325);
// text( "GAMEOVER! Orange Loses ", 70, 325);
//}


void keyPressed() 
{

  if (key == 'w')
  {
    a=UP;
    abc=0;
  }
  if (key == 'a')
  {
    a=LEFT;
    abc=0;
  }
  if (key == 's')
  {
    a=DOWN;
    abc=0;
  }
  if (key == 'd')
  {
    a=RIGHT;
    abc=0;
  }
  if (keyCode == UP)
  {
    b=UP;
  }
  if (keyCode == LEFT)
  {
    b=LEFT;
  }
  if (keyCode == DOWN)
  {
    b=DOWN;
  }
  if (keyCode == RIGHT)
  {
    b=RIGHT;
  }


  if (key== '1')
  {
    z=1;
  }
  if (key =='2')
  {
    z=2;
  }
  if (key =='3')
  {
    z=3;
  }
  if (key=='4')
  {
    z=5;
  }
  if (key==' ')
  {
    s=300;
  }
}
//void mouseClicked()
//{
//background(0);
//int a=UP;
//int b=UP;
//int x=240;
//int y=250;
//int c=250;
//int d=250;
//int e=1;
//int l=0;
//int m=0;
//int n=0;
//int compc=250;
//int compd=250;
//int compb=UP;
//int z=0;
//
//}

