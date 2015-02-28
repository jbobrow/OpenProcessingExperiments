
// Anti-EB Games
// PRESENTS:
// Cook or.. GET FIRED
// Alton Luu   - Programmer
// Andrew Wong - Artist
// Jimmy Yeung - Project Manager

//            _  _____         _         ___   ___
//\    / /\  |__\  |     /\   |  ) |    |     /   
// \  / /__\ |\    |    /__\  |-   |    |---  \__
//  \/ /    \| \ __|__ /    \ |_ ) |___ |___  ___/
boolean wPressed, aPressed, sPressed, dPressed;
Enemy[] b;
Waiter[] a;

tables[] c,d,e,f;
float waiterx=400;
float waitery=800;
//float 
float rectX = 0;
float rectY = 123;
float rectWidth = 280; 
float rectHeight = 15;
float v = 3;
float r = 60;

// GAMESCREENS FOR THE QUESTIONS IN ROUND 1
boolean introscreen = true; 
boolean gamescreen = true;
boolean gamescreen1 = true; // Q1
boolean gamescreen2 = true; // Q2
boolean gamescreen3 = true; // Q3
boolean wrong1 = true; // if you get questions wrong.. question 1
boolean wrong2 = true; // if you get questions wrong.. question 2
boolean wrong3 = true; // if you get questions wrong.. question 3
boolean win = true; // THE SCREEN RIGHT BEFORE THE WAITER GAME
// GAMESCREENS FOR THE QUESTIONS
PFont font; //GAMESCREEN QUESTION'S FONT
boolean playscreen = true; // GAMESCREEN FOR WAITER GAME
int points = 0; //***VERY IMPORTANT, THS SCORE FOR THE ENTIRE GAME
int money = 0;  //***THIS IS PLACED WITHIN EVERY QUESTION TO KEEP
                //***ADDING THE SCORE AFTER EVERY CORRECT Q THEY GET

boolean upgrades = true;
// GAMESCREENS FOR THE QUESTIONS IN ROUND 2
boolean gamescreena = true; // round 2 questions
boolean round2 = true;
boolean round2a = true;
boolean round2b = true;
boolean round2c = true;
boolean win2 = true;
boolean playscreen2 = true;
boolean wrong2x = true;
boolean wrong2a = true;
boolean wrong2b = true;
boolean gamescreena2 = true;
boolean upgrade2 = true;
boolean failscreen = true;

int bootsofspeed = 1;
int panknife = 1;
int burger = 1;
int burger2 = 1;
int dish = 1;
int dish2 = 1;
int bootsofspeed1 = 0;
int panknife1 = 0;
int burger1 = 0;
int burger21 = 0;
int dish1 = 0;
int dish21 = 0;

PImage sprite;
PImage sprite1;
PImage sprite2;
PImage sprite3;
PImage sprite4;
PImage introBG;
PImage cookingBG;
PImage background1; // CookingRules2copy.png in data folder
PImage background2; // CookingPlaceBETA.png in data folder
PImage titlescreen;
PImage upgradescreen;
PImage score;
PImage incorrect;
PImage burgerz;
PImage Seconds;
PImage Desserts;
PImage map1;
PImage map2;
PImage map3;
PImage map4;
PImage map5;
PImage map6;
PImage map7;
PImage map8;
PImage FAIL;

int aa, bb, cc, dd, ee, ff, c2, d2, x1, x2, y1, y2, aaa, bbb, ccc;
int asdf1, asdf2;

int release = 0;
//           _   _____  _      ____   _____ _______         _
//  \    / /   \   |   |  \   /      |         |    |    | |  \
//   \  / |    |   |   |  |   \___   |-----    |    |    | |__/
//    \/   \__/  __|__ |_/    ____/  |_____    |     \__/  |
void setup()
{
  ellipseMode(RADIUS);
  size(800,600);
  smooth();
  noStroke();
  
  aa = 588; bb = 485; cc = 600; dd = 375; ee = 583; ff = 288; c2 = 230; d2 = 350;
  x1 = 600; x2 = 200;  y1 = 580; y2 = 195;  aaa = 479; bbb = 525; ccc = 571;
  asdf1 =150;asdf2 =225;

  
  font = loadFont("TimesNewRomanPSMT-25.vlw"); //question's font
  textFont(font);
  map1 = loadImage("Map1.png");
  imageMode(CENTER);
  map2 = loadImage("Map2.png");
  imageMode(CENTER);
  map5 = loadImage("Map5.png");
  imageMode(CENTER);
  FAIL = loadImage("SadCook copy.png");
  imageMode(CENTER);
  sprite = loadImage("CookWaiterSpriteUp2.png");
  imageMode(CENTER);
  sprite1 = loadImage("CookWaiterSpriteUp2.png");
  imageMode(CENTER);
  sprite2 = loadImage("CookWaiterSpriteDown2.png");
  imageMode(CENTER);
  sprite3 = loadImage("CookWaiterSpriteLeft2.png");
  imageMode(CENTER);
  sprite4 = loadImage("CookWaiterSpriteRight2.png");
  imageMode(CENTER);
  
  background1 = loadImage("Cooking Place10Burgers.png");
  imageMode(CENTER);
  background2 = loadImage("CookingRulesKEYS.png");
  imageMode(CENTER);
  
  upgradescreen = loadImage("ShopOrGetFiredWith$.png");
  imageMode(CENTER);
  
  score = loadImage("Score.png");
  imageMode(CENTER);
  
  incorrect = loadImage("AngryCook.png");
  imageMode(CENTER);
  
  burgerz = loadImage("Burger.png");
  imageMode(CENTER);
  
  Seconds = loadImage("ReadyForSeconds.png");
  imageMode(CENTER);
  
  Desserts = loadImage("ReadyForDessert copy.png");
  imageMode(CENTER);
  
  a = new Waiter[1];
  for(int i=0; i<a.length; i++)
  {
    a[i] = new Waiter();
    a[i].r = 30;
    //a[i].v = 3;
    a[i].rgbred = (int)random(0,255);
    a[i].rgbgreen = (int)random(0,255);
    a[i].rgbblue = (int)random(0,255);
    a[i].opacity = 50;
  }
    b = new Enemy[10];
    for(int i=0; i<b.length; i++)
  {
    b[i] = new Enemy();
    b[i].Enemyx = 0;
    b[i].Enemyy = random(1,800);
    b[i].rb = 25;
    b[i].vb = 10;
  }
 /* c = new tables[1];
  for(int i=0; i<c.length; i++)
  {
    c[i] = new tables();
    c[i].rectX = 0;
    c[i].rectY = 123;
    c[i].rectWidth = 280; 
    c[i].rectHeight = 15;
  }*/
  /*c = new tables[1];
  for(int h=0; h<c.length; h++)
  {
    c[h] = new tables();
    c[h].tablesx = 253;
    c[h].tablesy = 40;
    c[h].tablesy1 = 105; 
    c[h].tablesy2 = 190;
    c[h].tablesy3 = 265; 
    c[h].r = 75;
  }*/
}
//          _   _______   _           _      _                     _______________________________________________________
// \    / /   \    |     |  \        |  \   | _|  /\  \    /\    /_____________________________________________________
//  \  / |    |    |     |   |       |   |  |\   /__\  \  /  \  /___________________________________________________
//   \/   \__/  ___|___  |_ /        |_ /   | \ /    \  \/    \/_________________________________________________
void draw()
{
   if (introscreen == true)                   // 
  {                                              //
    introBG = loadImage("CookTitle KandP.png");  //
                                                 //
    background(introBG);                         //
                                                 //
    imageMode(CENTER);                           //
    if (mousePressed)                            //
    {                                            //
      gamescreen = false;
      introscreen = false;                       //
    }                                            //
  //if( overRect(400,400,40,75) == true ) gamescreen = false;
  }
  if (gamescreen == false)
{
  background(background1);
  if( overRect(y1,y2, 67,73) == true ) { y1 = -100; y2 = -100;points += 20; gamescreen = true; gamescreen1 = false;}
  if( overRect(ee,ff, 67,75) == true )  {y1 = -100; y2 = -100; gamescreen = true;wrong1 = false;}
  if( overRect(cc,dd, 40,100) == true ) {y2 = -100; y2 = -100; gamescreen = true;wrong1 = false;}
  if( overRect(aa,bb, 67,73) == true ) {y2 = -100; y2 = -100; gamescreen = true;wrong1 = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("$"+points, 120,45);
  text("5x = 20", 400,250);
  text("x = ?", 420,280);
  text("x = "+4, 650,250);
  text("x = "+3, 650,350);
  text("x = "+2, 660,450);
  text("x = "+1, 660,530);
}
  if (wrong1 == false) // burger deductions only happen during this screen
  {
    background(incorrect);
    fill(0);
    ccc = -1000;
    text("$"+points, 120,45);
    text("5x = 20      divide both", 287,120);
    text("x = 20/5   sides by 5", 300,150);
    text("x = 4", 300,180);
    text("Continue", 360,250);
    if( overRect(300,220, 220,40) == true ) gamescreen1 = false;
  }
  if (gamescreen1 == false)
  {
  background(background1);
  if( overRect(ee,ff, 67,75) == true ) {aa = -100; bb = -100; gamescreen1 = true;wrong2 = false;}
  if( overRect(cc,dd, 40,100) == true ) {aa = -100; bb = -100; gamescreen1 = true;wrong2 = false;}
  if( overRect(aa,bb, 67,73) == true ) {aa = -100; bb = -100; points += 20; gamescreen1 = true; gamescreen2 = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("x - 1 = 0", 400,250);
  text("x = ?", 420,280);
  text("$"+points, 120,45);
  text("x = "+3, 650,350);
  text("x = "+2, 660,450);
  text("x = "+1, 660,530);
  }
  if (wrong2 == false) // burger deductions only happen during this screen
  {
    background(incorrect);
    fill(0);
    if (ccc==-1000)
    {
      bbb=-125;
    }
    else 
    {
      ccc= -999;
    }
    text("$"+points, 120,45);
    text("x - 1 = 0  Add 1 on both sides", 287,120);
    text("x = 1", 300,150);
    text("Continue", 360,250);
    if( overRect(300,220, 220,40) == true ) gamescreen2 = false;
  }
  if (gamescreen2 == false)
  {
  background(background1);
  if( overRect(ee,ff, 67,75) == true ) {dd = -100; gamescreen2 = true;wrong3 = false;}
  if( overRect(cc,dd, 40,100) == true ) {dd = -100;points += 20; gamescreen2 = true; gamescreen3 = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("$"+points, 120,45);
  text("2x - 4 = 0", 400,250);
  text("x = ?", 420,280);
  text("x = "+3, 650,350);
  text("x = "+2, 660,450);
  }
  if (wrong3 == false)
  {
    background(incorrect);
    fill(0);
    if (ccc<-950)
    {
      bbb=-100;
    }
    else 
    {
      ccc= -101;
    }
    if (bbb < 0)
    {
      aaa =-100;
    }
      if (aaa<0)
  {
    failscreen = false;
  }
    text("$"+points, 120,45);
    text("2x - 4 = 0  Add 4 on both sides", 287,150);
    text("2x = 4", 300,180);
    text("Continue", 360,250);
    if( overRect(300,220, 220,40) == true ) gamescreen3 = false;
  }
  if (failscreen == false)
  {
    background(FAIL);
  }
  if (gamescreen3 == false)
  {
  background(background1);
  if( overRect(ee,ff, 67,75) == true ) {ee = -350; ff = -350; points += 20; gamescreen3 = true; win = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("2x = 6", 400,250);
  text("x = ?", 420,280);
  text("$"+points, 120,45);
  text("x = "+3, 650,350);
  }
  if (win == false)
  {
    background(background2);
    if( overRect(635,443, 148,100) == true ) playscreen = false;
    fill(0);
    text("Cash:$"+points, 1,22);
    
  }
  if (playscreen == false)
  {
  background(map1);
  image(sprite, waiterx,waitery);
  //image(sprite2, waiterx-20,waitery);
  //image(sprite3, waiterx,waitery-20);
  //image(sprite4, waiterx,waitery+20);
  text("Cash:$"+points, 1,22);
  fill(255,255,255,0);
  //rect(700,0,100,100);
  ellipse (710,130,138,138);
    if (rectCircleIntersect(rectX, rectY, rectWidth, rectHeight, waiterx, waitery, r) == true) 
  { 
    fill(0);
   v = v*(-1); 
  }  
  else { 
    fill(255,0,255,75); 

  }
     rect(rectX, rectY, rectWidth, rectHeight);
     
    /*for(int i=0; i<c.length; i++)
      {
        c[i].move();
      }*/
  
for(int i=0; i<a.length; i++)
      {
        a[i].move();
        a[i].show();
        //b[i].move();
        //b[i].show();
      }
   for(int i=0; i<b.length; i++)
  {
    b[i].show();
    b[i].move();
        if (waiterx > x1 && waitery < x2)
    {
      x1 = 900;
      x2 = -100;
      points +=10;
      money = points + money;
      introscreen = false; 
      gamescreen = true;
      gamescreen1 = true; // Q1
      gamescreen2 = true; // Q2
      gamescreen3 = true; // Q3
      gamescreena = true; // round 2 questions
      gamescreena = false;
    }
    /*for(int h=0; h<c.length; h++)
    {
      c[h].show();
    }*/

  }

for(int i=0; i<b.length; i++)
  {
    checkCollision(b[i]);
  }
  }
      if (gamescreena == false)
  {
    background(Seconds);
    fill(0);
    text("Cash:$"+money, 10,20);
    //if( overRect(350,360, 220,40) == true ) upgrades = false;
    if (mousePressed) {upgrades = false;}
  }
    if (upgrades == false)
  {
    background(upgradescreen);
    //println("change");
    if( Rect(175,170, 40,45) == true ) bootsofspeed -= 1; money += 30;// < for boots
    if( Rect(271,170, 40,45) == true ) bootsofspeed += 1; money -= 30;// > for boots
    if( Rect(651,170, 40,45) == true ) panknife += 1; money -= 30;// > for skill, less penalty
    if( Rect(550,170, 40,45) == true ) panknife -= 1; money += 30;// < for skill, less penalty
    if( Rect(175,322, 40,45) == true ) burger -= 1; money += 30;// < for burger
    if( Rect(271,322, 40,45) == true ) burger += 1; money -= 30;// > for burger
    if( Rect(651,322, 40,45) == true ) burger2 += 1; money -= 30;// > for +burger
    if( Rect(550,322, 40,45) == true ) burger2 -= 1; money += 30;// < for +burger
    if( Rect(175,474, 40,45) == true ) dish -= 1; money += 30;// < for dish
    if( Rect(271,474, 40,45) == true ) dish += 1; money -= 30;// > for dish
    if( Rect(651,474, 40,45) == true ) dish2 += 1; money -= 30;// > for +dish
    if( Rect(550,474, 40,45) == true ) dish2 -= 1; money += 30;// < for +dish
    if( overRect(700,530, 80,50) == true ) round2 = false;
    fill(0);
    //println(money);
    if (bootsofspeed < 1)
    {
     bootsofspeed = 1;
    }
    if (panknife < 1)
    {
     panknife = 1;
    }
    if (burger < 1)
    {
     burger = 1;
    }
    if (burger2 < 1)
    {
     burger2 = 1;
    }
    if (dish < 1)
    {
     dish = 1;
    }
    if (dish2 < 1)
    {
     dish2 = 1;
    }
    if (bootsofspeed > 10)
    {
     bootsofspeed = 10;
    }
    if (panknife > 10)
    {
     panknife = 10;
    }
    if (burger > 10)
    {
     burger = 10;
    }
    if (burger2 > 10)
    {
     burger2 = 10;
    }
    if (dish > 10)
    {
     dish = 10;
    }
    if (dish2 > 10)
    {
     dish2 = 10;
    }
    if (bootsofspeed > 10)
    {
     bootsofspeed = 10;
    }
    text(bootsofspeed, 235,200); // boots of speed
    text(panknife, 618,200); // pan/knife
    text(burger, 235,353); // burger
    text(burger2, 618,353); // +burger
    text(dish, 235,506); // dish
    text(dish2, 618,506); // +dish
    text("Cash:$"+money, 1,22);
    //text("score:"+money, 0,20); ??
    
  }
  //===   ======    ||      || ||\\   || ||=== 
  //  || //     \\  ||      || || \\  || ||   \\
  //===  ||     ||  ||      || ||  \\ || ||    \\   2
  // \\  ||     ||  ||      || ||   \\|| ||    //
  //  \\ \\=====//   \\====//  ||    \|| ||= =//
  if (round2 == false)
  {
      upgrades = true;
  aa = 588; bb = 485; cc = 600; dd = 375; ee = 583; ff = 288;
  y1 = 580; y2 = 195; //resets the coordinates of prev. Qs back to original spot
  background(background1);
  if( overRect(y1,y2, 67,73) == true ) { y1 = -100; y2 = -100;money += 20; round2 = true; round2a = false;}
  if( overRect(ee,ff, 67,75) == true )  {y1 = -100; y2 = -100;wrong2x = false;}
  if( overRect(cc,dd, 40,100) == true ) {y1=-100;y2 = -100;wrong2x = false;}
  if( overRect(aa,bb, 67,73) == true ) {y1=-100;y2 = -100;wrong2x = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("$"+money, 120,45);
  text("3x + 7 = -5", 400,250);
  text("x = ?", 420,280);
  text("x = - "+4, 650,250);
  text("x = "+4, 650,350);
  text("x = "+12, 660,450);
  text("x = -"+35, 660,530);
  }
  if (wrong2x == false) // burger deductions only happen during this screen
  {
    background(incorrect);
    fill(0);
    ccc = -1000;
    text("3x + 7 = -5      subtract both", 287,120);
    text("x = -12/3   sides by 7", 300,150);
    text("x = -4", 300,180);
    text("Continue", 360,250);
    if( overRect(300,220, 220,40) == true ) round2a = false;
  }
  if (round2a == false)
  {
  background(background1);

  if( overRect(ee,ff, 67,75) == true )  {ee = -100; ff = -100;money += 20; round2a = true; round2b = false;}
  if( overRect(cc,dd, 40,100) == true ) {ee = -100; ff = -100;wrong2a = false;}
  if( overRect(aa,bb, 67,73) == true ) {ee = -100; ff = -100;wrong2a = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("$"+money, 120,45);
  text("(2+8)x + 5 = 20", 360,250);
  text("x = ?", 420,280);
  text("x = "+7, 650,250);
  text("x = "+1.5, 650,350);
  text("x = "+0.5, 660,450);
  text("x = "+6, 660,530);
  }
    if (wrong2a == false) // burger deductions only happen during this screen
  {
    background(incorrect);
    fill(0);
    if (ccc==-1000)
    {
      bbb=-125;
    }
    else 
    {
      ccc= -999;
    }
    text("(2+8)x + 5 = 20  subtract 5 from both sides", 210,120);
    text("(2+8)x = 15 add 2 and 8 and multiply them", 210,150);
    text("10x = 15 divide both sides by 10", 270, 180);
    text("x = 1.5", 350, 210);
    text("Continue", 360,250);
    if( overRect(300,220, 220,40) == true ) round2b = false;
  }
    if (round2b == false)
  {
  background(background1);
  if( overRect(cc,dd, 40,100) == true ) {aa = -100; bb =-100; wrong2b = false;}
  if( overRect(aa,bb, 67,73) == true ) {aa = -100; bb = -100; round2c = false;}
  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("$"+money, 120,45);
  text("6x = 20", 400,250);
  text("x = ?", 420,280);
  text("x = "+4, 650,250);
  text("x = "+3, 650,350);
  text("x = "+2, 660,450);
  text("x = "+1, 660,530);
  }
  if (wrong2b == false)
  {
    background(incorrect);
    fill(0);
    if (ccc<-950)
    {
      bbb=-100;
    }
    else 
    {
      ccc= -101;
    }
    if (bbb < -101)
    {
      aaa =-100;
    }
    text("2x - 4 = 0  Add 4 on both sides", 287,150);
    text("2x = 4", 300,180);
    text("Continue", 360,250);
    if( overRect(300,220, 220,40) == true ) round2c = false;
  }
    if (round2c == false)
  {
  background(background1);
  if( overRect(cc,dd, 40,100) == true ) {cc = dd = -100;win2 = false;}

  fill(0);
  image(burgerz, aaa, 36); // burger 1
  image(burgerz, bbb, 36); // burger 2
  image(burgerz, ccc, 36); // burger 3
  text("$"+money, 120,45);
  text("6x = 20", 400,250);
  text("x = ?", 420,280);
  text("x = "+4, 650,250);
  text("x = "+3, 650,350);
  text("x = "+2, 660,450);
  text("x = "+1, 660,530);
  }
   if (win2 == false)
   {
     background(Desserts);
     if (mousePressed)
     {
       playscreen2 = false;
     }
   }
  if (playscreen2 == false)
  {
      {
  background(map5);
  image(sprite, waiterx,waitery);
  //image(sprite2, waiterx-20,waitery);
  //image(sprite3, waiterx,waitery-20);
  //image(sprite4, waiterx,waitery+20);
  text("Cash:$"+money, 1,22);
  fill(255,255,255,0);
  //rect(700,0,100,100);
  ellipse (710,130,138,138);

for(int i=0; i<a.length; i++)
      {
        a[i].move();
        a[i].show();
        //b[i].move();
        //b[i].show();
      }
   for(int i=0; i<b.length; i++)
  {
    b[i].show();
    b[i].move();
        if (waiterx < asdf1 && waitery < asdf2)
    {
      
      asdf1 = 900;
      asdf2 = -100;
      points +=10;
      money = points + money;
      introscreen = false; 
      round2 = true;
      round2a = true; // Q1
      round2b = true; // Q2
      round2c = true; // Q3
      gamescreen2 = true; // round 2 questions
      gamescreena2 = false;
    }

  }

for(int i=0; i<b.length; i++)
  {
    checkCollision(b[i]);
  }
  }
  }
if (gamescreena2 == false)
{
  background(Desserts);
  if (mousePressed)
  {
    upgrade2 = false;
  }
}
    if (upgrade2 == false)
  {
    background(upgradescreen);
    //println("change");
    if( Rect(175,170, 40,45) == true ) bootsofspeed -= 1; money += 30;// < for boots
    if( Rect(271,170, 40,45) == true ) bootsofspeed += 1; money -= 30;// > for boots
    if( Rect(651,170, 40,45) == true ) panknife += 1; money -= 30;// > for skill, less penalty
    if( Rect(550,170, 40,45) == true ) panknife -= 1; money += 30;// < for skill, less penalty
    if( Rect(175,322, 40,45) == true ) burger -= 1; money += 30;// < for burger
    if( Rect(271,322, 40,45) == true ) burger += 1; money -= 30;// > for burger
    if( Rect(651,322, 40,45) == true ) burger2 += 1; money -= 30;// > for +burger
    if( Rect(550,322, 40,45) == true ) burger2 -= 1; money += 30;// < for +burger
    if( Rect(175,474, 40,45) == true ) dish -= 1; money += 30;// < for dish
    if( Rect(271,474, 40,45) == true ) dish += 1; money -= 30;// > for dish
    if( Rect(651,474, 40,45) == true ) dish2 += 1; money -= 30;// > for +dish
    if( Rect(550,474, 40,45) == true ) dish2 -= 1; money += 30;// < for +dish
    if( overRect(700,530, 80,50) == true ) round2 = false;
    fill(0);
    //println(money);
    if (bootsofspeed < 1)
    {
     bootsofspeed = 1;
    }
    if (panknife < 1)
    {
     panknife = 1;
    }
    if (burger < 1)
    {
     burger = 1;
    }
    if (burger2 < 1)
    {
     burger2 = 1;
    }
    if (dish < 1)
    {
     dish = 1;
    }
    if (dish2 < 1)
    {
     dish2 = 1;
    }
    if (bootsofspeed > 10)
    {
     bootsofspeed = 10;
    }
    if (panknife > 10)
    {
     panknife = 10;
    }
    if (burger > 10)
    {
     burger = 10;
    }
    if (burger2 > 10)
    {
     burger2 = 10;
    }
    if (dish > 10)
    {
     dish = 10;
    }
    if (dish2 > 10)
    {
     dish2 = 10;
    }
    if (bootsofspeed > 10)
    {
     bootsofspeed = 10;
    }
    text(bootsofspeed, 235,200); // boots of speed
    text(panknife, 618,200); // pan/knife
    text(burger, 235,353); // burger
    text(burger2, 618,353); // +burger
    text(dish, 235,506); // dish
    text(dish2, 618,506); // +dish
    //text("score:"+money, 0,20); ??
    
  }
}

void checkCollision(Enemy b)
{

  float distance = dist(waiterx, waitery, b.Enemyx, b.Enemyy);
  float radiiSum = a[0].r/2 + b.rb/2;
  
  if (distance <= radiiSum)
  {
  points -= 1;
  if (points < 0)
  {
    points = 0;
  }
  }
}
  class Waiter
{

  int r; // size (r for radius)
  //int v; // velocity
  int rgbred; // color 1
  int rgbgreen; // color 2
  int rgbblue; // color 3
  int opacity; //opacity, duh

  void show()
  {
    fill(rgbred,rgbgreen,rgbblue,opacity);
    ellipse(waiterx, waitery, r, r);

    /*fill(250,128,114);
    ellipse(waiterx+10, waitery + 17, r/2, r/2.31);
    ellipse(waiterx-9, waitery + 17, r/2, r/2.31);
    fill(0);
    ellipse(waiterx-6, waitery-3, r/5, r/3);
    ellipse(waiterx+6, waitery-3, r/5, r/3);
    fill(255);
    ellipse(waiterx-7, waitery-5, r/15, r/7.5);
    ellipse(waiterx+5, waitery-5, r/15, r/7.5);
    fill(250,128,114);
    ellipse(waiterx, waitery+6, r/5, r/10);
    fill(205,92,92);
    ellipse(waiterx+9, waitery+4, r/6, r/10);
    ellipse(waiterx-8, waitery+4, r/6, r/10);
    */
  }

  void move()
  {
    //Waiter

    if (wPressed) 
    {
      waitery = waitery - v;
      waiterx = waiterx;
      sprite=sprite1;
    
    }
    if (sPressed) 
    {
      waitery = waitery + v;
      waiterx = waiterx;
      sprite=sprite2;
    
    }
    if (dPressed) 
    {
      waiterx = waiterx + v;
      waitery = waitery;
      sprite=sprite4;

    }
    if (aPressed) 
    {
      waiterx = waiterx - v;
      waitery = waitery;
      sprite=sprite3;
      
    }

    if(waiterx<=((width/25)+r/2))
    {
      waiterx = (width/25)+r/2; 
    }  


    if(waiterx>=(width-width/25)-r/2)
    { 
      waiterx = (width-width/25)-r/2;
    }


    if(waitery<=((height/25)+r/2))
    {
      waitery = (height/25)+r/2;
    }


    if(waitery>=(height-height/25)-(r/2)-9)
    {
      waitery = (height-height/25)-(r/2)-9;
    }

  }
  //End waiter
}
 class tables
 {
   void show()
   { 
   rect(rectX, rectY, rectWidth, rectHeight); 
   }
 }
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) { 
 
  float circleDistanceX = abs(cx - rx - rw/2); 
  float circleDistanceY = abs(cy - ry - rh/2); 
 
  if (circleDistanceX > (rw/2 + cr)) { return false; } 
  if (circleDistanceY > (rh/2 + cr)) { return false; } 
  if (circleDistanceX <= rw/2) { return true; }  
  if (circleDistanceY <= rh/2) { return true; } 
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2); 
  return cornerDistance <= pow(cr, 2); 
} 
void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
}


 class Enemy
{
  float Enemyx, Enemyy;
  int rb, vb;
  void show()
  {
    fill(255,255,255);
    ellipse(Enemyx, Enemyy, rb, rb);
  }
  void move()
  {
   Enemyx += vb;
 if (Enemyx >= 800)
 {
   vb = -vb;
   Enemyy = random(width);
 }
  if (Enemyx <= 1)
 {
   vb = -vb;
   Enemyy = random(width);
 }
 }
}
/*class tables
{
  float tablesx, tablesy, tablesy1, tablesy2, tablesy3;
  int r;
  void show()
  {
  fill(0);
    ellipse(tablesx,tablesy,r,r);
    ellipse(tablesx,tablesy1,r,r);
      ellipse(tablesx,tablesy2,r,r);
        ellipse(tablesx,tablesy3,r,r);
  }
}*/
/*void checkCollision(tables c)
{

  float distance = dist(waiterx, waitery, c.tablesx, c.tablesy);//, c.tablesy1, c.tablesy2, c.tablesy3);
  float radiiSum = a[0].r/2 + c.r/2;
  
  if (distance <= radiiSum)
  {
  points -= 1;
  if (points < 0)
  {
    points = 0;
  }
  }
}*/
//*********ALSO PART OF MY GAMESCREEN FOR QUESTIONS***********//
boolean overRect(int x, int y, int wid, int hiet)
{
  fill(255,255,0,100);
  rect(x,y, wid,hiet);
  
  if (mouseX >= x && mouseX <= x+wid && 
    mouseY >= y && mouseY <= y+hiet && mousePressed)
    {
    return true;
  } 
  else {
    return false;
  }
}
//seperate buttons for upgradescreen
boolean Rect(int x, int y, int wid, int hiet)
{
  fill(255,255,0,100);
  rect(x,y, wid,hiet);
  
  if (mouseX >= x && mouseX <= x+wid && 
    mouseY >= y && mouseY <= y+hiet && mousePressed)
    {
      //if (release == 0)
    //{
    return true;
  } 
  else {
    return false;
  }
}

void mouseReleased()
{
  if (release== 0 && upgrades == false)
  {
    release = 1;
  }
  else {
    release = 0;
  }
}

