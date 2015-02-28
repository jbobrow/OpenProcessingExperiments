
int x=192;
int y=300;
int direction = int(random(37,41));
int cpux=396;
int cpuy=300;
int cpuDirection = int(random(37,41));
boolean gameOver = false;
boolean cpuGameOver = false;
void setup()
{
  size(600, 600);
  background(0);
  frameRate(20);
}
void draw()
{
  pushStyle();

  cursor(ARROW);
  pushStyle();
  fill(255);
  stroke(255);
  rect(0, 0, width, 5);
  rect(0, 594, width, 6);
  popStyle();
  if (gameOver == true)
  {
    //DEFEAT box
    pushStyle();
    strokeWeight(4);
    stroke(198, 16, 16);
    fill(70, 0, 0, 20);
    rect(150, 145, 300, 75, 10);
    popStyle();
    //DEFEAT
    pushStyle();
    fill(198, 16, 16);
    textSize(50);
    textAlign(CENTER);
    text("DEFEAT", width/2, 200);
    popStyle();
    //Computer chat
    pushStyle();
    noStroke();
    fill(70, 70, 70, 20);
    rect(0, 470, width, 600-470);
    popStyle();
    pushStyle();
    textSize(25);
    fill(255, 0, 0);
    text("Computer[All]:", 10, 500);
    fill(255);
    text("I don't suppose you ever stopped\nlong enough to reflect on your\nown shortcomings, did you?", 188, 500);
    popStyle();
    //CONTINUE button
    pushStyle();
    textSize(20);
    strokeWeight(2);
    stroke(255, 239, 93);
    fill(85, 0, 0, 20);
    rect(225, 250, 150, 35, 10);
    //CONTINUE
    fill(255, 239, 93);
    textAlign(CENTER);
    text("CONTINUE", width/2, 276);
    popStyle();
  }
  if (cpuGameOver == true)
  {
    //VICTORY box
    pushStyle();
    strokeWeight(4);
    stroke(255, 239, 93);
    fill(32, 99, 157, 20);
    rect(150, 145, 300, 75, 10);
    popStyle();
    //VICTORY
    pushStyle();
    fill(255, 239, 93);
    textSize(50);
    textAlign(CENTER);
    text("VICTORY", width/2, 200);
    popStyle();
    //CONTINUE button
    pushStyle();
    noStroke();
    fill(70, 70, 70, 20);
    rect(0, 470, width, 600-470);
    popStyle();
    pushStyle();
    textSize(20);
    strokeWeight(2);
    stroke(255, 239, 93);
    fill(32, 99, 157, 20);
    rect(225, 250, 150, 35, 10);
    //Computer chat
    pushStyle();
    textSize(25);
    fill(255, 0, 0);
    text("Computer[All]:", 10, 500);
    fill(255);
    text("I let you win so you would\nbelieve you could actually beat\na computer. How does it feel?", 188, 500);
    popStyle();
    //CONTINUE
    fill(255, 239, 93);
    textAlign(CENTER);
    text("CONTINUE", width/2, 276);
    popStyle();
  }
  //Restart
  if (gameOver == true || cpuGameOver == true)
  {
    if (mouseX > 225 && mouseX < 375 && mouseY > 250 && mouseY < 285)
    {
      cursor(HAND);
    }
    else
    {
      cursor(ARROW);
    }
    if (mousePressed == true && mouseX > 225 && mouseX < 375 && mouseY > 250 && mouseY < 285)
    {
      background(0);
      gameOver = false;
      x=192;
      y=300;
      direction = int(random(37,41));
      cpux=396;
      cpuy=300;
      cpuDirection = int(random(37,41));
    }
  }
  if (cpuGameOver == true && mousePressed == true && mouseX > 225 && mouseX < 375 && mouseY > 250 && mouseY < 285)
  {
    background(0);
    cpuGameOver = false;
    x=192;
    y=300;
    direction = int(random(37,41));
    cpux=396;
    cpuy=300;
    cpuDirection = int(random(37,41));
  }
  if (get(x, y) != color(0) && get(cpux, cpuy) == color(0))
  {
    gameOver = true;
  } 
  if (get(cpux, cpuy) != color(0) && get(x, y) == color(0))
  {
    cpuGameOver = true;
  } 
  else
  {
    if (gameOver == false && cpuGameOver == false)
    {
      human();
      cpu();
    }
  }
}
void cpu()
{
  stroke(245, 169, 54);
  fill(245, 167, 54);
  rect(cpux, cpuy, 5, 5);
  if (cpuDirection==LEFT)
  {
    cpux=cpux-6;
    if (get(cpux-6, cpuy) != color(0))
    {
      if (get(cpux, cpuy+6) == color(0) && get(cpux, cpuy-6) == color(0))
      {
        int cpuRandom = int(random(2));
        if (cpuRandom == 0)
        {
          cpuDirection=DOWN;
        }
        else
        {
          cpuDirection=UP;
        }
      }
      else
      {
        if (get(cpux, cpuy+6) != color(0))
        {
          cpuDirection=UP;
        }
        else if (get(cpux, cpuy-6) != color(0))
        {
          cpuDirection=DOWN;
        }
      }
    }
  }
  else if (cpuDirection==RIGHT)
  { 
    cpux=cpux+6;
    if (get(cpux+6, cpuy) != color(0))
    {
      if (get(cpux, cpuy+6) == color(0) && get(cpux, cpuy-6) == color(0))
      {
        int cpuRandom2 = int(random(2));
        if (cpuRandom2 == 0)
        {
          cpuDirection = UP;
        }
        else
        {
          cpuDirection = DOWN;
        }
      }
      else
      {
        if (get(cpux, cpuy+6) != color(0))
        {
          cpuDirection = UP;
        }
        else if (get(cpux, cpuy-6) != color(0))
        {
          cpuDirection = DOWN;
        }
      }
    }
  }
  else if (cpuDirection==UP)
  {
    cpuy=cpuy-6;
    if (get(cpux, cpuy-6) != color(0))
    {
      if (get(cpux-6, cpuy) == color(0) && get(cpux+6, cpuy) == color(0))
      {
        int cpuRandom3 = int(random(2));
        if (cpuRandom3 == 0)
        {
          cpuDirection=RIGHT;
        }
        else
        {
          cpuDirection=LEFT;
        }
      }
      else
      {
        if (get(cpux-6, cpuy) != color(0))
        {
          cpuDirection=RIGHT;
        }
        else if (get(cpux+6, cpuy) != color(0))
        {
          cpuDirection=LEFT;
        }
      }
    }
  }
  else if (cpuDirection==DOWN)
  { 
    cpuy=cpuy+6;
    if (get(cpux, cpuy+6) != color(0))
    {
      if (get(cpux-6, cpuy) == color(0) && get(cpux+6, cpuy) == color(0))
      {
        int cpuRandom4 = int(random(2));
        if (cpuRandom4 == 0)
        {
          cpuDirection=RIGHT;
        }
        else
        {
          cpuDirection=LEFT;
        }
      }
      else
      {
        if (get(cpux-6, cpuy) != color(0))
        {
          cpuDirection=RIGHT;
        }
        else if (get(cpux+6, cpuy) != color(0))
        {
          cpuDirection=LEFT;
        }
      }
    }
  }
}
void human()
{
  stroke(24, 237, 232);
  fill(24, 237, 232);
  rect(x, y, 5, 5);
  if (direction==RIGHT)
  {
    x=x+6;
  }
  if (direction==LEFT)
  {
    x=x-6;
  }
  if (direction==UP)
  {
    y=y-6;
  }
  if (direction==DOWN)
  {
    y=y+6;
  }
}
void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    direction=LEFT;
  }
  else if (key == 'w' || key == 'W')
  {
    direction=UP;
  }
  else if (key == 's' || key == 'S')
  {
    direction=DOWN;
  }
  else if (key == 'd' || key == 'D')
  {
    direction=RIGHT;
  }
}
