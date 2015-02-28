
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, October 2013
//HW08_The Tragedy of the Urban Commons

PImage community, man, woman, newcomer, pic;
float x1, x2, x3, x4, x5, x6;
float y1, y2, y3, y4, y5, y6;
float dx1, dx2, dx3, dx4, dx5, dx6;
float dy1, dy2, dy3, dy4, dy5, dy6;
float criticaldist;
float easing = 0.05;
int collision;
int gameover;
int collisionleft=25;
//int frame=0;

PFont BoldFont;

void setup()
{
  size(700, 450);
  man= loadImage("man.png");
  woman= loadImage("woman.png");
  newcomer= loadImage("newcomer.png");
  community= loadImage("community02big.png");
  pic= loadImage("bgpic.jpg");
  rectMode(CENTER);
  
  x1= random(width*0.1, width*0.9);
  x2= random(width*0.1, width*0.9);
  x3= random(width*0.1, width*0.9);
  x4= random(width*0.1, width*0.9);
  x5= random(width*0.1, width*0.9);

  y1= random(height*0.4, height*0.9);
  y2= random(height*0.4, height*0.9);
  y3= random(height*0.4, height*0.9);
  y4= random(height*0.4, height*0.9);
  y5= random(height*0.4, height*0.9);

  dx1= random(1, 2);
  dx2= random(1, 2); 
  dx4= random(1, 2); 
  dy1= random(1, 2);
  dy2= random(1, 2);
  dy4= random(1, 2); 
  dy5= random(1, 2); 
  
  gameover=0;
  BoldFont= loadFont("BoldFont.vlw");
}

void draw()

{
  prepWindow();
  drawMan();
  drawMan2();
  drawWoman();
  drawWoman2();
  moveNewcomer();
  checkCollisionwithNewcomer();
  checkGentrification();
  //frame++;
  //saveFrame("video/video"+frame+".jpg");
}

void keyPressed()
{
 if (key == 'G' || key == 'g')
{
  if (collision >=25)
  {
    gameover=1;
    image(community, 0, 0, width, height);
    String s1 = "'A community group that struggles to maintain ethnic diversity in its neighborhood and protect against gentrification may suddenly find its property prices (and taxes) rising as real estate agents market the 'character' of their neighborhood to the wealthy as multicultural, street-lively, and diverse' David Harvey";
    String s2 = "This means that the people who initially created the identity of a place, get displaced due to the commodification of that identity.\nPRESS SPACE TO REBOOT";
    fill(0,0,0);
    textMode(CENTER);
    textFont(BoldFont, 22);
    text("The tragedy of Urban Commons", width*0.03, height*0.65);
    textFont(BoldFont, 12);  
    text(s1, width*0.5, height*0.85, width*0.95, height*0.35);
    textFont(BoldFont, 10);
    text(s2, width*0.5, height*0.9, width*0.95, height*0.2);
    saveFrame("data/p.jpg");
    pic= loadImage("p.jpg");
  }
 }
 
   
  else if (key == ' ' )
    {
    background(0,0,0);
    saveFrame("data/p.jpg");
    pic= loadImage("p.jpg");
    gameover=0;
    collision=0;
    collisionleft=25;
    prepWindow();
    x1= random(width*0.1, width*0.9);
    x2= random(width*0.1, width*0.9);
    x3= random(width*0.1, width*0.9);
    x4= random(width*0.1, width*0.9);
    x5= random(width*0.1, width*0.9);

    y1= random(height*0.4, height*0.9);
    y2= random(height*0.4, height*0.9);
    y3= random(height*0.4, height*0.9);
    y4= random(height*0.4, height*0.9);
    y5= random(height*0.4, height*0.9);
    }
}

void prepWindow()
{
 background(pic); 
 if (gameover==0)
 {
 image(community, 0, 0, width, height);
 fill(255,255,255);
 textFont(BoldFont, 10);
 text("you are the developer move mouse around\nto talk to community and build new projects\nbuildings until community is complete: " +collisionleft , width*0.05, height*0.05); 
 }
}

void drawMan()
{
  image(man, x1, y1, man.width*0.5, man.height*0.5); 

  x1 += dx1;
  if (x1 > width - man.width*0.2 || x1 < -man.width*0.2)
  {
    dx1= -dx1;
  }

  y1 += dy1;
  if (y1 > height - man.height*0.4 || y1 < height/2 - man.height*0.2)
  {
    dy1= -dy1;
  }
}

void drawMan2()
{
  image(man, x4, y4, man.width*0.5, man.height*0.5); 
  
  x4 += dx4;
  if (x4 > width - man.width*0.2 || x4 < -man.width*0.2)
  {
    dx4= -dx4;
  }

  y4 += dy4;
  if (y4 > height - man.height*0.4 || y4 < height/2 - man.height*0.2)
  {
    dy4= -dy4;
  }
}

void drawWoman()
{
  image(woman, x2, y2, woman.width*0.5, woman.height*0.5); 
  
  x2 += dx2;
  if (x2 > width - woman.width*0.4 || x2 < -woman.width*0.4)
  {
    dx2= -dx2;
  }

  y2 += dy2;
  if (y2 > height - woman.height*0.4 || y2 < height/2 - woman.height*0.2)
  {
    dy2= -dy2;
  }
}

void drawWoman2()
{
  image(woman, x5, y5, woman.width*0.5, woman.height*0.5); 
  
  x5 += dx5;
  if (x5 > width - woman.width*0.2 || x5 < -woman.width*0.2)
  {
    dx5= -dx5;
  }

  y5 += dy5;
  if (y5 > height - woman.height*0.4 || y5 < height/2 - woman.height*0.2)
  {
    dy5= -dy5;
  }
}

void drawNewcomer(float x3, float y3)
{
  image(newcomer, x3, y3, newcomer.width*0.4, newcomer.height*0.4); 
}

void moveNewcomer()
{
 image(newcomer, x3, y3, newcomer.width*0.5, newcomer.height*0.5); 
 dx3= mouseX - x3;
 if (abs(dx3)>1)
 {
  x3 += dx3 * easing;
 }
 
  if (x3 > width + newcomer.width*0.2)
  {
    x3 = 0;
  }
  if (x3 < - newcomer.width*0.2)
  {
    x3 = width;
  }
  
 dy3= mouseY - y3;
 if (abs(dy3)>1)
 {
  y3 += dy3 * easing;
 }
 
 if (y3 > height + newcomer.height*0.2)
  {
   y3 = 0; 
  }
  if (y3 < - newcomer.height*0.2)
  {
   y3 = height;
  }
  
}


//collisions of Newcomer/Developer with others
void checkCollisionwithNewcomer()
{
 //colision of new comer with man 1
 float DSnc1 = dist(x1, y1, x3, y3);
 float tempdx1= dx1;
 float tempdy1= dy1;
 
 if (DSnc1 <= man.height*0.2)
 {
  dx1= dx3*0.1;
  dx3= tempdx1;
  dy1= -dy3*0.1;
  dy3= tempdy1; 
  
  drawNewBuilding();
  collision++;
  collisionleft--;
  x1= random(0,width);
 }
 
  //colision of new comer with woman 1
 float DSnc2 = dist(x2, y2, x3, y3);
 float tempdx2= dx2;
 float tempdy2= dy2;
 
 if (DSnc2 <= woman.height*0.2)
 {
  dx2= dx3*0.1;
  dx3= tempdx2;
  dy2= -dy3*0.1;
  dy3= tempdy2; 
  
  drawNewBuilding();
  collision++;
  collisionleft--;
  x2= random(0,width);
 }
 
  //colision of new comer with man 2
 float DSnc4 = dist(x4, y4, x3, y3);
 float tempdx4= dx4;
 float tempdy4= dy4;
 
 if (DSnc4 <= woman.height*0.2)
 {
  dx4= dx3*0.1;
  dx3= tempdx4;
  dy4= -dy3*0.1;
  dy3= tempdy4; 
  
  drawNewBuilding();
  collision++;
  collisionleft--;
  x4= random(0,width);
 }
 
  //colision of new comer with woman 2
 float DSnc5 = dist(x5, y5, x3, y3);
 float tempdx5= dx5;
 float tempdy5= dy5;
 
 if (DSnc5 <= woman.height*0.2)
 {
  dx5= dx3*0.1;
  dx3= tempdx5;
  dy5= -dy3*0.1;
  dy3= tempdy5; 
  
  drawNewBuilding();
  collision++;
  collisionleft--;
  x5= random(0,width);
 }
}

//when collisions happen, New Buildings are constructed
void drawNewBuilding()
{
  background(pic);
  image(community, 0, 0, width, height);
  noStroke();
  fill(255, 255, 255);
  rect(random(0, width), random(height/3, height), random(20, 50), random(80, 200));
  rect(random(0, width), random(height/3, height), random(20, 50), random(80, 200));
  saveFrame("data/p.jpg");
  pic= loadImage("p.jpg");
}

//checks Gentrification: if more than 25 collisions have happened, Gentrification process is complete
void checkGentrification()
{
  if (collision >=10)
  {
   x1=10000;
   y1=10000; 
  }
  
  if (collision >= 15)
  {
   x2=10000;
   y2=10000; 
  }
  
  if (collision >= 20)
  {
    x4=10000;
    y4=10000;
  }
  
  if (collision >= 25)
  {
   x5=10000;
   y5=10000; 
  }
  
  if (collision >=25)
  {
    if (gameover==0)
    {
      fill(0, 0, 0);
      textMode(CENTER);
      textFont(BoldFont, 14);
      text("You are left alone", width*0.05, height*0.90);
      textFont(BoldFont, 12);
      text("press G to see what happened", width*0.05, height*0.94);
    }
  }
}


