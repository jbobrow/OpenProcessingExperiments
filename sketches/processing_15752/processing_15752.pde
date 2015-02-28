
/**
poo game 
vanessa wong
 */

Fall[] fallDown;

// keypress tracking
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;

// coordinates
int x, y;
int u, v;
float prizeX, prizeY;

/*float a = 100;
float b = 100;
float angle1 = 0.0;
float segLength = 75;
*/

// other stuff
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage assassin, necromancer, grrrr90, star, poo, endpoo,wintermiracles,pooland;

void setup()
{
  size(700, 700);
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("LucidaSans-24.vlw");
  //assassin = loadImage("assassinGame.gif");
  //necromancer = loadImage("necromancerGame.gif");
  //grrrr90 = loadImage("grrrr90.gif");
  poo = loadImage("poo.gif");
  endpoo = loadImage("end-poo.gif");
  wintermiracles = loadImage("wintermiricles.gif");
  pooland = loadImage("pooland.gif");
  textFont(font, 24);
  
  fallDown = new Fall[15];
  for(int i=0; i<fallDown.length; i++)
  {
    fallDown[i] = new Fall();
  }

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = random(width);
  
  screenNumber = 0;
}

void draw()
{ 
  background(0);
  for(Fall f: fallDown)
  if (screenNumber == 0)
  {
    displayInstructions();
  }
  else if (screenNumber == 1)
  
  {
    //image(wintermiracles,0,0);
    //image(pooland, 0, 0);
    movePlayers();
    drawPlayers();
    
    
    
    //f.showFall();
    f.fallPoo(fallDown);
    f.showFall();
    f.stayInside();
    
    charInside();
    
    checkPrize();
    drawPrize();
    
    checkPlayerOverlap();
    setSpeedLevel();
    displayScore();
    
  }
  else if (screenNumber == 2)
  {
    displayWinner();
  }
}

class Fall
{
  float a,b,s;
  color c;
  
  Fall()
  {
    a = random(width);
    b = random(height);
    s = random(10,20);
    c = color(60,40,0);
  }
  
  void fallPoo(Fall[] others)
  {
    for(Fall f : others)
    {
      if( f != this )
      {
        if( dist(prizeX,prizeY,f.a,f.b) < s*10000) moveRandomly();
        //if( dist(prizeX,prizeY,mouseX,mouseY) < s*10000) moveRandomly();
      }
    }

  }
  void showFall()
  {
    fill(c);
    ellipse(prizeX,prizeY,s,s);
  }
  void stayInside()
  {
    if(prizeX > width) prizeX = prizeX-width;
    if(prizeY > height) prizeY = prizeY-height;
    if(prizeX<0) prizeX = prizeX+width;
    if(prizeY<0) prizeY = prizeY+height;
  }
}

/*
{
  float da = mouseX - a;
  float db = mouseY - b;
  angle1 = atan2(db, da);  
  a = mouseX - (cos(angle1) * segLength);
  b = mouseY - (sin(angle1) * segLength);
   
  segment(a, b, angle1);
  image(necromancer, a, b);
}



void segment(float a, float b, float c) {
  pushMatrix();
  translate(a, b);
  rotate(c);
  line(0, 0, segLength, 0);
  popMatrix();
}
*/

void displayWinner()
{
  aScore = 0;
  bScore = 0;
  //fill(0, 200, 250);
  //text("Congrats you win ", 50, 100);
  //image(grrrr90, 200, 150);
  //image(grrrr90, 240, 200);
  image(endpoo, 0, 0);
  if (mousePressed) screenNumber = 0;
}

void displayInstructions()
{
  //fill(0, 200, 250);
  //text("Go away!: ", 50, 100);
  //text("try to get away from poo", 50, 200);
  //fill(255);
  //text("click me", 50, 300);
  image(poo,0,0);
  if (mousePressed) screenNumber = 1;
}

void displayScore()
{
  fill(255);
  //text("Fat poo: " + aScore, 10, 40);
  //text("Blue haired boy poo: " + bScore, 400, 40);
}

void setSpeedLevel()
{
  speed = 7;
  //if(aScore>50 || bScore>40) speed = 3;
  //if(aScore>100 || bScore>100) speed = 4;
  //if(aScore>200 || bScore>200) speed = 5;
  if(aScore>0 || bScore>0) screenNumber = 2;
}

void checkPlayerOverlap()
{
  if (dist(x,y, u,v) < 40)
  {
    aScore--;
    bScore--;
    //screenNumber = 3;
  }
}

/*void hahaIWin()
{
  text("Haha! I win!", 100,100);
  if (mousePressed) screenNumber = 0;
}*/

void drawPrize()
{
  //fill(0,200,0);
  //rect(prizeX, prizeY, 10, 10);
  //image(star, prizeX-5, prizeY-5);
  fill(60, 40, 0);
  ellipse(prizeX,prizeY,30, 15);
  ellipse(prizeX, prizeY-9, 25, 12);
  ellipse(prizeX, prizeY-16, 20, 9);
  triangle(prizeX, prizeY-27,prizeX-5,prizeY-16,prizeX+5,prizeY-16);
}

void checkPrize()
{
  if(abs(x - prizeX) < 25 && abs(y - prizeY) < 25)
  {
    aScore += 10;
    placePrizeRandomly();
  }
  if(abs(u - prizeX) < 25 && abs(v - prizeY) < 25)
  {
    bScore += 10;
    placePrizeRandomly();
  }
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
  //prizeY += random(1);
  
}

void moveRandomly()
{
  prizeY += random(1);
  prizeX += random(0.2);
  
}

void drawPlayers()
{
  fill(128);
  //ellipse(x,y, 30,30);
  //rect(u,v, 30,30);
  //image(star, 120, 160);
  //image(necromancer, x, y, 109, 140);
  //image(assassin,u, v); 
  //fatov
  noStroke();
  fill(255, 225, 0);
  ellipse(x, y, 34, 23);//x and y are 0
  //body
  fill(170,150, 0);
  ellipse(x-1, y-17, 30, 30);
  //head
  ellipse(x-6, y-9, 35, 15);
  //chin
  fill(255);
  stroke(0);
  ellipse(x-8-4, y+13, 20, 15);
  ellipse(x+7-3, y+13, 20, 15);
  //legs
  fill(0);
  ellipse(x-6, y-22, 2,2);
  ellipse(x+1, y-22, 2,2);
  fill(0);
  //font = loadFont("LucidaSans-24.vlw");
  //textFont(font,24);
  text(" _ ", x-24,y-15);
  text(" _ ",x-17,y-15 );
  ellipse(x+4, y+19, 2,2);
  ellipse(x-15, y+19, 2,2);
  
  //wigums
  noStroke();
  fill(0, 0, 255);
  ellipse(u, v, 35, 18);
  fill(255, 225, 0);
  ellipse(u, v+20, 32, 34);
  //head
  ellipse(u-5, v+25, 30, 10);
  //chin
  stroke(0);
  fill(255);
  ellipse(u-5-4, v+10, 15, 15);
  ellipse(u+5-3, v+10, 15, 15);
  fill(0);
  ellipse(u-10, v+10, 2,2);
  ellipse(u+2, v+10, 2,2);
  fill(0);
  text(" _ ", u-24,v+28);
  text(" _ ", u-14 ,v+28 );
  noStroke();
  //fill(67, 169, 205);
  fill(0, 0, 255);
  ellipse(u+14, v+7, 9, 9);
  fill(255, 225, 0);
  ellipse(u+15, v+17, 9, 9);
  
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
}

void movePlayers()
{
  if (wPressed) y -= speed;
  if (aPressed) x -= speed;
  if (sPressed) y += speed;
  if (dPressed) x += speed;
  if (rightPressed) u += speed;
  if (leftPressed)  u -= speed;
  if (upPressed)    v -= speed;
  if (downPressed)  v += speed;
}

void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
}

void charInside()
{
  if( x > width ) x = x-width;
  if( y > height ) y = y-height;
  if( x < 0 ) x = x+width;
  if( y < 0 ) y = y+height;
  
  if( u > width ) u = u-width;
  if( v > height ) v = v-height;
  if( u < 0 ) u = u+width;
  if( v < 0 ) v = v+height;
}

