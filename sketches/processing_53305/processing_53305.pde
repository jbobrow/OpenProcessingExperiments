
/*
Navigation Sample. 
 Spacebar changes between which "card" we're looking at.
 Card 2 has a button option which advances us to Card 3.
 M. Kontopoulos / 2012 / DMA28 Project 2
 */

PImage sleeping;
PImage foresta;
PImage glowingegg;
PImage egg;
PImage b1;
PImage eggscene;
PImage lamp;
PImage emptyblankets;
PImage baby;
PImage babyeat;
PImage babyfull;
PImage sofat;
PImage blurryfigure;
PImage walking;
PImage grass;
PImage walkingfigures;
PImage babyescapes;
PImage forestwalk;
PImage twopaths;
PImage blurry;
PImage blurry2;
PImage angrybaby;
PImage babyrising;
PImage risingbabyfigure;
PImage spampile;
PImage spam;
PImage twinkiepile;
PImage twinkie;
PImage morning;
PShape binoculars;
PImage unhatchedegg;
PImage smallmoon;

PFont nilland;
int card;
float walkposition;
float x;
float angle;
float angle2;
int radius = 10;
float y;

float bx;
float by;
int bs = 100;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 
int count;
int mouthwidth;

void setup()
{
  size(700, 500);
  smooth();
  frameRate(80);

  sleeping = loadImage ("sleeping.jpg");
  foresta = loadImage ("foresta.jpg");
  b1 = loadImage ("b1.jpg");
  glowingegg = loadImage ("glowingegg.jpg");
  egg = loadImage ("egg.png");
  babyeat = loadImage ("babyeat.jpg");
  emptyblankets = loadImage ("emptyblankets.jpg");
  baby = loadImage ("baby.jpg");
  babyfull = loadImage ("babyfull.jpg");
  sofat = loadImage ("sofat.jpg");
  blurryfigure = loadImage ("blurryfigure.png");
  walking = loadImage ("walking.jpg");
  grass = loadImage ("grass.png");
  walkingfigures = loadImage ("walkingfigures.png");
  babyescapes = loadImage ("babyescapes.jpg");
  forestwalk = loadImage ("forestwalk.jpg");
  twopaths = loadImage ("twopaths.jpg");
  blurry = loadImage ("blurry.jpg");
  blurry2 = loadImage ("blurry2.jpg");
  angrybaby = loadImage ("angrybaby.jpg");
  babyrising = loadImage ("babyrising.jpg");
  risingbabyfigure = loadImage ("risingbabyfigure.png");
  lamp = loadImage ("lamp.jpg");
  spampile = loadImage ("spampile.png");
  morning = loadImage ("morning.jpg");
  spam = loadImage ("spam.png");
  smallmoon =loadImage ("smallmoon.png");
  unhatchedegg = loadImage ("unhatchedegg.png");
  binoculars = loadShape ("binoculars.svg");
  nilland = loadFont("Nilland-28.vlw");
  textFont(nilland);

  card  = 1;
  textAlign(CENTER);
  ellipseMode(RADIUS);

  mouthwidth = 25;
  bx = 285;
  by = 330;

  count = 0;
  y=100;
}






void draw()
{
  noStroke();
  background(255);
  fill(0);
  angle += 0.5;
  x = 200 + 5*cos(angle);

  if (card==1)
  {
    image(sleeping, 0, 0);
    fill(255);
    textSize(28);
    text("It's a typical quiet night...", 500, 150 );
    textSize(10);
    text("(spacebar)", 500, 180 );
  }
  if (card==2)
  {
    image(foresta, 0, 0);
    shape(binoculars, 0, 0);
    fill(255);
    textSize(20);
    text("...until picking up your binoculars, you see a flash of light in the forest nearby", 350, 45 );
    fill(255);
    text("go see what it is", 350, 410 );
    text("ignore it", 350, 450 );

    if (mouseX<400 && mouseX>300 && mouseY>390 && mouseY<410) //testing button boundaries
    {

      if (mousePressed)
      {
        card++;
      }
    }

    if (mouseX<400 && mouseX>300 && mouseY>420 && mouseY<450) //testing button boundaries
    {

      if (mousePressed)
      {
        card=18;
      }
    }
  }
  if (card==3)
  {
    image(blurry2, 0, 0);
    fill(255);
    textSize(28);
    text("you follow the light...", 350, 200 );
    textSize(10);
    text("(spacebar)", 350, 230 );

    if (mouseX<400 && mouseX>350 && mouseY>200 && mouseY<250) //testing button boundaries
    {

      if (mousePressed)
      {
        card++;
      }
    }
  }

  if (card==4)
  {
    image(glowingegg, 0, 0);
    fill(255);
    textSize(28);
    text("take it", 100, 230 );
    fill(255);
    text("leave it", 560, 230 );

    if (mouseX< 150 && mouseX>50 && mouseY>200 && mouseY<250) //testing button boundaries
    {

      if (mousePressed)
      {
        card++;
      }
    }

    if (mouseX<590 && mouseX>500 && mouseY>200 && mouseY<250) //testing button boundaries
    {

      if (mousePressed)
      {
        card=18;
      }
    }
  }
  else if (card==5)
  {
    image(b1, 0, 0);
    fill(255);
    text("back home...", 200, 50 );
    text("it starts to shake violently...", 200, 70 );
    fill(255);
    textSize(20);
    text("click the egg to see what's inside", 210, 120 );

    //     rotate(angle);
    image(egg, x, 300);
    if (mouseX<700 && mouseX>200 && mouseY>350 && mouseY<height) //testing button boundaries
    {

      if (mousePressed)
      {
        float rn = int(random(100));

        if (rn<=10)
          card=20;
        if (rn<=99 && rn>10)
          card++;
      }
    }
  }
  if (card==6)
  {

    image(baby, 0, 0);

    fill(0);
    textSize(28);
    text("it's a baby!", 550, 100 );
    textSize(10);
    text("(spacebar)", 550, 150 );
  }

  if (card==7)
  {

    image(morning, 0, 0);
    fill(0);
    textSize(20);
    text("the next morning...", 200, 200 );
    textSize(10);
    text("(spacebar)", 200, 230 );
  }

  if (card==8)
  {
    image(babyeat, 0, 0);
    //eyes
    ellipse(310, 160, 8, 8);
    ellipse(420, 160, 8, 8);
    //highlights
    fill(255);
    noStroke();
    ellipse(313, 155, 3, 3);
    ellipse(423, 155, 3, 3);

    fill(0);
    textSize(30);
    text("breakfast time!", 130, 70 );
    text("Feed it 10 slices of spam.", 30, 100, 200, 200 );
    textSize(15);
    text("(click and drag the spam into its mouth. Make sure it goes in!)", 30, 220, 200, 200 );

    image(spampile, 285, 330);

    //mouth

    float d= dist(mouseX, mouseY, 366, 220);
    if (d < radius) {
      radius= 20;
    }
    else {
      radius=10;
    }
    fill(0);
    ellipse(366, 220, radius, radius);

    /////////////////////
    if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
      bover = true;
    } 
    else {

      bover = false;
    }

    if (count == 10) {
      card = 9;
    }
  }

  if (card==9)
  {

    image(sleeping, 0, 0);
    fill(255);
    textSize(15);
    text("sleepytime. (spacebar)", 100, 400 );
  }

  if (card==10)
  {

    image(babyfull, 0, 0);
    image(blurryfigure, 0, 0);
    fill(0);
    textSize(18);
    text("the next day, you're greeted with this sight...", 260, 40 );
    textSize(28);
    text("...Time for some exercise.", 380, 400 );
    textSize(10);
    text("(spacebar)", 380, 430 );
  }
  if (card==11)
  {
    image(walking, 0, 0);
    if (keyPressed && (key == CODED)) {
      if (keyCode == RIGHT) {
        walkposition++;
      }
    }
    angle2 += 0.09;
    float sinVal = 325 + sin(angle2) *2;
    image(walkingfigures, walkposition, sinVal);
    if (walkposition == width) {
      card ++;
    }
    image(grass, 0, 350);
    textSize(28);
    fill(255);
    textSize(20);
    fill(0);
    textSize(20);
    text("(press the right arrow button)", 350, 400 );
  }

  if (card==12)
  {
    image(forestwalk, 0, 0);
    textSize(28);
    fill(255);
    text("Enter the woods", 160, 50 );

    if (mouseX< 200 && mouseX> 20 && mouseY>40 && mouseY<60) //testing button boundaries
    {

      if (mousePressed)
      {
        card++;
      }
    }

    text("Don't enter the woods", 160, 90 );

    if (mouseX< 300 && mouseX>0 && mouseY>80 && mouseY<95) //testing button boundaries
    {

      if (mousePressed)
      {
        card=21;
      }
    }
  }
  if (card==13)
  {
    image(babyescapes, 0, 0);
    fill(255);
    text("As you enter, he runs into the forest!", 30, 360, 250, 200 );
    textSize(15);
    text("run after him!", 30, 390, 250, 200 );
    if (mouseX< 300 && mouseX> 50 && mouseY>350 && mouseY<420) //testing button boundaries
    {

      if (mousePressed)
      {
        card++;
      }
    }

    text("let him go.", 30, 430, 250, 200 );
    if (mouseX< 300 && mouseX> 50 && mouseY> 410 && mouseY<450) //testing button boundaries
    {

      if (mousePressed)
      {
        card=18;
      }
    }
  }
  if (card==14)
  {
    image(twopaths, 0, 0);
    fill(255);
    textSize(28);
    text("Choose your path", 350, 400 );
    //left
    if (mouseX< width/2 && mouseX> 0 && mouseY>0 && mouseY<height/2) //testing button boundaries
    {

      if (mousePressed)
      {
        card++;
      }
    }
    //right
    if (mouseX< width && mouseX> width/2 && mouseY>0 && mouseY<height) //testing button boundaries
    {

      if (mousePressed)
      {
        card=16;
      }
    }
  }
  if (card==15)
  {
    image(blurry, 0, 0);
    fill(255);
    textSize(28);
    text("you wander blindly...", 350, 250 );
    textSize(10);
    text("(spacebar)", 380, 270 );

    if (keyPressed) {
      if (key == ' ') {
        card=23;
      }
    }
  }
  if (card==16)
  {
    image(blurry2, 0, 0);
    fill(255);
    textSize(28);
    text("you see some light...", 380, 250 );
    textSize(10);
    text("(spacebar)", 380, 270);
  }

  if (card==17)
  {
    image(babyrising, 0, 0);
    fill(255);
    textSize(20);
    text("Help baby go back to the sky!", 200, 310);
    textSize(10);
    text("(press the up arrow key)", 200, 330);

    //    image(risingbabyfigure, 400, walkposition);
    angle2 += 0.09;
    float sinVal = 10 + sin(angle2) *2;
    translate(0, y);
    image(risingbabyfigure, 400, sinVal);
    if (y == -200) {
      card=19;
    }

    if (keyPressed && (key == CODED)) {
      if (keyCode == UP) {
        y--;
      }
    }
  }



  if (card==18)
  {
    image(sleeping, 0, 0);
    fill(255);
    textSize(28);
    text("nothing happens. the end.", 380, 270 );
  }

  if (card==19)
  {
    image(sleeping, 0, 0);
    image(smallmoon, 250, 140);
    fill(255);
    textSize(20);
    text("A second moon mysteriously appears that night. the end!", 380, 270, 300, 250 );
  }

  if (card==20)
  {
    image(emptyblankets, 0, 0);
    image(unhatchedegg, 270, 30);
    fill(0);
    textSize(28);
    text("nothing happens. the end.", 200, 380 );
  }

  if (card==21)
  {
    image(morning, 0, 0);

    textSize(20);
    text("the next day...", 200, 200 );
    textSize(15);
    text("(click here)", 200, 215 );

    if (mouseX< 230 && mouseX>190 && mouseY>200 && mouseY<230) //testing button boundaries
    {

      if (mousePressed)
      {
        card=22;
      }
    }
  }

  if (card==22)
  {
    image(sofat, 0, 0);
    text("he's getting hefty. take him on a walk. (click here)", 100, 100, 150, 250 );

    if (mouseX<200 && mouseX>0 && mouseY>0 && mouseY<250) //testing button boundaries
    {

      if (mousePressed)
      {
        card=11;
      }
    }
  }

  if (card==23)
  {
    image(angrybaby, 0, 0);
    fill(255);
    textSize(28);
    text("the baby is huge. and angry.", 350, 270 );
    textSize(10);
    text("(click)", 350, 290 );

    if (mousePressed) {

      tint(#ED5959, 230); 
      textSize(28);
      fill(255);
      text("you're toast. literally. ze end.", 350, 320 );
    }
  }
}

void keyPressed()
{
  if (card==1 || card==3 || card==6 || card==7 ||card==9 ||card== 10|| card==16) {
    if (key==' ') //spacebar
    {
      if (card >= 24)
        card=1; 
      else
        card++;
    }
  }
}

void mousePressed() {
  if (card == 8) {



    if (bover) { 
      locked = true;
    } 
    else {
      locked = false;
    }
    bdifx = mouseX-bx; 
    bdify = mouseY-by;
  }
}

void mouseDragged() {
  if (card == 8) {
    if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {


      image(spam, bx, by, bs, bs);
    }



    if (locked) {
      bx = mouseX-bdifx; 
      by = mouseY-bdify;
    }
  }
}


void mouseReleased() {
  if (card == 8) {
    locked = false;


    if (mouseX > 300 && mouseX < 400 && 
      mouseY > 220 && mouseY < 350)
    {

      bx=285;
      by=330;
      count++;
    }
  }
}


