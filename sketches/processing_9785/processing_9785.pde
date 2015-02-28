
//The Dungeon
//Nicki France
//CMSC 117, Final Project
//5.17.10


int page = 1;
boolean haspotion;
boolean hasgold;
boolean hasStone;
boolean hasrope;
boolean hasSweater;
boolean usecat;
boolean usepotion;
boolean usestone;

PFont font;

PImage frame;
PImage door;
PImage gold;
PImage bones;
PImage rope;
PImage sweater;
PImage ghost;
PImage stone;
PImage cauldron;
PImage potion;
PImage dragon;
PImage kitty;
PImage wizard;
PImage wink;
PImage whale;
PImage fairy;
PImage king;
PImage cat;
PImage death;
PImage bard;
PImage cookies;
PImage bunny;
PImage logo;
PImage cry;

int b1x = 70;
int b1y = 60;
int b1w = 130;
int b1h = 196;

int b2x = 450;
int b2y = 60;
int b2w = 515;
int b2h = 196;

int b3x = 200;
int b3y = 20;
int b3w = 330;
int b3h = 300;

int b4x = 550;
int b4y = 430;
int b4w = 640;
int b4h = 480;


void setup ()
{
  size (640, 480);
  smooth();
  font = loadFont ("Computerfont-48.vlw");
  textFont (font);
  textAlign (CENTER);
  textSize (25);
  fill (0, 255, 0);
  frame = loadImage ("background.png");
  image (frame, 0, 0);

  door = loadImage ("door.jpg");
  gold = loadImage ("gold.jpg");
  bones = loadImage ("bones.jpg");
  rope = loadImage ("rope.jpg");
  sweater = loadImage ("sweater.jpg");
  ghost = loadImage ("ghost.jpg");
  stone = loadImage ("stone.jpg");
  cauldron = loadImage ("cauldron.jpg");
  potion = loadImage ("bottle.jpg");
  dragon = loadImage ("dragon.jpg");
  kitty = loadImage ("kitty.jpg");
  wizard = loadImage ("wizard.jpg");
  wink = loadImage ("wizardwink.jpg");
  whale = loadImage ("whale.jpg");
  fairy = loadImage ("fairy.jpg");
  king = loadImage ("king.jpg");
  cat = loadImage ("cat.jpg");
  death = loadImage ("death.jpg");
  bard = loadImage ("bard.jpg");
  cookies = loadImage ("cokkies.jpg");
  bunny = loadImage ("bunny.jpg");
  logo = loadImage ("logo.jpg");
  cry = loadImage ("kittycry.jpg");
}

void draw ()
{
  image (frame, 0, 0);
  if (page == 1) {
    pageOne();
  }
  else if (page == 2) {
    pageTwo();
  }
  else if (page == 3) {
    pageThree();
  }
  else if (page == 4) {
    pageFour();
  }
  else if (page == 5) {
    pageFive();
  }
  else if (page == 6) {
    pageSix();
  }
  else if (page == 7) {
    pageSeven();
  }
  else if (page == 8) {
    pageEight();
  }
  else if (page== 9) {
    pageNine();
  }
  else if (page == 10) {
    pageTen();
  }
  else if (page == 11) {
    pageEleven();
  }
  else if (page == 12) {
    pageTwelve();
  }
  else if (page == 13) {
    pageThirteen();
  }
  else if (page == 14) {
    pageFourteen();
  }
  else if (page == 15) {
    pageFifteen();
  }
  else if (page == 16) {
    pageSixteen();
  }
  else if (page == 17) {
    pageSeventeen();
  }
  else if (page == 18) {
    pageEighteen();
  }
  else if (page == 19) {
    pageNineteen();
  }
  else if (page == 20) {
    pageTwenty();
  }
  else if (page == 21) {
    pageTwentyOne();
  }
  else if (page == 22) {
    pageTwentyTwo();
  }
  else if (page == 23) {
    pageTwentyThree();
  }
  else if (page == 24) {
    pageTwentyFour();
  }
  else if (page == 25) {
    pageTwentyFive();
  }
  else if (page == 26) {
    pageTwentySix();
  }
  else if (page == 27) {
    pageTwentySeven();
  }
  else if (page == 28) {
    pageTwentyEight();
  }
  else if (page == 29) {
    pageTwentyNine();
  }
  else if (page == 30) {
    pageThirty();
  }
  else if (page == 31) {
    pageThirtyOne();
  }
  else if (page == 32) {
    pageThirtyTwo();
  }
  else if (page == 33) {
    pageThirtyThree();
  } 
  else if (page == 34) {
    pageThirtyFour();
  }
  else if (page == 35) {
    pageThirtyFive();
  }
  else if (page == 36) {
    pageThirtySix();
  }
  else if (page == 37) {
    pageThirtySeven(); 
  }
  else if (page == 38) {
    pageThirtyEight(); 
  }
  else if (page == 39) {
    pageThirtyNine(); 
  }
  else if (page == 40) {
    pageForty(); 
  }
  else if (page == 41) {
    pageFortyOne(); 
  }
  else if (page == 42) {
    pageFortyTwo(); 
  }
  else if (page == 43) {
    pageFortyThree(); 
  }
  else if (page == 44) {
    pageFortyFour();
  }
  else if (page == 45) {
    pageFortyFive();
  }
  else if (page == 46) {
    pageFortySix();
  }
  else if (page == 47) {
    pageFortySeven();
  }
  else if (page == 48) {
    pageFortyEight();
  }
  else if (page == 49) {
    pageFortyNine();
  }
  else if (page == 50) {
    pageFifty();
  }
  else if (page == 51) {
    pageFiftyOne();
  }
  else if (page == 52) {
    pageFiftyTwo();
  }
  else if (page == 53) {
    pageFiftyThree();
  }
  else if (page == 54) {
    pageFiftyFour();
  }
  else if (page == 55) {
    pageFiftyFive();
  }
  else if (page == 56) {
    pageFiftySix();
  }
  else if (page ==57) {
    pageFiftySeven();
  }
  else if (page == 58) {
    pageFiftyEight();
  }
  else if (page == 59) {
    pageFiftyNine();
  }
  else if (page == 60) {
    pageSixty();
  }
  else if (page == 61) {
    pageSixtyOne();
  }
  else if (page == 62) {
    pageSixtyTwo();
  }
}


boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  }
  else {
    return false;
  }
}

void mousePressed() 
{
  if (page == 1)
  {
    if (overButton(b1x, b1y, b1w, b1h) == true)
    {
      page = 2;
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true) 
    {
      page = 11;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true) 
    {
      page = 5;
    } 
  }
  else if (page == 2) 
  {
    if (overButton(b1x, b1y, b1w, b1h) == true)
    {
      if (hasgold == false)
      {
      page = 3;
      }
      else if (hasgold == true)
      { 
        page = 61;
      }
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true) 
    {
      page = 4;
    }
  }
  else if (page == 3) 
  {
    if (overButton(b1x, b1y, b1w, b1h) == true) 
    {
      page = 2;
      hasgold = true;
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true) 
    {
      page = 1;
    }
  }
  else if (page == 4)
  {
    if (overButton (b1x, b1y, b1w, b1h) == true)
    {
      page = 1;
    }
  }
  else if (page == 5) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      if (haspotion == false)
      {
      page = 6;
      }
      else if (haspotion == true)
      {
        page = 61;
      }
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      if (haspotion == false)
      {
      page = 7;
      }
      else if (haspotion == true)
      {
        page = 61;
      }
    }
  }
  else if (page == 6) 
  {
    if (mousePressed) 
    {
      page = 7;
    }
  }
  else if (page == 7) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 8;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      haspotion = true;
      page = 9;
    }
  }
  else if (page == 8) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 1;
    }
  }
  else if (page == 9) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 10;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 1;
    }
  }
  else if (page ==  10) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 1;
    }
  }
  else if (page == 11) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 12;
      hasrope = true;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 12;
    }
  }
  else if ( page == 12) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      if (hasStone == false)
      {
      page = 13;
      }
      else if (hasStone == true)
      {
        page = 60;
      }
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      if (hasSweater == false)
      {
      page = 36;
      }
      else if (hasSweater == true)
      {
        page = 60;
      }
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true) 
    {
      page = 17;
    }
  }
  else if (page == 13) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 14;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 15;
    }
  }
  else if (page == 14) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 16;
    }
  }
  else if (page == 15) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 1;
    }
  }
  else if (page == 16) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 12;
      hasStone = true;
    }
  }
  else if (page == 17) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 18;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 18;
    }
  }
  else if (page == 18) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 19;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 22;
    }
  }
  else if (page == 19) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 20;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 21;
    }
  }
  else if (page == 20) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 12;
    }
  }
  else if (page == 21) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 12;
    }
  }
  else if (page == 22) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 23;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 25;
    }
  }
  else if (page == 23) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 24;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 24;
    }
  }
  else if (page == 24) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 1;
    }
  }
  else if (page == 25)
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      if (hasrope == true)
      {
      page = 26;
      }
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 11;
    }
  }
  else if (page == 26)
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 27;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 27;
    }
  }
  else if (page == 27) 
  {
    if (mousePressed) 
    {
      page = 28;
    }
  }
  else if (page == 28) 
  {
    if (mousePressed) 
    {
      page = 29;
    }
  }
  else if (page == 29) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      if (hasgold == true)
      {
      page = 30;
      }
      else if (hasgold == false)
      { 
        page = 58;
      }
    }
    else if (overButton (b1x, b1y, b1w, b1h) == true)
    {
      page = 58;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 31;
    }
  }
  else if (page == 30) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 32;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 33;
    }
  }
  else if (page == 31) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 30;
    }
  }
  else if (page == 32) 
  {
    if (overButton(b1x, b1y, b1w, b1h) == true) 
    {
      if (haspotion == true)
      {
      page = 34;
      usepotion = true;
      }
      else if (haspotion == false)
      {
        page = 59;
      }
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true) 
    {
      page = 37;
      usecat = true;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true) 
    {
      if (hasStone == true)
      {
      page = 35;
      usestone = true;
      }
      else if (hasStone == false)
      {
        page = 59;
      }
    }
  }
  else if (page == 33) 
  {
    if (mousePressed) 
    {
      hasgold = true;
      page = 32;
    }
  }
  else if (page == 34) 
  {
    if (mousePressed) 
    {
      page = 48;
    }
  }
  else if (page == 35) 
  {
    if (mousePressed) 
    {
      page = 48;
    }
  }
  else if (page == 36) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 38;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 47;
    }
  }
  else if (page == 37) 
  {
    if (mousePressed) 
    {
      page = 48;
    }
  }
  else if (page == 38) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 39;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 40;
    }
  }
  else if (page == 39) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 42;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 41;
    }
  }
  else if (page == 40) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 43;
    }
  }
  else if (page == 41) 
  {
    if (mousePressed) 
    {
      page = 44;
    }
  }
  else if (page == 42) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 45;
    }
  }
  else if (page == 43) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 42;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 41;
    }
  }
  else if (page == 44) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 46;
    }
    else if (overButton (b2x, b2y, b2w, b2h) == true) 
    {
      page = 46;
    }
  }
  else if (page == 45) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 1;
    }
  }
  else if (page == 46) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 12;  
      hasSweater = true;
    }
  }
  else if (page == 47) 
  {
    if (overButton (b1x, b1y, b1w, b1h) == true) 
    {
      page = 12; 
     hasSweater = true; 
    }
  }
  else if (page == 48) 
  {
    if (mousePressed) 
    {
      page = 49;
    }
  }
  else if (page ==49) 
  {
    if (mousePressed)
    {
      page = 50;
    }
  }
  else if (page == 50) 
  {
    if (overButton(b1x, b1y, b1w, b1h) == true) 
    {
      if (usepotion == true)
      {
      page = 51;
      }
      else if (usepotion == false)
      {
        page = 62;
      }
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true) 
    {
      if (usecat == true)
      {
      page = 53;
      }
      else if (usecat == false)
      {
        page = 62;
      }
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true) 
    {
      if (usestone == true)
      {
      page = 52;
      }
      else if (usestone == false)
      {
        page = 62;
      }
    }
  }
  else if (page == 51) 
  {
    if (mousePressed) 
    {
      page = 54;
    }
  }
  else if (page == 52) 
  {
    if (mousePressed) 
    {
      page = 55;
    }
  }
  else if (page == 53) 
  {
    if (mousePressed) 
    {
      page = 56;
    }
  }
  else if (page == 54) 
  {
    if (mousePressed) 
    {
      page = 57;
    }
  }
  else if (page == 55) 
  {
    if (mousePressed) 
    {
      page = 57;
    }  
  }          
  else if (page == 56)
  {
    if (mousePressed) 
    {
      page = 57;
    } 
  }
  else if (page == 57)
  {
    if (overButton(b4x, b4y, b4w, b4h) == true) 
    {
      page = 1;
    }
  }
  else if (page ==58)
  {
    if (mousePressed)
    { 
      page = 30;
    }
  }
  else if (page == 59)
  {
    if (mousePressed)
    {
    page = 1;
    }
  }
  else if (page == 60)
  {
    if (mousePressed)
    {
      page = 12;
    }
  }
  else if (page == 61)
  {
    page = 1;
  }
  else if (page == 62)
  {
    page = 1;
  }
}


void pageOne()
{
  textSize (25);
  text ("Ye awake in an empty cell deep inside", 320, 340);
  text ("a most terrifying dungeon.", 320, 365);
  text ("Directions are North, South, or East.", 320, 390);
  textSize (20);
  text ("North", 125, 100);
  text ("South", 315, 100);
  text ("East", 505, 100);
}

void pageTwo()
{
  textSize (25);
  image (door, 100, 30);
  image (door, 380, 30);
  text ("Ye walk down a corridor lit with atmospheric", 320, 340);
  text ("torches. At the end of the hall there are two doors.", 320, 365);
  text ("Which do ye choose?", 320, 390);
}

void pageThree()
{
  textSize (25);
  image (gold, 200, 30);
  text ("Ye open the door unto an empty room. But look", 320, 340);
  text ("ye there! Ye have found a bag of gold! It glints", 320, 365);
  text ("shinily. What wouldst thou do?", 320, 390);
  textSize (20);
  text ("Take gold", 100, 100);
  text ("Turn back", 500, 100);
}

void pageFour()
{
  textSize (25); 
  image (bones, 250, 20);
  text ("Ye enter en empty cell.  Well, empty save the", 320, 340);
  text ("skeleton chilling in that corner over there.", 320, 365);
  text ("+5 panic points.  Brrr.", 320, 390);
  textSize (20);
  text ("Turn back", 100, 100);
}

void pageFive()
{
  textSize (25);
  image (door, 230, 30);
  text ("Ye walk down a corridor lined with atmospheric", 320, 340);
  text ("torches. Seems to be the dominant theme around", 320, 365);
  text ("here. There be a door before ye.", 320, 390);
  text ("What wouldst thou do?", 320, 415);
  textSize (20);
  text ("Knock", 100, 100);
  text ("Barge in!", 500, 100);
}

void pageSix()
{
  textSize (25);
  textAlign (CENTER);
  text ("Ye knock most politely, but there is no answer.", 320, 340);
  text ("Seeing no harm, ye waltz right in.", 320, 365);
}

void pageSeven()
{
  textSize (25);
  image (cauldron, 200, 10);
  text ("Before ye rests a wizard's laboratory, bubbling", 320, 340);
  text ("cauldron, potion bottles, and various toads and all. It", 320, 365);
  text ("seems like someone has just stepped out.", 320, 390);
  textSize (20);
  text ("Drink potion", 100, 100);
  text ("Take potion", 500, 100);
  text ("in bottle", 504, 115);
}

void pageEight()
{
  textSize (25);
  image (death, 180, 30);
  text ("Alas! It was poison! Ye should have headed ye", 320, 340);
  text ("mother as a child to not place strange things in", 320, 365);
  text ("ye mouth. Ye are now dead.", 320, 390);
  textSize (20);
  text ("Restart?", 100, 100);
}

void pageNine()
{
  image (potion, 200, 20);
  textSize (25);
  text ("Ye scoop yon potion into an empty bottle and earn +5", 320, 340);
  text ("klepto points. As ye do so, ye ponder ye eagerness to", 320, 365);
  text ("take what does not belong to thee. What", 320, 390);
  text ("wouldst thou do?", 320, 415);
  textSize (20);
  text ("Remain in room", 100, 100);
  text ("Turn back", 500, 100);
}

void pageTen()
{
  textSize (25);
  text("You sure? It be mad creepy in here.", 320, 375);
  textSize (20);
  text ("Turn back", 100, 100);
}

void pageEleven()
{
  textSize (25);
  image (rope, 150, 20);
  text ("Ye are not surprised to be walking down a hall lined", 320, 340);
  text("with torches. Ye find a pile of rope on the floor.", 320, 365);
  text ("Will ye pick it up?", 320, 390);
  textSize (20);
  text ("Yea", 100, 100);
  text ("Nay", 500, 100);
}

void pageTwelve()
{
  textSize (25);
  image (door, 70, 30);
  image (door, 250, 30);
  image (door, 420, 30);
  text("Ye reach the end of the hall to find three doors", 320, 365);
  text ("awaiting ye. Which shall ye choose?", 320, 390);
}

void pageThirteen()
{
  image (ghost, 180, 30);
  textSize (55);
  text("GHOST!!!", 320, 375);
  textSize (25);
  text ("Quickly! Distract it!", 320, 400);
  textSize (20);
  text ("Knock-knock joke", 100, 100);
  text ("The one about the", 520, 100);
  text ("vampires in a bar", 516, 115);
}

void pageFourteen()
{
  textSize (25);
  image(ghost, 180, 30);
  text ("knock-knock! ye say.", 320, 325);
  text ("'Whooooooooo's theeeeere?' yon ghostie asks ye.", 320, 350);
  text("Boo.", 320, 375);
  text ("'Boo whoooooooo?'", 320, 400);
  text ("Don't cry. The joke is over now.", 320, 425);
}

void pageFifteen()
{
  textSize (25);
  image (death, 180, 30);
  text ("'Did ye ever hear of the one with the three vampires in", 320, 340);
  text ("a bar?' ye ask. The ghost has heard it before and", 320, 365);
  text ("kills ye. Perhaps ye will attempt a", 320, 390);
  text ("more refined comedy next time around.", 320, 415);
  textSize (20);
  text ("Restart?", 100, 100);
}

void pageSixteen()
{
  textSize (25);
  image (stone, 180, 10);
  text ("Ye has pleased the ghostie! It chuckles eerily as it", 320, 340);
  text("gives you the Mysterious Stone! Ye have always", 320, 365);
  text ("wanted one! Ye pack it away in ye pocket to use as a", 320, 390);
  text ("paperweight when ye finally escape.", 320, 415);
  textSize (20);
  text ("Turn back", 100, 100);
}

void pageSeventeen()
{
  textSize (25);
  image (wizard, 200, 0);
  text("Ye open the door and bump right into a cloaked wizard!", 320, 340);
  text("Ye can tell by his pointy star hat. He looks quite", 320, 365);
  text("miffed. What wouldst thou do?", 320, 390);
  textSize (20);
  text ("Panic", 100, 100);
  text ("Keep calm", 500, 100);
}

void pageEighteen()
{
  textSize (25);
  image (wizard, 200, 0);
  text ("'Who's there?' the wizard barks. Ye didn't notice", 320, 340);
  text ("when ye nearly bowled him over, but this wizard be as", 320, 365);
  text ("blind as a bat! Lucky break. What wouldst thou do?", 320, 390);
  textSize (20);
  text ("Disguise ye voice", 100, 100);
  text ("Tell the truth", 500, 100);

}

void pageNineteen()
{
  textSize (25);
  image (wizard, 200, 0);
  text ("Pitching ye voice to a high shrill, ye find", 320, 340);
  text ("ye make a pretty convincing woman.", 320, 365);
  text ("What wouldst thou say to the wizard?", 320, 390);
  textSize (20);
  text ("I'm a lost", 100, 100);
  text ("scullery maid.", 97, 115);
  text ("I'm an old", 500, 100);
  text ("woman.", 502, 115);
}

void pageTwenty()
{
  textSize (25);
  image (wink, 200, 0);
  text ("'I be a lost scullery maid,' ye simper.", 320, 325);
  text ("The wizard raises his brows. 'Lost, ye say?' he purrs.", 320, 350);
  text ("'Perhaps I can be of...assistance.' His creepy subtext", 320, 375);
  text ("is not lost on ye. Ye quickly retreat to safety. Perhaps", 320, 400);
  text ("ye will use a better lie next time.", 320, 425);
}

void pageTwentyOne()
{
  textSize (25);
  image (wink, 200, 0);
  text ("'I do not remember, as I am senile old woman,' ye", 320, 325);
  text ("croak. The wizard raises his brows. 'Old, ye say?' he", 320, 350);
  text ("purrs. 'Perhaps I can help you...remember.' Ye", 320, 375);
  text ("are mightily grossed out. Ye quickly retreat to", 320, 400);
  text ("safety. Perhaps ye will use a better lie next time.", 320, 425);
}

void pageTwentyTwo()
{
  textSize (25);
  image (wizard, 200, 0);
  text ("'Ye are an escaping prisoner!' he barks.", 320, 340);
  text ("'Then are ye the knave who took my potion? I find", 320, 365);
  text ("that I am missing some.'", 320, 390);
  textSize (20);
  text ("No, I am a", 100, 100);
  text ("decent guy.", 100, 115);
  text ("Yes, I have a", 500, 100);
  text ("mild kleptomania.", 502, 115);

}


void pageTwentyThree()
{
  textSize (25);
  image (whale, 180, 40);
  text ("'Lies!' the wizard screams, and he turns you into a", 320, 375);
  fill (233, 255, 0);
  text ("WHALE.", 320, 400);
  textSize (20);
  fill (0, 225, 0);
  text ("WTF?", 100, 100);
  text ("Awesome!", 500, 100);

}

void pageTwentyFour()
{
  textSize (25);
  image (whale, 180, 40);
  text ("This was probably a mistake on the wizard's part,", 320, 325);
  text ("as he is instantly crushed under your bulk. Ye are", 320, 350);
  text ("squashed into the room most uncomfortably, and begin", 320, 375);
  text ("to sing a bitter whale song for there's no way ye are", 320, 400);
  text ("escaping now. Better luck next time.", 320, 425);
  textSize (20);
  text ("Restart?", 100, 100);
}


void pageTwentyFive()
{
  textSize (25);
  image (wizard, 200, 0);
  text ("Ye decide to go with honesty and tell the wizard about", 320, 340);
  text ("ye habit of theivery. 'No harm done,' the wizard says.", 320, 365);
  text ("'I can make more. But I've lot my pet snake Scratcy.", 320, 390);
  text ("'If ye find him for me, we will let bygones be bygonds.'", 320, 415);
  textSize (20);
  text ("Give him rope", 100, 100);
  text ("Turn back", 500, 100);
}

void pageTwentySix()
{
  textSize (25);
  image (kitty, 200, 30);
  text ("The wizard stands aside and ye pass though another", 320, 340);
  text ("door to another corridor of torches. Something mews", 320, 365);
  text ("at your feet. A baby kitten! What wouldst thou do?", 320, 390);
  textSize (20);
  text ("Adopt it", 100, 100);
  text ("Ditch it", 500, 100);
}

void pageTwentySeven()
{
  textSize (25);
  image (kitty, 200, 30);
  text ("The kitten follos you down the hall. It strikes you", 320, 340);
  text ("that a baby animal might make a great chick magnet,", 320, 365);
  text ("so you decide to let it tag along. Ye find another", 320, 390);
  text ("door ahead and ye enter to find...", 320, 415);
}

void pageTwentyEight()
{
  image(dragon, 100, 60);
  textSize(75);
  text ("DRAGON!!!", 320, 375);
}

void pageTwentyNine()
{
  textSize (25);
  image (dragon, 100, 60);
  text ("The dragon notices you. 'WANT GOLD,' he growls.", 320, 365);
  text ("Quick! What do ye do?", 320, 390);
  textSize(20);
  text ("Give it gold", 100, 100);
  text ("Stall for time", 500, 100);
}

void pageThirty()
{
  textSize (25);
  image (dragon, 100, 60);
  text ("Ah, of course! Now ye remember! Ye found ", 320, 340);
  text ("gold earlier when yeexplored the North", 320, 365);
  text ("corridor...Er, ye did, didn't ye?", 320, 390);
  textSize(20);
  text ("Fork it over!", 100, 100);
  text ("Uh...BRB.", 500, 100);
}

void pageThirtyOne ()
{
  textSize (25);
  image (dragon, 100, 60);
  text ("Ye do ye best Groucho Marx impression, but to no", 320, 340);
  text ("avail. 'WANT GOLD", 320, 365);
  textSize (55);
  text ("NOW!'", 340, 405);
  textSize (20);
  text ("Eep!", 100, 100);
}

void pageThirtyTwo()
{
  textSize (25);
  image (dragon, 100, 60);
  textAlign (CENTER);
  text ("'GIVE ME,' the dragon roars as he spots the gold. Ye", 320, 365);
  text ("quickly obey, but the dragon is still not satisfied.", 320, 390);
  text ("Best think of something fast, or ye be toast.", 320, 415);
  textSize(20);
  text ("Use potion", 100, 80);
  text ("Use kitty", 550, 80);
  text ("Use Stone", 320, 80);
}

void pageThirtyThree()
{
  textSize (25);
  image (gold, 200, 30);
  text ("Quickly ye rush to the North corridor and throw open", 320, 340);
  text ("the first door ye see. And thar be the gold! Ye hastily", 320, 365);
  text ("stuff the gold in ye bulging pockets and hustle back to", 320, 390);
  text ("the dragon. They are not very patient creatures.", 320, 415);
}

void pageThirtyFour()
{
  textSize (25);
  image (bunny, 150, 20);
  text ("The dragon swallows the potion whole. It coughs,", 320, 340);
  text ("and then...it transforms into a bunny rabbit! Huzzah!", 320, 365);
  text ("Now ye can put 'Dragon Slayer' on ye resume! It", 320, 390);
  text ("be close enough to the truth to ye standards, anyway.", 320, 415);
}

void pageThirtyFive()
{
  textSize (25);
  image (stone, 180, 10);
  text ("The dragon is distracted by the pretty sparkles", 320, 340);
  text ("of the stone. Ye streak out the door and run for", 320, 365);
  text ("ye very life, but ye make it out the opposite door.", 320, 390);
  text ("Ye wipe a silent tear for the loss of ye paperweight.", 320, 415);
}

void pageThirtySix()
{
  textSize (25);
  image (door, 250, 30);
  text ("Do ye knock first?", 320, 375);
  textSize (20);
  text ("Yea", 100, 100);
  text ("Nay", 500, 100);
}

void pageThirtySeven()
{
  textSize (25);
  image (cry, 200, 30);
  text ("The dragon snaps up the kitten in a single gulp.", 320, 340);
  text ("Ye use the oppertunity to dart past the dragon and", 320, 365);
  text ("escape out the door. Ye have escaped.", 320, 390);
  text ("Congratulations. Ye are now going to hell.", 320, 415);
}

void pageThirtyEight()
{
  textSize (25);
  image (door, 250, 30);
  text ("'Who is it?' a warm voice answers. It sounds like", 320, 340);
  text ("ye own grandma. Shall ye tell her ye are an", 320, 365);
  text ("escaping prisoner?", 320, 390);
  textSize (20);
  text ("Lie", 100, 100);
  text ("Truth", 500, 100);
}

void pageThirtyNine()
{
  textSize (25);
  image (cookies, 170, 20);
  text ("Ye say ye are a wandering marine biologist, and", 320, 340);
  text ("the voice says, 'Well, come in then.' Ye obey, and", 320, 365);
  text ("in the room is an old hag knitting by the fire.", 320, 390);
  text ("'Cookies?' she offers. What wouldst thou do?", 320, 415);
  textSize (20);
  text ("Cookies from a", 112, 100);
  text ("stranger? Verily not!", 108, 115);
  text ("What's the harm?", 500, 100);
}

void pageForty()
{
  textSize (25);
  image (door, 250, 30);
  text ("Silence. Did ye make a poor choice?", 320, 365);
  text ("Then, 'Well, come in then, dearie.'", 320, 390);
}

void pageFortyOne()
{
  image (cookies, 170, 20);
  text ("They are delicious. +5 yummy points.", 320, 375);
}

void pageFortyTwo()
{
  textSize (25);
  image (sweater, 180, 30);
  text ("The hag shrugs. 'Can I ask thee to put on this", 320, 340);
  text ("sweater for me? I need to judge the size.' Ye", 320, 365);
  text ("decide to agree, since she did offer ye cookies,", 320, 390);
  text ("though in truth, the sweater is revolting.", 320, 415);
  textSize (20);
  text ("Curse my", 100, 100);
  text ("excellent manners!", 96, 115);
  text ("Whatever.", 540, 100);
}

void pageFortyThree ()
{
  textSize (25);
  image (cookies, 170, 20);
  text ("Ye enter the room to find a hag at her", 320, 340);
  text ("knitting. She smiles at ye, and ye suppress", 320, 365);
  text ("a mighty sudder. 'Cookies?' she offers ye.", 320, 390);
  text ("Cookies from a", 112, 100);
  text ("stranger? Verily not!", 108, 115);
  text ("What's the harm?", 500, 100);
}

void pageFortyFour()
{
  textSize (25);
  image (sweater, 180, 30);
  text ("'I wonder if you would try this on for size, dearie,'", 320, 340);
  text ("the hag says, holding out a truly horrible sweater", 320, 365);
  text ("like a sinister pumpkin. It reminds ye want to retch.", 320, 390);
  text ("Will ye be polite to yon hag what gave ye cookies?", 320, 415);
  textSize (20);
  text ("Sure, why not?", 100, 100);
  text ("Not my color,.", 540, 100);
  text ("but okay.", 540, 115);
}

void pageFortyFive()
{
  textSize (25);
  image (death, 200, 30);
  text ("Perfect fit...no, ye suddenly find it tight...", 320, 340);
  text ("tighter...tighter, getting smaller! The hag cackles", 320, 365);
  text ("with wicked glee as the sweater constricts ye", 320, 390);
  text ("to a warm and snuggly death. Better luck next time.", 320, 415);
  textSize (20);
  text ("Restart?", 100, 100);
}

void pageFortySix()
{
  textSize (25);
  image (sweater, 180, 30);
  text ("Verily, it is a perfect fit. Ye suddenly remember ye", 320, 355);
  text ("earlier days, before ye kleptomania, when ye mama", 320, 380);
  text ("called ye her 'wittle pumpkin.' +8 snuggly points.", 320, 405);
  textSize (20);
  text ("Take thy leave", 100, 100);
}

void pageFortySeven()
{
  textSize (25);
  image (sweater, 200, 30);
  text ("The room is empty, save for a pair of knitting", 320, 340);
  text ("needles and a nearly finished sweater. Being no", 320, 365);
  text ("novice to yarn, ye quickly finish the sweater and try", 320, 390);
  text ("it on for size. Perfect fit. +8 snuggly points.", 320, 415);
  textSize (20);
  text ("Turn back", 100, 100);
}

void pageFortyEight()
{
  textSize (25);
  text ("Ye see sunlight further down the corridor as ye run.", 320, 340);
  text ("Freedom! Ye are surely nearly there! Ye reach a door", 320, 365);
  text ("and throw it open, stumbling out. But before ye", 320, 390);
  text ("can even blink, a voice clears it's throat behind ye.", 320, 415);
}

void pageFortyNine()
{
  textSize (25);
  image (fairy, 250, 36);
  text ("Gasp! It is ye fairy godmother! Ye have not seen her", 320, 340);
  text ("since the glass slipper fiasco! 'Hello, dear,' she says.", 320, 365);
  text ("Congratulatons on your escape from the dungeon.", 320, 390);
  text ("You have made me very proud, and deserve a reward.'", 320, 415);
}

void pageFifty()
{
  textSize (25);
  image (fairy, 250, 36);
  text ("'But how did you escape the dragon?' she asks,", 320, 340);
  text ("a steely glint in her eye. Ye know better than", 320, 365);
  text ("to lie. How did ye best the dragon?", 320, 390);
  textSize(20);
  text ("Potion", 100, 100);
  text ("Stone", 320, 30);
  text ("Kitty", 500, 100);
}

void pageFiftyOne()
{
  textSize (25);
  image (fairy, 250, 36);
  text ("'Clever,' she says with a smile. 'Your reward shall", 320, 345);
  text ("reflect your spunky, unorthadox nature.' She waves", 320, 370);
  text ("her magic wand and...POOF!!", 320, 395);
}

void pageFiftyTwo()
{
  textSize (25);
  image (fairy, 250, 36);
  text ("'How noble of you to sacrifice your treasure", 320, 340);
  text ("in the place of your kitty friend,' she says.", 320, 365);
  text ("'Your reward shall make up for your loss in", 320, 390);
  text ("plenty.' She waves her wand and...POOF!!", 320, 415);
}

void pageFiftyThree()
{
  textSize (25);
  image (fairy, 250, 36);
  text ("Ye godmother sighs. 'You have disappointed me,'", 320, 340);
  text ("she says. 'Yet your honesty does count for", 320, 365);
  text ("something. You will have the chance to atone", 320, 390);
  text ("for your misdeed.' She waves her wand...POOF!!", 320, 415);
}

void pageFiftyFour()
{
  textSize (25);
  image (bard, 85, 20);
  text ("You have recieved a full scholarship to", 320, 335);
  fill (233, 255, 0);
  text ("BARD COLLEGE.", 320, 360);
  fill (0, 255, 0);
  text ("Verily, Tewksbury shall hold no surprises for thee", 320, 385);
  text (" now, as ye have escaped...", 320, 410);

}

void pageFiftyFive()
{
  textSize (25);
  image (king, 200, 20);
  text ("Ye are now the king of the land! No more", 320, 325);
  text ("must ye fear being thrown in the dungeon, for", 320, 350);
  text ("now it is THINE dungeon! Ye are now free to", 320, 375);
  text ("steal as much as ye like--for ye are king!", 320, 400);
  text ("And ye have escaped...", 320, 425);
}

void pageFiftySix()
{
  textSize (25);
  image (cat, 180, 20);
  text ("Ye have been transformed into a kitten! Oh how", 320, 340);
  text ("the backslap of divine justice stings! Now ye must", 320, 365);
  text ("wander the earth saving other cats from trees", 320, 390);
  text ("until ye have atoned. But at least ye have escaped...", 320, 415);
}

void pageFiftySeven()
{ 
  textSize (25);
  image (logo, 0, 0);
  text ("THE", 320, 130);
  textSize (155);
  text ("Dungeon", 320, 300);
  textSize (20);
  text ("Play again?", 580, 470);
}

void pageFiftyEight()
{
  textSize (25);
  text ("Ye do not have gold, ye forgetful loon!", 320, 365);
}

void pageFiftyNine()
{
  textSize (25);
  text ("Ye do not possess such an object!", 320, 340);
  text ("Are ye trying to pull a fast one?", 320, 365);
  text ("Ye have ticked me off! Back to the beginning", 320, 390);
  text ("ye go! Youngsters these days....", 320, 415);
}

void pageSixty()
{
  image (door, 250, 30);
  textSize(25);
  text ("The door be locked up now! Go somewhere else!", 320, 365);
}

void pageSixtyOne()
{
  image (door, 250, 30);
  textSize(25);
  text ("The door be locked up now! Go somewhere else!", 320, 365);
}

void pageSixtyTwo()
{
  textSize (25);
  image (fairy, 250, 36);
  text ("Ye fairy godmother shakes her head in anger.", 320, 340);
  text ("'You would think getting this far would have taught", 320, 365);
  text ("you the importance of honesty!' She waves her wand.", 320, 390);
  text ("'Let this teach you that lesson!'", 320, 415);
}
  

