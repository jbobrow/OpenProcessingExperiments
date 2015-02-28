
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer p1, p2, p3;

int[][] b = new int[100][100];  //b stands for boxes
int mx;  //x coordinate of mouse
int my;  //y coordinate of mouse
int lv = 1;  //game level
int timer = 15;  //game time limit
int timeLast = 0;

PFont Verdana;
PImage lose;
PImage win;
PImage mouse;

void setup() 
{

  minim = new Minim(this);
  p1 = minim.loadFile("riddler_laugh.wav");
  p2 = minim.loadFile("glass_break.wav");
  p3 = minim.loadFile("criminals.wav");

  for (int x = 0; x < 10; x += 1) 
  {
    for (int y = 0; y < 10; y += 1) 
    {
      b[x][y] = 0;
    }
  }

  size(500, 500);

  timeLast = second();

  smooth();
  stroke(0);
  strokeWeight(4);

  lose = loadImage("images (3).jpg");
  win = loadImage("mr_freeze.jpg");
  mouse = loadImage("freeze.png");

  noCursor();
}

void draw() 
{

  if (timer > 0) 
  {
    game();
  }

  if (timer == 0) 
  {
    fill(255);
    Verdana = loadFont("Verdana-20.vlw");
    textFont(Verdana, 50);
    text("YOU'VE BEEN", width/2-170, height/2-100);
    text("DEFEATED BY", width/2-170, height/2-55);
    text("THE BATMAN!", width/2-170, height/2-10);
    image(lose, width/2-145, height/2);
    p1.play();
  }
}

void game()
{
  if (second() != timeLast)
  {
    timeLast = second();
    timer -= 1;
  }

  background(50);

  if (lv == 1) 
  {
    for (int x = 0; x < 2; x += 1) 
    {
      for (int y = 0; y < 2; y += 1) 
      {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) 
        {
          mx = floor(mouseX/250);
          my = floor(mouseY/500);
          p2.play();

          b[mx][my] = 1;
        }
        if (b[x][y] != 0) 
        {
          fill(#3CD4ED);
        }
        else 
        {
          fill(random(255), 0, random(255));
          lv = 1;
        }
        rect(x*250, y*500, 250, 500);
      }
      if (b[0][0] == 1 && b[1][0] == 1) 
      {
        lv = 2;
      }
    }
  }

  if (lv == 2) 
  {
    for (int x = 0; x < 10; x += 1) 
    {
      for (int y = 0; y < 10; y += 1) 
      {
        b[x][y] = 0;
      }
    }
    lv = 3;
  } 

  if (lv == 3) 
  {
    for (int xx = 0; xx < 4; xx += 1) 
    {
      for (int yy = 0; yy < 4; yy += 1) 
      {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) 
        {
          mx = floor(mouseX/250);
          my = floor(mouseY/250);
          p2.play();

          b[mx][my] = 2;
        }
        if (b[xx][yy] != 0 ) 
        {
          fill(#3CD4ED);
          lv = 4;
        }
        else 
        {
          fill(random(255), 0, random(255));
          lv = 3;
        }
        rect(xx*250, yy*250, 250, 250);
      }
      if (b[0][0] == 2 && b[1][0] == 2 && b[0][1] == 2 && b[1][1] == 2) 
      {
        lv = 4;
      }
    }
  }

  if (lv == 4) 
  {
    for (int x = 0; x < 10; x += 1) 
    {
      for (int y = 0; y < 10; y += 1) 
      {
        b[x][y] = 0;
      }
    }
    lv = 5;
  } 

  if (lv == 5) 
  {
    for (int x = 0; x < 8; x += 1) 
    {
      for (int y = 0; y < 8; y += 1) 
      {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) 
        {
          mx = floor(mouseX/125);
          my = floor(mouseY/125);
          p2.play();

          b[mx][my] = 3;
        }
        if (b[x][y] != 0 ) 
        {
          fill(#3CD4ED);
          lv = 6;
        }
        else 
        {
          fill(random(255), 0, random(255));
          lv = 5;
        }
        rect(x*125, y*125, 125, 125);
      }
      if (b[0][0] == 3 && b[1][0] == 3 && b[2][0] == 3 && b[3][0] == 3 
        && b[0][1] == 3 && b[1][1] == 3 && b[2][1] == 3 && b[3][1] == 3 
        && b[0][2] == 3 && b[1][2] == 3 && b[2][2] == 3 && b[3][2] == 3
        && b[0][3] == 3 && b[1][3] == 3 && b[2][3] == 3 && b[3][3] == 3) 
      {
        lv = 6;
      }
    }
  }

  if (lv == 6) 
  {
    for (int x = 0; x < 10; x += 1) 
    {
      for (int y = 0; y < 10; y += 1) 
      {
        b[x][y] = 0;
      }
    }
    lv = 7;
  }  

  if (lv == 7) 
  {
    for (int x = 0; x < 16; x += 1) 
    {
      for (int y = 0; y < 16; y += 1) 
      {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) 
        {
          mx = floor(mouseX/62.5);
          my = floor(mouseY/62.5);
          p2.play();

          b[mx][my] = 4;
        }
        if (b[x][y] != 0 ) 
        {
          fill(#3CD4ED);
          lv = 8;
        }
        else 
        {
          fill(random(255), 0, random(255));
          lv = 7;
        }
        rect(x*62.5, y*62.5, 62.5, 62.5);
      }
      if (b[0][0] == 4 && b[1][0] == 4 && b[2][0] == 4 && b[3][0] == 4 
        && b[4][0] == 4 && b[5][0] == 4 && b[6][0] == 4 && b[7][0] == 4

        && b[0][1] == 4 && b[1][1] == 4 && b[2][1] == 4 && b[3][1] == 4 
        && b[4][1] == 4 && b[5][1] == 4 && b[6][1] == 4 && b[7][1] == 4

        && b[0][2] == 4 && b[1][2] == 4 && b[2][2] == 4 && b[3][2] == 4 
        && b[4][2] == 4 && b[5][2] == 4 && b[6][2] == 4 && b[7][2] == 4

        && b[0][3] == 4 && b[1][3] == 4 && b[2][3] == 4 && b[3][3] == 4 
        && b[4][3] == 4 && b[5][3] == 4 && b[6][3] == 4 && b[7][3] == 4

        && b[0][4] == 4 && b[1][4] == 4 && b[2][4] == 4 && b[3][4] == 4 
        && b[4][4] == 4 && b[5][4] == 4 && b[6][4] == 4 && b[7][4] == 4

        && b[0][5] == 4 && b[1][5] == 4 && b[2][5] == 4 && b[3][5] == 4 
        && b[4][5] == 4 && b[5][5] == 4 && b[6][5] == 4 && b[7][5] == 4

        && b[0][6] == 4 && b[1][6] == 4 && b[2][6] == 4 && b[3][6] == 4 
        && b[4][6] == 4 && b[5][6] == 4 && b[6][6] == 4 && b[7][6] == 4

        && b[0][7] == 4 && b[1][7] == 4 && b[2][7] == 4 && b[3][7] == 4 
        && b[4][7] == 4 && b[5][7] == 4 && b[6][7] == 4 && b[7][7] == 4) 
      {
        lv = 8;
      }
    }
  }

  if (lv == 8)
  {
    timer = -1;
    fill(255);
    Verdana = loadFont("Verdana-20.vlw");
    textFont(Verdana, 50);
    text("YOU'VE DEFEATED", width/2-230, height/2-100); 
    text("THE BATMAN!", width/2-170, height/2-55);
    image(win, width/2-230, height/2-45);
    p3.play();
  }
  image(mouse, pmouseX, pmouseY);
}

void restart()
{ 
  timer = 15;
  lv = 1;
}

void keyPressed () 
{
  if (key == ' ')
  {
    restart();
  }
}


