
//lots of variables
int shotx = 10;
int shotx2 = 10;
int shoty = 10;
int shoty2 = 10;
int speedshot = 10;
int location = 15;
int shotExist = 0;
int shotExist2 = 0;       
int score = 0;
int drop = 50;
int increase = 1;

//delcaring monster classes
Monster monster1;
Monster monster2;
Monster monster3;
Monster monster4;
Monster monster5;
Monster monster6;
Monster monster7;
Monster monster8;
Monster monster9;
Monster monster10;

void setup()
{
  rectMode(CENTER);
  ellipseMode(CENTER);
  size(600, 600);
  //initializaing monster classes
  monster1 = new Monster(location, 50, 2, 1);
  monster2 = new Monster(location+50, 50, 2, 1);
  monster3 = new Monster(location+100, 50, 2, 1);
  monster4 = new Monster(location+150, 50, 2, 1);
  monster5 = new Monster(location+200, 50, 2, 1);
  monster6 = new Monster(location+250, 80, 2, 1);
  monster7 = new Monster(location+300, 80, 2, 1);
  monster8 = new Monster(location+350, 80, 2, 1);
  monster9 = new Monster(location+400, 80, 2, 1);
  monster10 = new Monster(location+450, 80, 2, 1);
}

void draw()
{
  background(255, 0, 0);
  //checking to see if the target is hit
  monster1.targetHit();
  monster2.targetHit();
  monster3.targetHit();
  monster4.targetHit();
  monster5.targetHit();
  monster6.targetHit();
  monster7.targetHit();
  monster8.targetHit();
  monster9.targetHit();
  monster10.targetHit();
  // draws the ship
  drawShip();
  //moves the bullet
  moveShot();
  //displays and moves the monster
  monster1.display();
  monster1.moveMonster();
  monster2.display();
  monster2.moveMonster();
  monster3.display();
  monster3.moveMonster();
  monster4.display();
  monster4.moveMonster();
  monster5.display();
  monster5.moveMonster();  
  monster6.display();
  monster6.moveMonster();
  monster7.display();
  monster7.moveMonster();
  monster8.display();
  monster8.moveMonster();
  monster9.display();
  monster9.moveMonster();
  monster10.display();
  monster10.moveMonster();
}
//draw a ship
void drawShip()
{
  fill(0, 255, 0);
  rect(mouseX, constrain(mouseY, 550, 551), 30, 30);
  fill(255, 255, 0);
  ellipse(mouseX, constrain(mouseY-15, 535, 536), 15, 15);
}
//fire a bullet when any key is pressed
void keyPressed()
{
  if(shotExist == 0)
  {
  shotx = mouseX;
  shoty = 530;
  ellipse(shotx, shoty, 15, 15);
  shotExist = 1;
  }
  /*else
  {
    
  }*/
  /*if(shotExist == 1)
  {
   shotx2 = mouseX;
   shoty2 = 530;
   ellipse(shotx2,shoty2,15,15);
   shotExist2 = 1;
  }
  else
  {
    
  }*/
}
//moves the bullet up until top of screen
void moveShot()
{
  if (shotExist == 1)
  {
    shoty = shoty - speedshot;
    fill(0, 0, 255);
    ellipse(shotx, shoty, 15, 15);
  }
  /*if (shotExist2 == 1)
  {
   shoty2 = shoty2 - speedshot;
  fill(0,0,255);
 ellipse(shotx2,shoty2,15,15); 
  }*/
  if (shoty < 0)
  {
    shotExist = 0;
  }
  /*if (shoty2 == 0)
  {
   shotExist2 = 0;
  }*/
}
//monster class
class Monster
{
  int xpos;
  int ypos;
  int speed;
  int exist;


  Monster(int txpos, int typos, int tspeed, int texist)
  {
    xpos = txpos;
    ypos = typos;
    speed = tspeed;
    exist = texist;
  }
//displays the monster
  void display()
  {
    noStroke();
    fill(0, 255, 0);
    ellipseMode(CENTER);
    if (exist == 1)
    {
      ellipse(xpos, ypos, 30, 30);
    }
    else if (exist == 0)
    {
      xpos = 0;
      ypos = 0;
      
    }
  }
//moves the monster, drops down and increases speed every time it touches the side of the screen
  void moveMonster()
  {
    xpos = xpos + speed;
    if (xpos+15 > width)
    {
      xpos = 570;
      speed = abs(speed) + increase;
      speed = speed * -1;
      ypos = ypos + drop;
    } else if (xpos-15 < 0)
    {
      xpos = 50;
      speed = abs(speed) + increase;
      ypos = ypos + drop;
    }
  }
  //check to see if target is hit and if so it disappears
  void targetHit()
  {
    if (shotx > xpos-15 && shotx < xpos+15 && shoty == ypos)
    {
      exist = 0;
      shotExist = 0;
      shoty = 530;
      score = score + 1;
    }
   /*     if (shotx2 > xpos-15 && shotx2 < xpos+15 && shoty2 == ypos)
    {
      exist = 0;
      shotExist = 0;
      shoty = 530;
      score = score + 1;
    }*/
  }
}



