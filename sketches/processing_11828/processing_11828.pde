
int dim = 15 * 15;
int n = floor(sqrt(dim));
int x, y;
int wStage = 550;
int w = wStage / n;
int density = int(dim * .2);
int id = 0;
boolean firstClick = true;
PFont font;

Case[][] cases;

void setup()
{
  id = 0;
  firstClick = true;
  noStroke();
  size(550,550);
  font = loadFont("CordiaUPC-48.vlw"); 
  cases = new Case[n][n];

  for(int y = 0; y < n; y++)
  {
    for(int x = 0; x < n; x++)
    {

      Case cas = new Case(x*w, y*w, w, id);
      cases[y][x] = cas;

      id+=1;
    }
  }
}

void draw() {
}

void keyPressed()
{
  background(127);
  loop();
  cases = null;
  setup();
}

void mousePressed()
{ 
  if(density == casesLeft())
  {
    win();
  }

  if(mouseButton == LEFT)
  {
    for(int y = 0; y < n; y++)
    {
      for(int x = 0; x < n; x++)
      {
        if((mouseX >= x*w + 3) && (mouseX <= x*w + w - 3) &&
          (mouseY >= y*w + 3) && (mouseY <= y*w + w + - 3))
        {
          if(firstClick)
          {
            for(int i = 0; i < density; i++)
            {
              int rdx = floor(random(n));
              int rdy = floor(random(n));
              if(cases[rdy][rdx] != cases[y][x])
                cases[rdy][rdx].mine();
              else i--;
            }
            firstClick = false;
          }
          if(!cases[y][x].flagged)cases[y][x].minesAround();
        }
      }
    }
  }
  else if(mouseButton == RIGHT)
  {
    for(int y = 0; y < n; y++)
    {
      for(int x = 0; x < n; x++)
      {
        if((mouseX >= x*w + 3) && (mouseX <= x*w + w - 3) &&
          (mouseY >= y*w + 3) && (mouseY <= y*w + w + - 3))
        {
          if(!firstClick && !cases[y][x].clicked)
          {
            cases[y][x].switchFlag();
          }
        }
      }
    }
  }
}

void win()
{
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("A WINNER IS YOU", width/2, 150);
  noLoop();
}

int casesLeft()
{
  int total = 0;

  for(int i = 0; i < n; i++)
  {
    for(int j = 0; j < n; j++)
    {
      if(!cases[i][j].clicked) total++;
    }
  }
  return total;
}

class Case
{
  int w;
  int x,y;
  float c = 0;
  int mine = 0;
  int id;
  boolean clicked, flagged;

  Case(int x, int y, int w, int id)
  {
    this.id = id;
    this.w = w;
    this.x = x;
    this.y = y;
    c = norm(200 - (id*.75), 0.0, 255) * 255;
    fill(c);
    strokeWeight(2);
    stroke(c*1.25);
    rect(x, y, w, w);
  }

  void mine()
  {
    mine = 1;
  }

  void switchFlag()
  {
    if(!flagged)
    {
      flagged = true;
      stroke(c*1.25);
      fill(255, c - 20, 0);
      rect(x, y, w, w);
    }
    else
    {
      flagged = false;
      stroke(c*1.25);
      fill(c);
      rect(x, y, w, w);
    }
  }

  void minesAround()
  {
    int total = 0;

    for(int i = y/w - 1; i <= y/w + 1; i++)
    {
      for(int j = x/w - 1; j <= x/w + 1; j++)
      {
        if(i >= 0 && j >= 0 && i < n && j < n && !(i==x && j==y))
        {
          if(cases[i][j].mine == 1)
          {
            total++;
          }
        }
      }
    }

    if(!clicked)
    {
      float r = c + 30;
      float g = c + 30;
      float b = c + 30;
      stroke(r - 50,g - 50,b - 50, 45);
      fill(r, g, b);
      rect(x, y, w, w);

      clicked = true;

      if(mine == 1)
      {
        fill(255);
        rect(x + w/4, y +  w/4, w/2, w/2);
        textSize(50);
        float tx = constrain(x+w/2, 100, width - 100);
        float ty = constrain(y, w, height - 50);
        text("You lose", tx, y);
        noLoop();
      }

      else if(total != 0)
      {
        fill((255/8)*total,0,0);
        textAlign(CENTER);
        textSize(20);
        text(total, x + w / 2 + 1, y + w/2 + 8);
      }

      else
      {
        for(int i = y/w - 1; i <= y/w + 1; i++)
        {
          for(int j = x/w - 1; j <= x/w + 1; j++)
          {
            if(i >= 0 && j >= 0 && i < n && j < n && i!=x && j!=y)
            {
              cases[i][j].minesAround();
            }
          }
        }
      }
    }
  }
}


