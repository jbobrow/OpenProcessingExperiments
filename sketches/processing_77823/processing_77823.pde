
//Wayland L. ,  Tron , CP1 16-17
int x = 240;
int y = 260;
int  x2 = 260;
int  y2 = 260;
int compx = 240;
int compy = 250;
int comp2x = 260;
int comp2y=250;
int dir = LEFT;
int compdir = UP;
int comp2dir = UP;
int dir2 = RIGHT;
int cs = 0;
int hs = 0;


boolean gameover = false;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(100);
  
}

void draw()
{
  if (gameover == true)
  {


    if ( keyPressed ==true && key == ' ')
    {
      background(0);
      x = 240;
      y = 260;
      compx = 240;
      compy=250;
      comp2x = 260;
      comp2y=250;
      dir = LEFT;
      compdir = UP;
      comp2dir = UP;
      x2 = 260;
      y2 = 260;
      dir2 = RIGHT;
      gameover = false;
    }
  }

  else
  {
    human();
    human2();
    if (gameover == false)
    {
      computer();
      computer2();
    }
  }
}
void human()

{
  if (get(x, y) != color(0, 0, 0))
  {
    gameover = true;
    cs = cs + 1;

    textSize(32);
    textAlign(CENTER);
    text("game over \nhuman loses", 250, 250);
    textSize(16);
    text("\n Computer's Score: "+ cs +"            Human's Score: "+ hs, 250, 400);
  }
  stroke(255, 99, 8);
  point(x, y);

  if (dir == LEFT)
  {
    x--;
  }
  else if ( dir == RIGHT)
  {
    x++;
  }
  
  else if (dir == UP)
  {
    y--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
}


void keyPressed()
{

  if (key == 'a')
  {
    dir = LEFT;
  }
  else if (key =='d')
  {
    dir = RIGHT;
  }
  else if (key =='w')
  {
    dir = UP;
  }
  else if (key =='s')
  {
    dir = DOWN;
  }
  if (key == '4')
  {
    dir2= LEFT;
  }
  else if (key =='6')
  {
    dir2= RIGHT;
  }
  else if (key =='8')
  {
    dir2= UP;
  }
  else if (key =='5')
  {
    dir2= DOWN;
  }
}



//COMPUTER

void computer()
{
  if (get(compx, compy) != color(0, 0, 0))
  {
    gameover = true;
    hs=hs +1;

    textSize(32);
    textAlign(CENTER);
    text("game over \nhuman loses", 250, 250);
    textSize(16);
    text("\n Computer's Score: "+ cs +"            Human's Score: "+ hs, 250, 400);
  }
  stroke(0, 255, 0);
  point(compx, compy);


   if (compdir == UP)
  {
    compy--;
    if (get(compx, compy-1) != color(0, 0, 0))
    {
      compdir = LEFT;
    }
  }
  else if (compdir == DOWN)
  {
    compy++;
    if (get(compx, compy+1) != color(0, 0, 0))
    {
      compdir = RIGHT;
    }
  }
  else if (compdir == LEFT)
  {
    compx--;
    if (get(compx-1, compy) != color(0, 0, 0))
    {
      compdir = DOWN;
    }
  }

  else if ( compdir == RIGHT)
  {
    compx++;
    if (get(compx+1, compy) != color(0, 0, 0))
    {
      compdir = UP;
    }
  }
} 
//COMPUTER 2
void computer2()
{
  if (get(comp2x, comp2y) != color(0, 0, 0))
  {
    gameover = true;
    hs = hs + 1;

    textSize(32);
    textAlign(CENTER);
    text("game over \nhuman loses", 250, 250);
    textSize(16);
    text("\n Computer's Score: "+ cs +"            Human's Score: "+ hs, 250, 400);
  }
  stroke(237, 255, 3);
  point(comp2x, comp2y);


  if (comp2dir == DOWN)
  {
    comp2y++;
    if (get(comp2x, comp2y+1) != color(0, 0, 0))
    {
      comp2dir = LEFT;
    }
  }
  else if (comp2dir == LEFT)
  {
    comp2x--;
    if (get(comp2x-1, comp2y) != color(0, 0, 0))
    {
      comp2dir = UP;
    }
  }
  else if (comp2dir == UP)
  {
    comp2y--;
    if (get(comp2x, comp2y-1) != color(0, 0, 0))
    {
      comp2dir = RIGHT;
    }
  }
  else if ( comp2dir == RIGHT)
  {
    comp2x++;
    if (get(comp2x+1, comp2y) != color(0, 0, 0))
    {
      comp2dir = DOWN;
    }
  }
} 


void human2()

{
  if (get(x2, y2) != color(0, 0, 0))
  {
    gameover = true;
    cs = cs + 1;

    textSize(32);
    textAlign(CENTER);
    text("game over \nhuman loses", 250, 250);
    textSize(16);
    text("\n Computer's Score: "+ cs +"            Human's Score: "+ hs, 250, 400);
  }
  stroke(255, 0, 0);
  point(x2, y2);

  if ( dir2 == RIGHT)
  {
    x2++;
  }
  else if (dir2 == LEFT)
  {
    x2--;
  }
  else if (dir2 == UP)
  {
    y2--;
  }
  else if (dir2 == DOWN)
  {
    y2++;
  }
}
