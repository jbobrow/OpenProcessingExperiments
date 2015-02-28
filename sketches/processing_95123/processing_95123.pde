
PImage talking;
PImage AT;

PImage hero;
PImage box;
PImage Granny;
PImage Beach;
PImage EvilLair;
PImage Forest;
PImage GYM;
PImage Island;
PImage Med;
PImage Moutians;
PImage Rat;
PImage Town;
PImage arrow;

int page;
PFont font;
PFont font2;

Button start;
 Button next;
 Button move;
 Button attackG;
 Button restart;
 Button BOXB;
 Button NextThree;
 Button GTALK;
 Button RestartOne;
 
 
 void setup(){
background(0);
size(900, 700);
hero = loadImage("hero.png");
box = loadImage("box.png");
Granny = loadImage("Granny.png");
arrow = loadImage("arrow.png");
font = loadFont("ArabicTypesetting-100.vlw");
Rat = loadImage("Rat.png");
talking = loadImage("talking.png");
AT= loadImage("AT.png");
textFont(font);
  page = 1;
 start = new Button(330, 300, 210, 70, 2);
 GTALK = new Button (640, 530, 20, 20, 6);
 next = new Button(20, 650, 45,45, 3);
move = new Button (50, 650, 45,45, 33);
attackG = new Button (590, 530, 20, 20, 5);
restart = new Button(530, 250, 150, 45, 1);
BOXB = new Button(500, 200, 90, 90, 6);
NextThree = new Button(200, 200, 45,45, 4);
RestartOne = new Button (450, 240, 130, 50, 1);
 // start = new StartButton(100, 150, 500);
}

void draw() {
 
 start.update();
  start.display();
  start.press();
  start.release();
  
    
  //opening page with start button
  if(page == 1){
    pageOne();

  }
 //page with text and next 
  if(page == 2){
    pageTwo();
    next.update();
      next.display();
  next.press();
 next.release();
 //secound text page
  }
  if(page == 3){
    pageThree();
    move.update();
    move.display();
    move.press();
    move.release();
  }
  
  if(page == 33){
    pageThreeThree();
    NextThree.update();
    NextThree.display();
     NextThree.press();
     NextThree.release();
  }
  if(page == 4){
    pageFour();
    attackG.update();
    attackG.display();
    attackG.press();
    attackG.release();
    BOXB.update();
    BOXB.display();
    BOXB.press();
    BOXB.release();
     GTALK.update();
    GTALK.display();
   GTALK.press();
    GTALK.release();
  }
    
    

if( page ==5){
  pageFive();
RestartOne.update();
RestartOne.display();
RestartOne.press();
RestartOne.release();
}

if(page == 6){
  pageSix();
   attackG.update();
    attackG.display();
    attackG.press();
    attackG.release();
    BOXB.update();
    BOXB.display();
    BOXB.press();
    BOXB.release();
     GTALK.update();
    GTALK.display();
   GTALK.press();
    GTALK.release();
}
}


void mousePressed(){
  start.press();
  if (page == 2){
    next.press();
  }
  //AMANDA I ADDED THIS
  if (page == 3){
    move.press();
  }
  
  if(page == 33){
     NextThree.press();
  }
  if (page == 4){
    attackG.press();
    BOXB.press();
    GTALK.press();
  }
  if (page ==5){
    RestartOne.press();
  }
  if (page ==6){
    GTALK.press();
    attackG.press();
  }
}

void mouseReleased(){
  start.release();
  if (page == 2){
   next.release();
  }
  //AMANDA - I ADDED THIS
  if(page == 3){
    move.release();
}

if(page == 33){
   NextThree.release();
}
if(page ==4){
  attackG.release();
  BOXB.release();
  GTALK.release();
}
if (page == 5){
RestartOne.release();
}
if (page == 6){
  GTALK.release();
  attackG.release();
}
}

//PAGE ONE-------------------------------------------------------
  void pageOne(){
fill(0, 247, 14);
    fill(255);
    text("Gettalife", 320, 280); 
    //start = new StartButton(100, 150, 500);
      fill(0, 247, 14);
    rect (330, 300, 210, 70);
    fill(0);
    text("START", 330, 360);
 
  

    
    }

  //Page Two---------------------------------------------------------
  void pageTwo(){
    
     fill(0);
   background(0);
    fill(247);
text("Welcome the enchanted land", 30, 60);
text("of Gettalife. You are a brave", 30 ,125);
text("warrior who needs to rescue  ", 30,190);
text("his princess. Yes, you are a ", 30, 255);
text("guy, females die too easily in ", 30, 320);
text("combat. Not for lack of skill", 30, 385);
text("mind you, simply because all", 30, 450);
text("female armor only covers their", 30, 515);
text("chest and pelvis...", 30, 580);
  image(arrow, 20, 650, 45,45);
  
   
  }
  //PAGE Three----------------------------------------------------------
  
  void pageThree(){
 background(0);
    fill(247);
     fill(0);
   background(0);
    fill(247);
 text("Swimsuit armor...not the", 30, 60);
text("greatest invention, but...", 30 ,125);
text("whatever.You need to save her ", 30,190);
text("because she is like the  only", 30, 255);
text("female left in the kingdom.", 30, 320);
text("All the others…. Well you ", 30, 385);
text("heard about the armor thing", 30, 450);
text("She has been kidnapped by ", 30, 515);
text("the evil emperor ...", 30, 580);
 image(arrow, 50, 650, 45,45);

   
   
 

  }
  //Page Three Three---------------------------------------------------
  void pageThreeThree(){
     background(0);
    fill(247);
text("Tenbillionouspowerous! He is ", 30, 60);
text("a d*uche bag. You need to go ", 30 ,125);
text("save the princess chick ", 30,190);
image(Rat, 300, 230, 400, 300);

 image(arrow, 200, 200, 45,45);
  
  }
  
  //Page Four--------------------------------------------------- Hero in filed 

  void pageFour(){
background(54, 208, 252);
fill(6, 90, 15);
  rect(0,600 ,900, 600);
image(hero, mouseX, 550);
//box button
image(box, 300, 550, 90, 90);
image(AT ,300, 520, 20, 20);
//Granny buttons
image(AT ,590, 530, 20, 20);
image(talking, 640, 530, 20, 20);
Granny = loadImage("Granny.png");
image(Granny, 590, 550, 100, 150);
 
    }
    // Page Five------------------------------------------------------Granny Death
  void pageFive(){  
    
background(137, 7,7);
 

Granny = loadImage("Granny.png");
image(Granny, 590, 150, 100, 150);

 font = loadFont("ArabicTypesetting-48.vlw");
 textFont(font);
 

  text("You were violently murdered by Granny Megpie,", 10,65);
  text("becoming a joke of the town as, that guy who", 10, 125);
  
  text("got round housed kicked by as 98 ", 10, 185);
   text("year old woman ", 10, 245);
   fill(0);
   rect(450, 240, 130, 50);
   fill(255);
   text("Next",480, 275);
  }
  
//Page SIX (did not attack Granny)----------------------------------------


    void pageSix(){
background(54, 208, 252);
fill(6, 90, 15);
  rect(0,600 ,900, 600);
image(hero, mouseX, 550);
//box button
image(box, 300, 550, 90, 90);
image(AT ,300, 520, 20, 20);
//Granny buttons
image(AT ,590, 530, 20, 20);
image(talking, 640, 530, 20, 20);
Granny = loadImage("Granny.png");
image(Granny, 590, 550, 100, 150);
 font2 = loadFont("ArabicTypesetting-20.vlw");
 textFont(font2);
  fill(255);
   rect(300, 50, 250, 150);
   fill(0);
   text("Hello I am Granny Magepie, I will teach ", 310, 70);
   text("you how to finght in this magic world. to", 310, 95);
   text("attack  right click on the thing you wish", 310,120);
   text("to battle, why not try attacking that crate?", 310, 145);
 }

    
 //Page SEVEN (did not attack Granny)----------------------------------------
 void pageSeven(){
   
   background(190, 193, 18);
size(700, 300);
fill(2, 62, 124);
ellipse(600, 150, 400, 400);
Beach = loadImage("Beach.png");
EvilLair = loadImage("EvilLair.png");
GYM = loadImage("GYM.png");
Island = loadImage("Island.png");
Med = loadImage("Med.png");
Moutians = loadImage("Moutians.png");
Town = loadImage("Town.png");
Forest = loadImage("Forest.png");
   
     image(Med, 20, 20 ,120, 90);
  image(Town, 120, 20 ,95, 90);
  image(Forest, 220, 20, 95, 90);
  image(Island, 550, 60, 95, 90);
  image(Beach, 320, 75, 95, 90);
  image(Moutians, 5, 90, 300, 220);
  image(EvilLair, 300, 200, 150, 120);
   
 }
  
  
  
  
  
  
  
  
  
  
  
  
 // BUTTON ***********************************************   
  class Button {
 
  int x, y; // The x- and y-coordinates
  int w, h;//the width and height of button
 // int size; // Dimension (width and height)
 
 //page variable
 int p;
  
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed

  Button(int xp, int yp, int wp, int hp, int pp) {
    x = xp;
    y = yp;
    w = wp;
    h = hp;
    p = pp;

    
  }
  
  // Updates the over field every frame
  void update() {
    if (mouseX > x && mouseX < x + w &&
        mouseY > y && mouseY <= y + h) {
      over = true;
    } else {
      over = false;
    }
  }

  boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } else {
      return false;
    }
  }

  void release() {
    pressed = false; // Set to false when the mouse is released
   // one.display();
  }

  void display() {  
    if (pressed == true) {
    page = p;
    }
   //  else if(over=true){
      // page =2;
    // }
   //  else{
      // page=1;
     //}
    
      
    } 
 }


