
//Derek Chan,Ticklish Penguin,CP 1 Mods 14-15
//http://derek-lhs.webs.com/CatchThePikachu.html
/* @pjs globalKeyEvents="true"; */
int x = 300;
int y = 300;
int time = 0;
int leftRight;
int upDown;
int movement;
PImage pikachu;
PImage pokeBall;
PImage caughtIt;
PImage nope;
void setup()
{
  size(600, 600);
  pikachu = loadImage("http://derek-lhs.webs.com/Pikachu.jpg");
  pokeBall = loadImage("http://derek-lhs.webs.com/Pokeball.gif");
  caughtIt = loadImage("http://derek-lhs.webs.com/CaughtIt.jpg");
  nope = loadImage("http://derek-lhs.webs.com/Nope.jpg"); 
  frameRate(10);
}
void draw()
{
  reset();
  time++;
  if (leftRight==x && upDown==y)
  {
    capture();
  }
  else
  {
    if (time>100)
    { 
      agility();
      movingPikachu();
      catchIt();
    }
    else
    {
      scenery();
      textBox();
      movingPikachu();
      catchIt();
    }
  }
}
//The Randomly Moving Pikachu
void movingPikachu()
{
  strokeWeight(4);
  rect(x, y, 75, 75);
  image(pikachu, x, y, 75, 75);
  movement = int(random(1, 5));
  if (movement == 1)
  {
    x = x+20;
  }
  else if (movement == 2)
  {
    x = x - 20;
  }
  else if (movement == 3)
  {
    y = y + 20;
  }
  else if (movement == 4)
  {
    y = y - 20;
  }
  if (x>525)
  {
    x = x - 40;
  }
  if (x<0)
  {
    x = x + 40;
  }
  if (y>375)
  {
    y = y - 40;
  }
  if (y<0)
  {
    y = y + 40;
  }
}
//The Text Box
void textBox()
{
  fill(255);
  strokeWeight(5);
  rect(20, 500, 540, 100);
  ellipse(20, 500, 15, 15);
  ellipse(20, 600, 15, 15);
  ellipse(560, 500, 15, 15);
  ellipse(560, 600, 15, 15);
  fill(0);
  textAlign(CENTER);
  PFont PkmnText;
  PkmnText = loadFont("Tahoma.vlw");
  textFont(PkmnText);
  textSize(40);
  text("Wild PIKACHU Appeared!", 300, 550);
  textSize(25);
  text("Use the arrow keys to catch it!", 300, 590);
}
//Your Pokeball
void catchIt()
{
  image(pokeBall, leftRight, upDown, 25, 25);
  strokeWeight(1);
  noFill();
  rect(leftRight, upDown, 25, 25);
  if (keyPressed)
  {
    if (keyCode==UP)
    {
      upDown= upDown-10;
    }
    if (keyCode==DOWN)
    {
      upDown = upDown+10;
    }
    if (keyCode==RIGHT)
    {
      leftRight=leftRight+10;
    }
    if (keyCode==LEFT)
    {
      leftRight=leftRight-10;
    }
  }
  if (upDown<0)
  {
    upDown= upDown+20;
  }
  if (upDown>475)
  {
    upDown= upDown-20;
  }
  if (leftRight<0)
  {
    leftRight=leftRight+20;
  }
  if (leftRight>575)
  {
    leftRight=leftRight-20;
  }
}
//Speed Up
void agility()
{
  background(255);
  fill(255);
  strokeWeight(5);
  image(nope, 0, 0, 600, 500);
  rect(20, 500, 540, 100);
  ellipse(20, 500, 15, 15);
  ellipse(20, 600, 15, 15);
  ellipse(560, 500, 15, 15);
  ellipse(560, 600, 15, 15);
  fill(0);
  textAlign(CENTER);
  PFont PkmnText;
  PkmnText = loadFont("Tahoma.vlw");
  textFont(PkmnText);
  textSize(40);
  text(" Wild PIKACHU used Agility!", 300, 550);
  textSize(25);
  text("Wild PIKACHU's speed rose!", 300, 590);
  if (movement == 1)
  {
    x = x+20;
  }
  else if (movement ==2)
  {
    x = x - 20;
  }
  else if (movement ==3)
  {
    y = y+20;
  }
  else if (movement == 4)
  {
    y = y - 20;
  }
}
//When you catch the Pikachu
void capture()
{
  background(255);
  fill(255);
  strokeWeight(5);
  image(caughtIt, 0, 0, 600, 500);
  rect(20, 500, 540, 100);
  ellipse(20, 500, 15, 15);
  ellipse(20, 600, 15, 15);
  ellipse(560, 500, 15, 15);
  ellipse(560, 600, 15, 15);
  fill(0);
  strokeWeight(5);
  textAlign(CENTER);
  PFont PkmnText;
  PkmnText = loadFont("Tahoma.vlw");
  textFont(PkmnText);
  textSize(40);
  text("PIKACHU was caught!", 300, 550);
  textSize(25);
  text("Press R to try again!", 300, 590);
}
void scenery()
{
  background(0, 255, 0);
  noFill();
  strokeWeight(2);
  beginShape();
  vertex(50, 215);
  vertex(65, 170);
  vertex(70, 215);
  vertex(85, 180);
  vertex(90, 215);
  vertex(105, 190);
  vertex(110, 215);
  endShape();
  beginShape();
  vertex(150, 280);
  vertex(165, 220);
  vertex(170, 280);
  endShape();
  beginShape();
  vertex(170, 280);
  vertex(185, 230);
  vertex(190, 280);
  endShape();
  beginShape();
  vertex(190, 280);
  vertex(205, 240);
  vertex(210, 280);
  endShape();
  beginShape();
  vertex(375, 335);
  vertex(395, 290);
  vertex(400, 335);
  vertex(415, 300);
  vertex(420, 335);
  vertex(435, 310);
  vertex(440, 335);
  endShape();
  beginShape();
  vertex(550-25, 280);
  vertex(565-25, 220);
  vertex(570-25, 280);
  endShape();
  beginShape();
  vertex(570-25, 280);
  vertex(585-25, 230);
  vertex(590-25, 280);
  endShape();
  beginShape();
  vertex(590-25, 280);
  vertex(605-25, 240);
  vertex(610-25, 280);
  endShape();
}
void reset()
{
  if (keyPressed)
  {
    if (key=='r')
    {
      time=0;
      leftRight=0;
      upDown=0;
      x=300;
      y=300;
    }
  }
}
