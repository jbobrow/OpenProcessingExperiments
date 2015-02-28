
//FINAL PROJECT, PROGRAMMING FALL 2013
//"HIBERNATION" LISA JAECH

//notes/glitches:
//1.unsuccessfully tried to loop background audio --
//also had to remove all audio recently due to an update/minim library conflict
//2.originally planned for the berries to temporarily decrease 
//speed of enemies, could not get enemies to speed up again (tried
//both time and score as triggers for this)
//3.sometimes enemies appear on top of player despite some code I
//wrote to try to fix that, also acorns appear on twigs, etc.
//I found that when I tried to block that from happening items/enemies
//would start "jumping" all over the screen
//4.squirrel can get "stuck" on log--
//could fix this by tweaking physics so squirrel bounces off log
//5. if player gathers berries they do not respawn after game over
//6. Raven sometimes disappears for a while shortly after it spawns
//7. Timer doesn't stop while game is paused




float x, y, velocityX, velocityY, gravity, frictionY, frictionX;
//squirrel variables ^
int score;
int acorns;
int berries;
float x2 = random(10, 780);
float y2 =random(10, 580);//acorn, adds 1 point to score
float boostX;
float boostY;
float boostX2;
float boostY2;
float boostX3;
float boostY3;
float boostX4;
float boostY4; //berries, add 5 points to score

float twigX;
float twigY;
float twigX2;
float twigY2;
float twigX3;
float twigY3;
float twigX4;
float twigY4; //twigs, are obstacles

float mode;

PImage forest;
PImage forest2;
PImage squirrel;
PImage owl;
PImage acorn;
PImage raven;
PImage hawk;
PImage eagle;
PImage snowy;
PImage condor;
PImage boost;
PImage halo;
PImage twig;
PImage squirrelflap;
PImage squirrelflip;
PImage squirrelflapflip;
PImage hawkflip;
PImage ravenflip;
PImage eagleflip;
PImage vultureflip;
PImage title;
float startTime = 0;
float timer = 0;
float seconds = 0;

Player player1;
Enemy enemy1;

void setup() {
  imageMode(CENTER);
  size(800, 600);

  forest = loadImage("forest1.png");
  forest2 = loadImage("forest2.png");
  owl = loadImage("barnowl.png");
  squirrel = loadImage("squirrel.png");
  acorn = loadImage("acorn1.png");
  raven = loadImage("raven.png");
  hawk = loadImage("hawk.png");
  eagle = loadImage("eagle.png");
  snowy = loadImage("snowy.png");
  condor = loadImage("vulture.png");
  boost = loadImage("boost.png");
  halo = loadImage("halo.png");
  twig = loadImage("twig.png");
  squirrelflap = loadImage("squirrelflap.png");
  squirrelflip = loadImage("squirrelflip.png");
  squirrelflapflip = loadImage("squirrelflapflip.png");
  hawkflip = loadImage("hawkflip.png");
  ravenflip = loadImage("ravenflip.png");
  eagleflip = loadImage("eagleflip.png");
  vultureflip = loadImage("vultureflip.png");
  title = loadImage("title.png");
  mode = 0;

  score= 0;
  boostX= random(10, 780);
  boostY=random(10, 580);
  boostX2= random(10, 780);
  boostY2=random(10, 580);
  boostX3= random(10, 780);
  boostY3=random(10, 580);
  boostX4= random(10, 780);
  boostY4=random(10, 580);
  twigX = random(100, 700);
  twigY = random(100, 500);
  twigX2 = random(300, 700);
  twigY2 = random(200, 500);
  twigX3 = random(100, 300);
  twigY3 = random(100, 200);
  twigX4 = random(100, 300);
  twigY4 = random(200, 500);

  player1 = new Player(); //squirrel object class
  enemy1 = new Enemy(); //birds object class


}

void draw() {
  if (mode==0) {
    startscreen();
  }
  if (mode==1) {
    gameplay();
  }
  if (mode==2) {
    gameover();
  }
  if (mode==3) {
    pausescreen();
  }
}



void gameover() {

  tint(255, 0, 0); //red background
  image(forest, 400, 300);
  fill(0);
  rect(294, 250, 220, 105);
  noFill();
  stroke(255);
  rect(370, 322, 59, 26);
  noStroke();
  fill(255);
  textSize(26);
  text("GAME OVER", 330, 280);
  textSize(16);
  text("again?", 375, 340);
  text("score:", 370, 300);
  text(score, 425, 300);
  if (mousePressed && mouseX>370 && mouseX<430 && mouseY>322 && mouseY<346) {
    mode = 0;
  }
}

void gameplay() {


  noTint();
  image(forest, 400, 300);
  player1.move();
  player1.display();
  enemy1.move();
  enemy1.display();

  //start score and timer
  timer = millis()/1000;
  seconds= timer - startTime;
  score = acorns + berries;
  fill(0);
  rect(540, 7, 100, 20);
  fill(255);
  textSize(12);
  text("score:", 550, 20);
  text(score, 600, 20); 
  fill(0);
  rect(8, 7, 100, 20);
  fill(255);
  text("time:", 10, 20);
  text(seconds, 40, 20);
  text("spacebar to pause", 100, 20);
  fill(255, 255, 0);
  //end score and timer

  image(acorn, x2, y2); //acorn image placement

  //start twig display
  if (acorns>=4) {
    image(twig, twigX, twigY);
  }
  if (acorns>=6) {
    image(twig, twigX2, twigY2);
  }
  if (acorns>=8) {
    image(twig, twigX3, twigY3);
  }
  if (acorns>=10) {
    image(twig, twigX4, twigY4);
  }
  if (dist(twigX, twigY, x2, y2)<10) {
    twigX = random(100, 700);
    twigY = random(100, 500);
  }
  if (dist(twigX2, twigY2, x2, y2)<10) {
    twigX = random(300, 700);
    twigY = random(200, 500);
  }
  if (dist(twigX3, twigY3, x2, y2)<10) {
    twigX = random(100, 300);
    twigY = random(100, 200);
  }
  if (dist(twigX4, twigY4, x2, y2)<10) {
    twigX = random(100, 300);
    twigY = random(200, 500);
  }
  //end twig display

  //start boost display
  if (acorns>4 && acorns<6) {
    image(boost, boostX, boostY);
  }
  if (acorns>7 && acorns<9) {
    image(boost, boostX2, boostY2);
  }
  if (acorns>10 && acorns<12) {
    image(boost, boostX3, boostY3);
  }
  if (acorns>13&& acorns<15) {
    image(boost, boostX4, boostY4);
  }
  if (dist(boostX, boostY, x2, y2)<10) {
    boostX=random(10, 780);
    boostY=random(10, 580);
  }
  if (dist(boostX2, boostY2, x2, y2)<10) {
    boostX=random(10, 780);
    boostY=random(10, 580);
  }
  if (dist(boostX3, boostY3, x2, y2)<10) {
    boostX=random(10, 780);
    boostY=random(10, 580);
  }
  if (dist(boostX4, boostY4, x2, y2)<10) {
    boostX=random(10, 780);
    boostY=random(10, 580);
  }
  //end boost display
  //(player can only get boost if they get it before the next acorn
}
//squirrel class
class Player { 
  float x, y, velocityX, velocityY, gravity, frictionY, frictionX;
  Player() {
    x = 400; //starting position
    y = 300;
    velocityX = 0; //speed
    velocityY = 0;
    gravity = .04; //acceleration downwards
    frictionX = .987; //slows down each frame
    frictionY = -0.3; //flips in other direction when hitting ground
  }
  void display() {
    //start conditionals for flipping images/animating squirrel flap
    if (velocityX>=.7) {
      image(squirrelflap, x, y);
    }
    else if (velocityX < .7 && velocityX>=0) {
      image(squirrel, x, y);
    }
    else if (velocityX<0 && velocityX>=-.7) {
      image(squirrelflip, x, y);
    }
    else if (velocityX<-.7) {
      image(squirrelflapflip, x, y);
    }
  }
  //start gameover conditionals
  void move() { 
    if (dist(x, y, enemy1.badX, enemy1.badY)<70 && acorns>=1) {
      mode = 2;
 
    }
    if (dist(x, y, enemy1.badX2, enemy1.badY2)<70 && acorns >=3) {
      mode = 2;
    
    }
    if (dist(x, y, enemy1.badX3, enemy1.badY3)<70 && acorns>=6) {
      mode = 2;
    
    }
    if (dist(x, y, enemy1.badX4, enemy1.badY4)<70 && acorns>= 9) {
      mode = 2;
      
    }
    if (dist(x, y, enemy1.badX5, enemy1.badY5)<70 && acorns>= 12) {
      mode = 2;
     
    }
    if (dist(x, y, enemy1.badX6, enemy1.badY6)<70 && acorns>= 15) {
      mode = 2;
     
    }
    //end game over conditionals

    if (dist(x, y, x2, y2)<40) {
      acorns++; //add to score
      x2 = random(10, 780); //acorn position
      y2 = random(10, 580); //acorn position
   
    }
    //don't let enemies appear on top of squirrel:
    if (dist(enemy1.badX, x, enemy1.badY, y)<10 && acorns==1) { 
      enemy1.badX = random(10, 780);
      enemy1.badY = random(10, 580);
    }
    if (dist(enemy1.badX2, x, enemy1.badY2, y)<10 &&acorns==3) { 
      enemy1.badX2 = random(10, 780);
      enemy1.badY2 = random(10, 580);
    }
    if (dist(enemy1.badX3, x, enemy1.badY3, y)<10 &&acorns==6) { 
      enemy1.badX3 = random(10, 780);
      enemy1.badY3 = random(10, 580);
    }
    if (dist(enemy1.badX4, x, enemy1.badY4, y)<10 &&acorns==9) { 
      enemy1.badX4 = random(10, 780);
      enemy1.badY4 = random(10, 580);
    }
    if (dist(enemy1.badX5, x, enemy1.badY5, y)<10&&acorns==12) { 
      enemy1.badX5 = random(10, 780);
      enemy1.badY5 = random(10, 580);
    }
    if (dist(enemy1.badX6, x, enemy1.badY6, y)<10&&acorns==15) { 
      enemy1.badX6 = random(10, 780);
      enemy1.badY6 = random(10, 580);
    }
    velocityY += gravity; //squirrel physics start
    velocityX *= frictionX;
    x+= velocityX;
    y+= velocityY;
    if (y>height) {
      y=height;
      velocityY*= frictionY;
    }
    if (x > width) {
      velocityX*= -1;
    }
    if (x <0) {
      x=0;
      velocityX*=  velocityX/10;
    }
    if (y < 0) {
      y=0;
      velocityY*= velocityY/14;
    }
    //squirrel physics end
    //twig physics start
    if (dist(x, y, twigX, twigY)<80 && velocityX>0&& acorns>=4) {
      velocityX*=-1;
    }
    if (dist(x, y, twigX, twigY)<80 &&velocityX<0 &&acorns>=4) {
      velocityX*=  velocityX/10;
    }
    if (dist(x, y, twigX, twigY)<60 &&gravity<0 &&acorns>=4) {
      velocityY*= -1;
    }
    if (dist(x, y, twigX, twigY)<60 && gravity>0 &&acorns>=4) {

      velocityY*= frictionY;
    }
    if (dist(x, y, twigX2, twigY2)<80 && velocityX>0&& acorns>=6) {
      velocityX*=-1;
    }
    if (dist(x, y, twigX2, twigY2)<80 &&velocityX<0 &&acorns>=6) {
      velocityX*=  velocityX/10;
    }
    if (dist(x, y, twigX2, twigY2)<60 &&gravity<0 &&acorns>=6) {
      velocityY*= -1;
    }
    if (dist(x, y, twigX2, twigY2)<60 && gravity>0 &&acorns>=6) {

      velocityY*= frictionY;
    }
    if (dist(x, y, twigX3, twigY3)<80 && velocityX>0&& acorns>=8) {
      velocityX*=-1;
    }
    if (dist(x, y, twigX3, twigY3)<80 &&velocityX<0 &&acorns>=8) {
      velocityX*=  velocityX/10;
    }
    if (dist(x, y, twigX3, twigY3)<60 &&gravity<0 &&acorns>=8) {
      velocityY*= -1;
    }
    if (dist(x, y, twigX3, twigY3)<60 && gravity>0 &&acorns>=8) {

      velocityY*= frictionY;
    }
    if (dist(x, y, twigX4, twigY4)<80 && velocityX>0&& acorns>=10) {
      velocityX*=-1;
    }
    if (dist(x, y, twigX4, twigY4)<80 &&velocityX<0 &&acorns>=10) {
      velocityX*=  velocityX/10;
    }
    if (dist(x, y, twigX4, twigY4)<60 &&gravity<0 &&acorns>=10) {
      velocityY*= -1;
    }
    if (dist(x, y, twigX4, twigY4)<60 && gravity>0 &&acorns>=10) {

      velocityY*= frictionY;
    }
    //twig physics end
    //start boost physics

    if (dist(x, y, boostX, boostY)<20 && acorns>4 && acorns<6) {
      boostX=-10;
      boostY=-10;
      berries+= 5;
    
    }
    if (dist(x, y, boostX2, boostY2)<20 && acorns>7 && acorns<9) {
      boostX2=-10;
      boostY2=-10;
      berries+= 5;
    
    }
    if (dist(x, y, boostX3, boostY3)<20 && acorns>10 && acorns<12) {
      boostX3=-10;
      boostY3=-10;
      berries+=5;
     
    }
    if (dist(x, y, boostX4, boostY4)<20 && acorns>13 && acorns<15) {
      boostX4=-10;
      boostY4=-10;
      berries+=5;
   
    }


    //end boost physics
  }
}

//start arrow keys and spacebar for pause
void keyPressed() { //loop get called when a key is pressed
  if (key==CODED) {
    if (keyCode==UP) {
      player1.velocityY-=1;
    }
  }
  if (key==CODED) {
    if (keyCode==LEFT) {
      player1.velocityX-=1;
    }
  }
  if (key==CODED) {
    if (keyCode==RIGHT) {
      player1.velocityX+=1;
    }
  }
  if (key== ' ' && mode == 1) {
    mode = 3;
  }
  else if (key == ' ' && mode ==3) {
    mode = 1;
  }
}
//end arrow keys and spacebar
//birds class
class Enemy {
  float badX = random(10, 780); // owl
  float badY = random(10, 580);
  float badX2 = random(10, 780); // hawk
  float badY2 = random(10, 580);
  float badX3 = random(10, 780); // raven
  float badY3 = random(10, 580);
  float badX4 = random(10, 780); // eagle
  float badY4 = random(10, 580);
  float badX5 = random(10, 780); // snowy
  float badY5 = random(10, 580);
  float badX6 = random(10, 780); // condor
  float badY6 = random(10, 580);
  float badspeedX2;
  float badspeedY2;
  float badspeedX3;
  float badspeedY3;
  float badspeedX4;
  float badspeedY4;
  float badspeedX6;
  float badspeedY6;
  float angleowl=0;
  float xradiusowl=200;
  float yradiusowl=200;
  float anglesnowy=0;
  float xradiussnowy=250;
  float yradiussnowy=300;

  Enemy() { 
    badspeedX2 = 1.3;
    badspeedY2 = 1.3;
    badspeedX3 = .9;
    badspeedY3 = .9;
    badspeedX4 = 1.2;
    badspeedY4 = 1.2;
    badspeedX6 = 1.5;
    badspeedY6 = 1.5;
  }
  //conditionals for adding enemies
  void display() {
    if (acorns>= 1) {
      image(owl, badX, badY);
    }

    if (acorns>= 12) {
      image(snowy, badX5, badY5);
    }
    if (badspeedX2>0 && acorns>=3) {
      image(hawk, badX2, badY2);
    }
    else if (badspeedX2<0 && acorns>=3) {
      image(hawkflip, badX2, badY2);
    }
    if (badspeedX3>0 &&score >=6) {
      image(ravenflip, badX3, badY3);
    }
    else if (badspeedX3<0 &&acorns >=6) {
      image(raven, badX3, badY3);
    }
    if (badspeedX4>0 &&acorns>=9) {
      image(eagleflip, badX4, badY4);
    }
    else if (badspeedX4<0 &&acorns>=9) {
      image(eagle, badX4, badY4);
    }
    if (badspeedX6>0&&acorns>=15) {
      image(vultureflip, badX6, badY6);
    }
    else if (badspeedX6<0&&acorns>=15) {
      image(condor, badX6, badY6);
    }
    //end animation conditionals
  }
  void move() {
    //start physics engine for enemies
    angleowl+=.5;
    badX = xradiusowl *cos(radians(angleowl)) + 400;
    badY = yradiusowl *sin(radians(angleowl)) + 300;
    anglesnowy+=.6;
    badX5 = xradiussnowy *cos(radians(anglesnowy)) + 400;
    badY5 = yradiussnowy *sin(radians(anglesnowy)) +300;
    badX3 += badspeedX3;
    badY3 += badspeedY3;
    badX4 += badspeedX4;
    badY4 += badspeedY4;
    badX2 += badspeedX2;
    badY2 += badspeedY2;
    badX6 += badspeedX6;
    badY6 += badspeedY6;



    if (badX2 > width) {
      badspeedX2*= -1;
    }
    if (badX2 <0) {
      badspeedX2= 1.3;
    }
    if (badY2 > height) {
      badspeedY2*= -1;
    }
    if (badY2 < 0) {
      badspeedY2 = 1.3;
    }

    if (badX3 > width) {
      badspeedX3*= -1;
    }
    if (badX3 <0) {
      badspeedX3 = .9;
    }
    if (badY3 > height) {
      badspeedY3*= -1;
    }
    if (badY3 < 0) {
      badspeedY3 = .9;
    }

    if (badX4 > width) {
      badspeedX4*= -1;
    }
    if (badX4 <0) {
      badspeedX4 = 1.2;
    }
    if (badY4 > height) {
      badspeedY4*= -1;
    }
    if (badY4 < 0) {
      badspeedY4 = 1.2;
    }

    if (badX6 > width) {
      badspeedX6*= -1;
    }
    if (badX6 <0) {
      badspeedX6 = 1.5;
    }
    if (badY6 > height) {
      badspeedY6*= -1;
    }
    if (badY6 < 0) {
      badspeedY6 = 1.5;
    }
    //end physics engine for enemies
  }
}


void pausescreen() {
  noTint();
  size(800, 600);
  image(forest2, 400, 300);
  fill(0);
  rect(540, 7, 100, 20);
  fill(255);
  textSize(12);
  text("score:", 550, 20);
  text(score, 600, 20);
  textSize(20);
  fill(255);
  text("SPACEBAR TO RESUME", 300, 300);
}

void startscreen() {

  score = 0;
  acorns = 0;
  berries = 0;
  x = 400; //reset squirrel position
  y = 300;

  noTint();
  size(800, 600);
  image(forest2, 400, 300);
  image(title, 400, 300);
  fill(0);
  rect(240, 370, 307, 125);
  noFill();
  stroke(255);
  rect(338, 447, 90, 30);
  noStroke();
  fill(255);
  textSize(22);
  text("START", 350, 470);
  textSize(14);
  text("move with RIGHT, LEFT, & UP arrow keys", 255, 400);
  text("gather the acorns", 320, 420);
  text("avoid the birds", 330, 440);
  text("by Lisa Jaech", 680,580);

  if (mousePressed && mouseX>240 && mouseX<547 && mouseY>365 && mouseY<495) {
    mode = 1;
    startTime = millis()/1000;
  }
}





