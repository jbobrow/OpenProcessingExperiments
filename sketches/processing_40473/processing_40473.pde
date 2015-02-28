
//homework 8
//copyright Kristen McConnell September 2011 Pittsburgh PA 15221
  
//Variables
float x,y,x1,y1,deltaX,deltaY,deltaX1,deltaY1,dia,dia2,collide;
int countCollide;
PImage peanutButter,jelly,sandwich;
boolean xBounce, yBounce;
  
void setup()
{
  size(450,450);
  xBounce=false;
  yBounce=false;
  x=random(width);
  y=random(height);
  dia = 50;
  dia2 = 250;
  x1=(width/2) - (dia/2);
  y1=(height/2) - (dia/2);
  deltaX = random(0,10);
  deltaY = random(0,10);
  deltaX1 = 0;
  deltaY1 = 0;
  peanutButter = loadImage("peanut_butter.jpg");//Photo taken by Kristen McConnell
  jelly = loadImage("jelly.jpg");//Photo taken by Kristen McConnell
  sandwich = loadImage("sandwich.jpg");//Photo taken by Kristen McConnell
  collide = 40;
  countCollide=0;

}
  
void draw()
{
  frameSpeed();
  prepScreen();
  drawPeanutButter();
  movePeanutButter();
  drawJelly();
  moveJelly();
  checkJelly();
  resetJelly();
  checkCollision();
  stats();
}

//Display Statistics (Collisions,Vertical Speed, Horizontal Speed & Time)
void stats()
{
  fill(0);
  text("Collisions: " + countCollide, 20, 30);
  text("Vertical Speed: " + (int)(deltaY1), 20, 50);
  text("Horizontal Speed: " + (int)(deltaX1), 20, 70);
  text("Time: " + millis()/1000, 20, 90);
}
  
//Reset FrameSpeed after Collision
void frameSpeed()
{
  frameRate(50);
}

//What Happens when Peanut Butter and Jelly Collide
void collision()
{
  frameRate(.5);
  fill(255,0,0);
  rect(0,0,width,height);
  fill(255);
  image(sandwich,width/2 - dia2/2,height/2 - dia2/2,dia2,dia2);
  text("Peanut Butter + Jelly = Sandwich. " + countCollide + " Hit(s)", width/4.5, (height/8)*6.5);
}


//Checks for Collisions between Peanut Butter and Jelly
void checkCollision()
{
  if (dist(x1,y1,x,y) < collide)
  {
    countCollide = countCollide + 1;
    collision();
    x=random(width);
    y=random(height);
    x1=(width/2) - (dia/2);
    y1=(height/2) - (dia/2);
    deltaX = random(0,10);
    deltaY = random(0,10);
    deltaX1 = 0;
    deltaY1 = 0;
  }
}

//Resets the Jelly to the Initial Position when the Spacebar is Pressed
void resetJelly()
{
  if (keyPressed && key ==32)
  {
    x1=(width/2) - (dia/2);
    y1=(height/2) - (dia/2);
    deltaX1=0;
    deltaY1=0;
  }
}
//Checks if the Jelly Image is Off the Screen & Let User Know Jelly's Location with Text
void checkJelly()
{
  if(x1>width || y1>height || x1+dia<0 || y1+dia<0)
  {
    stroke(255,0,0);
    strokeWeight(2);
    line (width/2,height/2,x1,y1);
    fill(255,0,0);
    text("The jelly has escaped. Distance: " + (int)(dist(x1 - dia/2,y1 - dia/2,width/2,height/2)), width/4, height/1.5);
  }
}

//Draws Peanut Butter Image
void drawPeanutButter()//also known as drawSomething function
{
  image(peanutButter,x,y,dia,dia);
}
  
  
//Allows Peanut Butter to Move & Bounce Around the Screen
void movePeanutButter()
{
  //Bounce Right and Left
  if (xBounce == false)
  {
    x = x + deltaX;
  }
  else 
  {
    x = x - deltaX;
  }
  if(x>width - dia/2)
  {
    xBounce = true;
  }
  else if (x<0)
  {
    xBounce = false;
  }
  //Bounce Top and Bottom
  if (yBounce == false)
  {
    y = y + deltaY;
  }
  else 
  {
    y = y - deltaY;
  }
  if(y>height - dia/2)
  {
    yBounce = true;
  }
  else if (y<0)
  {
    yBounce = false;
  }
}
   
//Draws the Jelly on the Screen
void drawJelly()//also known as drawInitials function
{
  image(jelly,x1,y1,dia,dia);
}

//Arrow KeyPresses to Control Jelly
void keyPressed()
{
  if (keyCode == RIGHT)
  {
    deltaX1 = deltaX1 + 1;
  }
  else if (keyCode == LEFT)
  {
    deltaX1 = deltaX1 - 1;
  }
  else if (keyCode == UP)
  {
    deltaY1 = deltaY1 - 1;
  }
  else if (keyCode == DOWN)
  {
    deltaY1 = deltaY1 + 1;
  }
}

//Moves Jelly
void moveJelly()
{
  x1 = x1 + deltaX1;
  y1 = y1 + deltaY1;
}
  
//Draws White Background Repeatedly
void prepScreen()
{
  noStroke();
  fill(255);
  rect (0,0,width,height);
}

