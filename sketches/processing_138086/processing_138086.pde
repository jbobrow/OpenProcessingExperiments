
//this game is still under the debug process!

int myState = 0;
PImage intro;
PImage journey;
PFont titan;
PImage horse;
PImage danger;
PImage blind;
PImage finish;
PImage ninja;
PImage win;
PImage lose;



void setup() {
size(800, 500);
background(0);
intro = loadImage("Intro.jpeg");
titan = createFont("Papyrus-48.vlw",28);
journey = loadImage("agro_canyon.jpg");
horse = loadImage("horse.jpeg");
danger = loadImage("encounter.jpeg");
blind = loadImage("swordblind.jpeg");
ninja = loadImage("sneakattack.jpeg");
finish = loadImage("headstab.jpeg");
win = loadImage("victory.jpeg");
lose = loadImage("squish.jpeg");
}



void draw() {
  switch(myState) {
    
    case 0:
    image(intro, 0, 0, width, height);
    textFont(titan, 48);
    fill(255, 0, 0);
    text("Face The", 60, 180);
    text("Colossus", 80, 240);
    textFont(titan, 16);
    text("Press the (s) key to Start!", 250, 400);
    
    break;
    
    case 1:
    image(journey, 0, 0, width, height);
    textFont(titan, 15);
    text("To save your beloved, you must be proven", 450, 40);
    text("worthy in the eyes of the Gods... Go forth", 450, 55);
    text("hero, and face the Colossus!" ,450, 70);
    textFont(titan, 12);
    text("[Press (h) to continue].", 460, 90);
    break;
    
   case 2:
   image(horse, 0, 0, width, height);
   textFont(titan, 15);
   text("A wild Colossus appeared!", 200, 40);
   text("What will you do?", 200, 55);
   text("A) Draw Bow & Arrow", 400, 40);
   text("B) Use Sword", 400, 55);
   text("C) Dash Between Legs", 400, 70);
   text("D) Stand Your Ground", 400, 85);
   
    
    break;
    
    case 3:
    
    image(danger, 0, 0, width, height);
    fill(255, 0, 0);
    textFont(titan, 20);
    text("It's about to attack! Time to make a move!", 50, 50); 
    textFont(titan, 16);
    text("w) Blind it with sword's power!", 10, 100);
    text("x) Dodge!", 10, 120);
    text("y) Shoot it's feet with bow and arrow!", 10, 140);
    text("z) Call for horse!", 10, 160);
    
    break;
    
    case 4:
    image(blind, 0, 0, width, height);
    fill(255);
    text("Excellent work, you've stunned it!", 20, 450);
   
    textFont(titan, 12);
    
    text("[Press (g) to continue!]", 20, 480);
    
    break;
    
    case 5:
    
    image(ninja, 0, 0, width, height);
    textFont(titan, 18);
    text("Now is your chance! Press (a) to climb onto it's head!", 300, 200);
    
    break;
    
    case 6:
    
    image(finish, 0, 0, width, height);
    textFont(titan, 26);
    text("Finish IT!!!", 50, 150);
    textFont(titan, 16);
    text("Press (b) to stab the head!", 50, 170);
    
    break;
    
    case 7: 
    
    image(win, 0, 0, width, height);
    textFont(titan, 18);
    fill(255, 0, 0);
    text("The Colossus has fallen. You have proven", 5, 100);
    text("your worth mortal.", 5, 115);
    break;
    
    case 8:
    
    image(lose, 0, 0, width, height) ;
    textFont(titan, 24);
    text("Game Over", 10, 40);
    fill(255);
    textFont(titan, 12);
    text("(Squish)", 10, 55);
    textFont(titan, 18);
    text("Try Again? (Press (R)", 400, 350);
   
   
   break;
    
  }
}
void keyPressed() {
  switch(key) {
  
  case 's':
  myState = 1;
  break;
  
  case 'h':
  myState = 2;
  break;
  
  case 'd':
  if (key != 'd') {
    myState = 8;
  } else if (key == 'd') {
    myState = 3;
  }
  break;
  
  case 'w':
  if (key != 'w') {
    myState = 8;
  } else if (key == 'w') {
    myState = 4;
  }
  break;
  
  case 'g': 
  myState = 5;
  break;
  
case 'a':
myState = 6;
break;

case 'b':
myState = 7;
break;

case 'r':
myState = 0;
break;
}
  

  
}



