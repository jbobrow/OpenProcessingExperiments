
float playerX=300; 
float playerY=640; 
float laserOn=1;
int score=0;
int lives=4;
int lost=0;
PImage lose;
PImage win;
PImage backG;
/////////////////////
////// enemy 1 //////
/////////////////////
PImage enemy1;
float boomTimer=-1;
float boom1X=-1;
float boom1Y=-1;
float boom1size=35;
float boom1small=0;
float enemy1X=random(500);
float enemy1Y=-5;
float enemyXgive=20;
float enemyYgive=25;
/////////////////////
////// enemy 2 //////
/////////////////////
PImage enemy2;
float boomTimer2=-1;
float boom2X=-1;
float boom2Y=-1;
float boom2size=35;
float boom2small=0;
float enemy2X=random(500);
float enemy2Y=-150;
/////////////////////
////// enemy 3 //////
/////////////////////
PImage enemy3;
float boomTimer3=-1;
float boom3X=-1;
float boom3Y=-1;
float boom3size=35;
float boom3small=0;
float enemy3X=random(500);
float enemy3Y=-300;
/////////////////////
////// enemy 4 //////
/////////////////////
PImage enemy4;
float boomTimer4=-1;
float boom4X=-1;
float boom4Y=-1;
float boom4size=35;
float boom4small=0;
float enemy4X=random(500);
float enemy4Y=-400;
/////////////////////
float makeLaser=1;
float laserTimer=-1;
float laserX;
float laserY;
float moveLeft=0;
float moveRight=0;
float moveUp=0;
float slideTimer=-1;
float moveDown=0;
PImage player;
PImage slideUp;
PImage slideLeft;
PImage slideRight;
float noRush=0;
float rushLeft=1;
float rushRight=1;
float rushUp=1;
float canRush=0;
float playerXgive=62;
float playerYgive=48;
float rushSideXgive=90;
float rushSideYgive=75;
float rushUpXgive=75;
float rushUpYgive=95;
PFont font; //this creates a font variable we can use to plug in a font

void setup()
{
  size(600, 680);
  lose = loadImage("Lose.png");
  backG = loadImage("Background.png");
  win = loadImage("win.png");
  enemy1 = loadImage("Enemy1.png");
  enemy2 = loadImage("Enemy2.png");
  enemy3 = loadImage("Enemy3.png");
  enemy4 = loadImage("Enemy4.png");
  player = loadImage("Toy.png");
  slideUp = loadImage("SlideUp.png");
  slideLeft = loadImage("SlideLeft.png");
  slideRight = loadImage("SlideRight.png");
  font = loadFont("Serif.plain-48.vlw"); //this plugs a serif font into our font variable, Thanks to Prof. Schrank
  textFont(font, 32); //this designates our font as THEE font any text will use, Thanks to Prof. Schrank
}

void draw()
{
  float currentTime = millis() / 1000.0;
  noStroke();
  image(backG,0,0);
  //
  //boom
  ////////////////////
  ///////Boom1////////
  ////////////////////
  if (boom1X>0||boom1Y>0)
  {
    if (boomTimer>0)
    {
      fill(200, 200, 0);
      ellipse(boom1X, boom1Y, boom1size, boom1size);
      boom1size--;
      boom1size--;
      boomTimer--;
    }
    if (boomTimer<1)
    {
      boom1X=-5;
      boom1Y=-5;
      boom1size=35;
      boomTimer=17;
    }
  }
  ////////////////////
  ///////Boom2////////
  ////////////////////
  if (boom2X>0||boom2Y>0)
  {
    if (boomTimer2>0)
    {
      fill(255, 255, 0);
      ellipse(boom2X, boom2Y, boom2size, boom2size);
      boom2size--;
      boom2size--;
      boomTimer2--;
    }
    if (boomTimer2<1)
    {
      boom2X=-5;
      boom2Y=-5;
      boom2size=35;
      boomTimer2=17;
    }
  }
  ////////////////////
  ///////Boom3////////
  ////////////////////
  if (boom3X>0||boom3Y>0)
  {
    if (boomTimer3>0)
    {
      fill(255, 255, 0);
      ellipse(boom3X, boom3Y, boom3size, boom3size);
      boom3size--;
      boom3size--;
      boomTimer3--;
    }
    if (boomTimer3<1)
    {
      boom3X=-5;
      boom3Y=-5;
      boom3size=35;
      boomTimer3=17;
    }
  }
  ////////////////////
  ///////Boom4////////
  ////////////////////
  if (boom4X>0||boom4Y>0)
  {
    if (boomTimer4>0)
    {
      fill(255, 255, 0);
      ellipse(boom4X, boom4Y, boom4size, boom4size);
      boom4size--;
      boom4size--;
      boomTimer4--;
    }
    if (boomTimer4<1)
    {
      boom4X=-5;
      boom4Y=-5;
      boom4size=35;
      boomTimer4=17;
    }
  }
  //
  ////////////////////////
  //normal movement
  if (noRush==0)
  {
    image(player, playerX-62, playerY-48);
    fill(255, 0, 0, 100);
    rect(playerX+19, playerY-645, 2, 600);
  }
  if (moveRight==1&&noRush==0)
  {
    playerX=playerX+7;
  }
  else if (moveLeft==1&&noRush==0)
  {
    playerX=playerX-7;
  }
  else if (keyPressed=false&&noRush==0)
  {
    playerX=playerX;
  }
  if (playerY<640&&noRush==0)
  {
    playerY=playerY+8;
  }
  if (playerY>640&&noRush==0)
  {
    playerY=640;
  }
  if (noRush==0);
  {
    if (makeLaser==1)
    {
      laserOn=1;
      laserX=playerX+16;
      laserY=playerY-645;
      laserTimer=11;
    }
    if (makeLaser==0)
    {
      laserOn=0;
      laserTimer--;
      fill(255, 127, 0);
      stroke(255, 187, 60);
      strokeWeight(2);
      rect(laserX, laserY, 8, 600);
    }
    if (laserTimer==0)
    {
      makeLaser=1;
    }
    if (laserTimer<0)
    {
      laserTimer=11;
      makeLaser=1;
    }
  }
  if (noRush!=0)
  {
    laserOn=1;
  }
  //
  //rush Left
  //
  if (rushLeft==0)
  {
    if (slideTimer<0)
    {
      slideTimer=11;
    }
    else if (slideTimer>0)
    {
      slideTimer--;
      image(slideLeft, playerX-88, playerY-70);
      playerX=playerX-22;
    }
    else if (slideTimer==0)
    {
      rushRight=1;
      rushUp=1;
      rushLeft=1;
      noRush=0;
      slideTimer=-1;
    }
  }
  //
  //rush right
  //
  if (rushRight==0)
  {
    if (slideTimer<0)
    {
      slideTimer=11;
    }
    else if (slideTimer>0)
    {
      slideTimer--;
      image(slideRight, playerX-88, playerY-70);
      playerX=playerX+22;
    }
    else if (slideTimer==0)
    {
      rushRight=1;
      rushUp=1;
      rushLeft=1;
      noRush=0;
      slideTimer=-1;
    }
  }
  //
  //rush Up
  //
  if (rushUp==0)
  {
    if (slideTimer<0)
    {
      slideTimer=11;
    }
    else if (slideTimer>0)
    {
      slideTimer--;
      image(slideUp, playerX-71, playerY-89);
      playerY=playerY-22;
    }
    else if (slideTimer==0)
    {
      rushRight=1;
      rushUp=1;
      rushLeft=1;
      noRush=0;
      slideTimer=-1;
    }
  }
  //
  //enemies
  //
  // // // // // // // enemy1// // // // // // //
  enemy1Y=enemy1Y+3;
  image(enemy1, enemy1X-17, enemy1Y-21);
  if (enemy1Y>680)
  {
    lives--;
    enemy1X=random(500);
    enemy1Y=-500+random(500);
  }
  // // // // // // // enemy2// // // // // // // 
  enemy2Y=enemy2Y+3;
  image(enemy2, enemy2X-17, enemy2Y-21);
  if (enemy2Y>680)
  {
    lives--;
    enemy2X=random(500);
    enemy2Y=-500+random(500);
  }
  // // // // // // // enemy3// // // // // // //
  enemy3Y=enemy3Y+4;
  image(enemy3, enemy3X-17, enemy3Y-21);
  if (enemy3Y>680)
  {
    lives--;
    enemy3X=random(500);
    enemy3Y=-500+random(500);
  }
  // // // // // // // enemy4// // // // // // //
  enemy4Y=enemy4Y+5;
  image(enemy4, enemy4X-17, enemy4Y-21);
  if (enemy4Y>680)
  {
    lives--;
    enemy4X=random(500);
    enemy4Y=-500+random(500);
  }
  //
  ////////////////////enemy1///////////////////////////
  //rushSide collision
  //
  if (playerX<enemy1X+enemyXgive+45 && playerX>enemy1X-enemyXgive-45) 
  {
    if (playerY<enemy1Y+10 && playerY>enemy1Y-10) 
    {
      if (noRush==1)
      {
        boom1X=enemy1X;
        boom1Y=enemy1Y;
        score=score+50;
        enemy1X=random(500); 
        enemy1Y=-500+random(500);
      }
    }
  }
  //
  //rushUp collision
  //
  if (playerX<enemy1X+enemyXgive+20 && playerX>enemy1X-enemyXgive-20) 
  {
    if (playerY<enemy1Y+enemyYgive+45 && playerY>enemy1Y-enemyYgive-45) 
    {
      if (noRush==1)
      {
        boom1X=enemy1X;
        boom1Y=enemy1Y;
        score=score+50;
        enemy1X=random(500); 
        enemy1Y=-500+random(500);
      }
    }
  }
  //  
  //Laser Collision
  //
  if (laserX<enemy1X+25 && laserX>enemy1X-25) 
  {
    if (laserOn==0)
    {
      boom1X=enemy1X;
      boom1Y=enemy1Y;
      score=score+40;
      enemy1X=random(500); 
      enemy1Y=-500+random(500);
    }
  }
  /////////////////////////////////////////////////////////
  ////////////////////enemy2///////////////////////////////
  /////////////////////////////////////////////////////////
  //
  //rushSide collision
  //
  if (playerX<enemy2X+enemyXgive+45 && playerX>enemy2X-enemyXgive-45) 
  {
    if (playerY<enemy2Y+10 && playerY>enemy2Y-10) 
    {
      if (noRush==1)
      {
        boom2X=enemy2X;
        boom2Y=enemy2Y;
        score=score+50;
        enemy2X=random(500); 
        enemy2Y=-500+random(500);
      }
    }
  }
  //
  //rushUp collision
  //
  if (playerX<enemy2X+enemyXgive+20 && playerX>enemy2X-enemyXgive-20) 
  {
    if (playerY<enemy2Y+enemyYgive+45 && playerY>enemy2Y-enemyYgive-45) 
    {
      if (noRush==1)
      {
        boom2X=enemy2X;
        boom2Y=enemy2Y;
        score=score+50;
        enemy2X=random(500); 
        enemy2Y=-500+random(500);
      }
    }
  }
  //  
  //Laser Collision
  //
  if (laserX<enemy2X+25 && laserX>enemy2X-25) 
  {
    if (laserOn==0)
    {
      boom2X=enemy2X;
      boom2Y=enemy2Y;
      score=score+40;
      enemy2X=random(500); 
      enemy2Y=-500+random(500);
    }
  }
  //
  /////////////////////////////////////////////////////////
  ////////////////////enemy3///////////////////////////////
  /////////////////////////////////////////////////////////
  //
  //rushSide collision
  //
  if (playerX<enemy3X+enemyXgive+45 && playerX>enemy3X-enemyXgive-45) 
  {
    if (playerY<enemy3Y+10 && playerY>enemy3Y-10) 
    {
      if (noRush==1)
      {
        boom3X=enemy3X;
        score=score+50;
        boom3Y=enemy3Y;
        enemy3X=random(500); 
        enemy3Y=-500+random(500);
      }
    }
  }
  //
  //rushUp collision
  //
  if (playerX<enemy3X+enemyXgive+20 && playerX>enemy3X-enemyXgive-20) 
  {
    if (playerY<enemy3Y+enemyYgive+45 && playerY>enemy3Y-enemyYgive-45) 
    {
      if (noRush==1)
      {
        boom3X=enemy3X;
        boom3Y=enemy3Y;
        score=score+50;
        enemy3X=random(500); 
        enemy3Y=-500+random(500);
      }
    }
  }
  //  
  //Laser Collision
  //
  if (laserX<enemy3X+25 && laserX>enemy3X-25) 
  {
    if (laserOn==0)
    {
      boom3X=enemy3X;
      boom3Y=enemy3Y;
      score=score+40;
      enemy3X=random(500); 
      enemy3Y=-500+random(500);
    }
  }
  //
  /////////////////////////////////////////////////////////
  ////////////////////enemy4///////////////////////////////
  /////////////////////////////////////////////////////////
  //
  //rushSide collision
  //
  if (playerX<enemy4X+enemyXgive+45 && playerX>enemy4X-enemyXgive-45) 
  {
    if (playerY<enemy4Y+10 && playerY>enemy4Y-10) 
    {
      if (noRush==1)
      {
        boom4X=enemy4X;
        boom4Y=enemy4Y;
        score=score+50;
        enemy4X=random(500); 
        enemy4Y=-500+random(500);
      }
    }
  }
  //
  //rushUp collision
  //
  if (playerX<enemy4X+enemyXgive+20 && playerX>enemy4X-enemyXgive-20) 
  {
    if (playerY<enemy4Y+enemyYgive+45 && playerY>enemy4Y-enemyYgive-45) 
    {
      if (noRush==1)
      {
        boom4X=enemy4X;
        boom4Y=enemy4Y;
        score=score+50;
        enemy4X=random(500); 
        enemy4Y=-500+random(500);
      }
    }
  }
  //  
  //Laser Collision
  //
  if (laserX<enemy4X+25 && laserX>enemy4X-25) 
  {
    if (laserOn==0)
    {
      boom4X=enemy4X;
      boom4Y=enemy4Y;
      score=score+40;
      enemy4X=random(500); 
      enemy4Y=-500+random(500);
    }
  }
  //
  /////////////////////////////////////////////////////////
  //drawScore
  //
  fill(30, 30, 255);
  stroke(0);
  rect(0, 0, 600, 150);
  fill(0);
  scale(.8);
  text("Destroy The Zombies to Win!          Time:"+((currentTime-20)*-1), 80, 50); //Thanks to Prof. Schrank
  text("If 4 pass, you lose, humans win! You have 20 seconds", 20, 110); //Thanks to Prof. Schrank
  text("Number Passed: "+lives, 10, 170); //Thanks to Prof. Schrank
  text("Score: "+score, 480, 170); //Thanks to Prof. Schrank
  
  noStroke();
  scale(1.25);
  if(lives<1 && currentTime<20)
  {
    lost=1;
    image(lose,0,0);
    fill(0);
    text("You have lost. The zombies were cured.",50,50); 
    text("The humans will destroy you...",85,120);
    fill(255);
    text("Score: "+score,250,650);
  }
  if(currentTime>=20 && lost==0)
  {
    image(win,0,0);
    fill(255);
    text("You have win. The zombies remain.",65,40); 
    text("The humans will be destroyed...",85,90);
    text("Score: "+score,250,650);
  }
  //
}
void keyPressed() 
{ 
  if (key == 'a')
  {
    moveLeft=1;
    moveRight=0;
  }
  if (key == 'd')
  {
    moveRight=1;
    moveLeft=0;
  }
  if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {
      noRush=1;
      rushLeft=0;
    }
  }
  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
    {
      noRush=1;
      rushRight=0;
    }
  }
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      noRush=1;
      rushUp=0;
    }
  }
  if (key=='w')
  {
    if (noRush==0&&makeLaser==1)
    {
      makeLaser=0;
    }
  }
}
void keyReleased() 
{
  if (key == 'a') 
  {
    moveLeft=0;
  } 
  if (key == 'd')
  {
    moveRight=0;
  }
}


