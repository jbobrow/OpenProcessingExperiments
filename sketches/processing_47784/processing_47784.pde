
float level, g, timenum, health, finish;
int ts, bc, ic; // bc = button color, ic = instruct color
int xPos, yPos; //button positions
asteroids[] a;
enemy1[]e1;

void setup()
{
  size(500, 500);
  timenum = 120; 
  level = 0;
  g = 1;
  health = 500;
  finish = 0;
  a = new asteroids[100];
  for (int i = 0;  i<10; i++) {
    a[i] = new asteroids();
    a[i].x = random(500);
    a[i].y = random(350);
    a[i].s = random (50);
    a[i].notshot = true;
  }
  e1 = new enemy1[3];
  for (int i = 0; i<3; i++)
  {
    e1[i] = new enemy1();
    e1[i].x = random (500);
    e1[i].y = random (300);
    e1[i].s = random (50);
    e1[i].notshot = true;
  }
  /*for (int i = 0;  i<10; i++) {
   a[i] = new asteroids();
   a[i].x = random(500);
   a[i].y = random(350);
   a[i].s = random (50);
   a[i].s++;
   a[i].notshot = true;
   }*/
}

void draw()
{
  background (0);
  if (level == 0) introscreen();
  else if (level == 0.5) instructions();
  else if (level == 1) level1();
  else if (level == 200) youlose1();
  else if (level == 2) level2();
}

void introscreen()
{
  startbutton();
  instrButton();
  title();
  ic = #FF0303;
  xPos = 400;
  yPos = 450;
}

void instructions()
{
  inst();
}

void level1()
{
  ship();
  time();
  health();
  ts = #00FF00;

  for (int i= 0; i<10; i++)
  {
    if (level ==1) a[i].showasteroid();
    if (level ==1) a[i].moveasteroid();
    if (a[i].s<50)
    {
      a[i].a = 50;
      a[i].a=a[i].a+10;
    }
    if (a[i].s>50) a[i].a = 5000;
    if (dist (mouseX, mouseY, a[i].x, a[i].y)<a[i].s/2) {
      a[i].targetoffasteroid=false;
      ts=#FF0000;
      //a[i].x = mouseX;
      //a[i].y = mouseY;
    }
    if (a[i].targetoffasteroid) {
      ts = #00FF00;
      //a[i].x=a[i].x+(mouseX-250)*0.01;
      //a[i].y=a[i].y+(mouseY-250)*0.01;
    }


    if (mousePressed && dist (mouseX, mouseY, a[i].x, a[i].y)<a[i].s/2) {
      a[i].targetoffasteroid = true;
      a[i].s=0;
      a[i].x=-5000;
      a[i].notshot = false;
      println (a[i].s);
    }

    if (a[i].s>200 && a[i].x>0 && a[i].x <500 && a[i].y>0 && a[i].y<350) {
      println(a[i].y);
      health--;
    }

    drawTarget(mouseX, mouseY);
  }

  for (int i = 0; i<3; i++)
  {
    if (e1[i].notshot) {
      e1[i].showenemy1();
      e1[i].moveenemy1();
      e1[i].s= e1[i].s+0.05;
      e1[i].l= e1[i].l+0.05;
    }

    if (e1[i].s>200 && e1[i].x>0 && e1[i].x <500 && e1[i].y>0 && e1[i].y<350) {
      println(a[i].y);
      health--;
    }
  }

  if (health <0) level = 200;
  finishline();
  finish = finish + 0.1;
  if (finish>250) level = 2;
}

void level2()
{
  fill (255);
  text ("You win!!!", 50, 50);
}

void youlose1()
{
  fill (255);
  text ("You lose :(", 50, 50);
}

void drawTarget(int x, int y)
{
  int radius = 30;
  noFill();
  stroke(ts);
  ellipseMode(CENTER);
  ellipse(x, y, radius*2, radius*2);
  line(x-radius-10, y, x+radius+10, y);
  line(x, y-radius-10, x, y+radius+10);
}

void finishline()
{
  noStroke();
  fill (0, 255, 255, 50);
  rect (0, 200-0.5*finish, width, finish);
}

void ship()
{
  noStroke();
  fill (255);
  rect(0, 350, 500, 150);
}

class asteroids
{
  float x, y, s, a;
  boolean notshot;
  boolean targetoffasteroid;
  void showasteroid()
  {
    if (notshot) {
      stroke (0);
      fill (#71321A, a);
      ellipse (x, y, s, s);
    }
  }
  void moveasteroid()
  {
    if (notshot) {
      s= s + 0.1;
      x=x+(mouseX-250)*0.01;
      y=y+(mouseY-250)*0.01;
    }
  }
}

class enemy1
{
  float x, y, s, l;
  boolean notshot;

  void showenemy1()
  {
    if (notshot) 
    {
      stroke(0);
      fill (255, 255, 0);
      rect (x-0.5*width, y, width, 0.25*s);

      stroke(0);
      fill (255, 0, 0);
      rect (x, y, s, 0.5*s);
    }
  }
  void moveenemy1()
  {
    x=x+(mouseX-250)*0.01;
    y=y+(mouseY-250)*0.01;
  }
}

void health()
{
  fill (0, 0, 255);
  rect (0, 350, health, 25);
  if (health<0) health = 0;
}

void time()
{
  fill(0, 0, 255);
  text("Time:"+timenum, 15, 475);
  timenum = timenum - 0.02;
  text("sec", 115, 475);
}

// INTRO SCREEN : SEPERATE SKETCH!
void startbutton()
{
  noFill();
  stroke(bc);
  rect(xPos, yPos, 55, 25); 
  text("START", 410, 470);
  /*if (mouseX >xPos && mouseX<xPos+55 && mouseY>yPos && mouseY<yPos +25) {
   bc = 255;
   }
   else {
   bc =  #FF0303;
   }*/
  println(xPos + "," + yPos);
  if(keyPressed && key == ENTER)
  {
   level = 1; 
  }
  if(keyPressed && key == BACKSPACE)
  {
   level = 0.5; 
  }
}

void instrButton()
{
  noFill();
  stroke(ic);
  rect(200, 250, 125, 35);
  text("INSTRUCTIONS", 217, 273);
  if (mousePressed)
  {
    ic = 255;
  }
}

void title()
{
  text("TITLE", 250, 50);
}

void inst()
{
  text("Try to shoot down as many asteroids & enemies as you can", 100, 250);
  text("Use your mouse to aim your crosshairs and click to shoot",100, 275);
  text("The blue bar represents youtr health, which will decrease if hit hit an asteroid", 50, 300);
if(keyPressed && key == ENTER)
  {
   level = 1; 
  }


}

// CODE ENDS HERE


