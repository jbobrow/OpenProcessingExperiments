
/* Billiard 
 * image data (http://www13.oekakibbs.com/bbs/anotheram400/oekakibbs.cgi?mode=res_msg&resno=18&author=0&thumb=0&picwid=300&pichei=300&thisfile=18.jpg) 
 */

import fisica.*;

// background
PImage bg;

// Title Font
PFont font;

FWorld world;

// 9 Balls
FCircle ball;

// Ball Texture
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9;

// White Ball
FCircle wtBall;

// Ball Color
color wtBallColor = #FFFFFF;

// Pockets
FBox pocket1, pocket2, pocket3, pocket4, pocket5, pocket6;

// Pocket Size
int pSize = 50;

// ball Size
int ballSize = 40;

// box Size
int boxSize = 10;

// Position
float wd10, ht10;


void setup()
{
  size(700, 400);
  wd10 = (width - 10);
  ht10 = (height - 10);

  smooth();

  font = loadFont("ARBONNIE-48.vlw");
  bg = loadImage("green.jpg");
  
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setEdges(this, color(0, 0));
  world.setEdgesRestitution(0.0);
  world.setGravity(0, 0);

  wtBall = new FCircle(ballSize);
  wtBall.setPosition(width - width/4, height/2);
  wtBall.setFillColor(wtBallColor);
  wtBall.setNoStroke();
  world.add(wtBall);
  
  setBall(1, img1);
  setBall(2, img2);  
  setBall(3, img3);
  setBall(4, img4);
  setBall(5, img5);
  setBall(6, img6);
  setBall(7, img7);
  setBall(8, img8);
  setBall(9, img9);

  pocket1 = new FBox(boxSize, boxSize);
  pocket1.setPosition(10, 10);
  pocket1.setStatic(true);
  pocket1.setFill(0);
  world.add(pocket1);

  pocket2 = new FBox(boxSize, boxSize);
  pocket2.setPosition(10, ht10);
  pocket2.setStatic(true);
  pocket2.setFill(0);
  world.add(pocket2);

  pocket3 = new FBox(boxSize, boxSize);
  pocket3.setPosition(width / 2, 0);
  pocket3.setStatic(true);
  pocket3.setFill(0);
  world.add(pocket3);

  pocket4 = new FBox(boxSize, boxSize);
  pocket4.setPosition(wd10, 10);
  pocket4.setStatic(true);
  pocket4.setFill(0);
  world.add(pocket4);

  pocket5 = new FBox(boxSize, boxSize);
  pocket5.setPosition(width / 2, height);
  pocket5.setStatic(true);
  pocket5.setFill(0);
  world.add(pocket5);

  pocket6 = new FBox(boxSize, boxSize);
  pocket6.setPosition(wd10, ht10);
  pocket6.setStatic(true);
  pocket6.setFill(0);
  world.add(pocket6);
}
 
void draw()
{
  setBg();
  setTitle();
  setPocket();

  world.step();
  world.draw();

}


void setBg()
{
  image(bg, 0, 0, width, height);
}

void setPocket()
{
  fill(0);
  ellipse(10, 10, pSize, pSize);
  ellipse(10, ht10, pSize, pSize);
  ellipse(width / 2, 10, pSize, pSize);
  ellipse(width / 2, ht10, pSize, pSize);
  ellipse(wd10, 10, pSize, pSize);
  ellipse(wd10, ht10, pSize, pSize);
}

void setBall(int number, PImage img)
{
  ball = new FCircle(ballSize);

  switch(number){
  case 1:
    ball.setPosition(width/3, height/2);
    break;
  case 2:
    ball.setPosition((width/3) - 80, (height/2) - 40);
    break;
  case 3:
    ball.setPosition((width/3) - 160, (height/2));
    break;
  case 4:
    ball.setPosition((width/3) - 80, (height/2) + 40);
    break;
  case 5:
    ball.setPosition((width/3) - 40, (height/2) - 20);
    break;
  case 6:
    ball.setPosition((width/3) - 40, (height/2) + 20);
    break;
  case 7:
    ball.setPosition((width/3) - 120, (height/2) - 20);
    break;
  case 8:
    ball.setPosition((width/3) - 120, (height/2) + 20);
    break;
  case 9:
    ball.setPosition((width/3) - 80, (height/2));
    break;
  } 

  ball.attachImage(img);
  ball.setNoStroke();
  world.add(ball);

}

void contactStarted(FContact c) {

  FBody ball = null;

  if ((c.getBody1() == pocket1) 
      || (c.getBody1() == pocket2) 
      || (c.getBody1() == pocket3) 
      || (c.getBody1() == pocket4) 
      || (c.getBody1() == pocket5) 
      || (c.getBody1() == pocket6)) {

    ball = c.getBody2();
  }
   else if ((c.getBody2() == pocket1) 
    	 || (c.getBody2() == pocket2) 
	 || (c.getBody2() == pocket3) 
	 || (c.getBody2() == pocket4) 
	 || (c.getBody2() == pocket5) 
	 || (c.getBody2() == pocket6)) {

    ball = c.getBody1();
  }

  if(ball != null) {
    world.remove(ball);  
  }
}

void setTitle()
{
  textFont(font, 30);
  noStroke();
  fill(255, 255, 0);
  text("[Processing][fisica] Billiard", width/2, height/2);
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}



