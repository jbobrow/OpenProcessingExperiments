
int grille = 25;
int l = 30;

byte difficulty = 1;
int respawn;

int score = 0;

boolean gameOver = false;

int xApple, yApple;
int appleCol = 150;
int appleColEvol = 5;

ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer> y = new ArrayList<Integer>();

PFont font;

void setup()
{
  size(grille*l+(grille*l)/7, grille*l+(grille*l)/6);
  background(0);
  smooth();

  x.add(15);
  y.add(15);

  xApple = int(random(0, grille));
  yApple = int(random(0, grille));

  frameRate(15);

  font = loadFont("Prism-48.vlw");
  textFont(font);
}

void draw()
{
  background(0);  

  if (!gameOver)
  {
    fill(appleCol);
    
    appleCol+=appleColEvol;
    
    if(appleCol==255)
    {
      appleColEvol = -appleColEvol;
    }
    else if(appleCol<150)
    {
      appleColEvol = -appleColEvol;
    }
    rect(xApple*l, yApple*l, l, l); 

    for (int i=1; i<x.size (); i++)
    {
      if (x.get(0) == x.get(i) && y.get(0) == y.get(i))
      {
        gameOver = true;
      }
    }

    if (x.get(0)>grille-1 || x.get(0)<0)
    {
      respawn = (x.get(0)>grille-1) ? 0 : (x.get(0)<0) ? grille : x.get(0);

      x.set(0, respawn);
    } else if (y.get(0)>grille-1 || y.get(0)<0)
    {
      respawn = (y.get(0)>grille-1) ? 0 : (y.get(0)<0) ? grille : y.get(0);

      y.set(0, respawn);
    }

    if (keyCode == RIGHT)
    {
      x.add(0, x.get(0)+1);
      y.add(0, y.get(0));
    } else if (keyCode == LEFT)
    {
      x.add(0, x.get(0)-1);
      y.add(0, y.get(0));
    } else if (keyCode == DOWN)
    {
      y.add(0, y.get(0)+1);
      x.add(0, x.get(0));
    } else if (keyCode == UP)
    {
      y.add(0, y.get(0)-1);
      x.add(0, x.get(0));
    }

    if (x.get(0) != xApple || y.get(0) != yApple)
    {
      if ((keyCode == RIGHT) || (keyCode == LEFT) || (keyCode == DOWN) || (keyCode == UP))
      {
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
    } else
    {
      score++;
      xApple = int(random(0, grille));
      yApple = int(random(0, grille));
    }


    for (int i=1; i<grille+1; i++)
    { 
      stroke(255);
      line(i*l, 0, i*l, grille*l);
      line(0, i*l, grille*l, i*l);
    }

    for (int j=0; j<x.size (); j++)
    {
      colorMode(HSB);   
      fill(j*5,225,225);
      rect(x.get(j)*l, y.get(j)*l, l, l);
      colorMode(RGB);
    }

    fill(0);
    noStroke();  
    rect(0, grille*l+1, width, 100);
    rect(grille*l+1, 0, 100, height);

    fill(255);
    textSize(60);
    textAlign(LEFT, CENTER);
    text(score, grille*l+40, 50);

    textSize(70);
    text("S  N  A  K  E", 150, height-50);
    
    textAlign(CENTER, CENTER);
    textSize(40);
    if(difficulty == 1)
    {
      text("*", width-40,height-40);
      frameRate(15);
    }
    else if(difficulty == 2)
    {
      text("**", width-40,height-40);
      frameRate(18);
    }
    else if(difficulty == 3)
    {
      text("***", width-40,height-40);
      frameRate(21);
    }
  } else
  {
    background(0);
    stroke(255);
    textSize(60);
    textAlign(CENTER, CENTER);

    text("GAME OVER", width/2, height/2);

    textSize(30);
    text("Press any key...", width/2, height/2+50);
    if (keyPressed)
    {
      x.clear();
      y.clear();

      x.add(15);
      y.add(15);

      xApple = int(random(0, grille));
      yApple = int(random(0, grille));

      score = 0;

      gameOver = false;
    }
  }
}

void keyPressed()
{
  if (keyCode == 'R')
  {
    x.clear();
    y.clear();

    x.add(15);
    y.add(15);

    xApple = int(random(0, grille));
    yApple = int(random(0, grille));

    score = 0;

    gameOver = false;
  }
}

void mouseWheel(MouseEvent event)
{
  float mouseVal = event.getCount();
  
  if(mouseVal<0 && difficulty<3)
  {
    difficulty++;
  }
  else if(mouseVal>0 && difficulty>1)
  {
    difficulty--;
  }
}



