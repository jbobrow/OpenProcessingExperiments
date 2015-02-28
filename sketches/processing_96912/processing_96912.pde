
PImage talking;
PImage AT;

PImage hero;
PImage snake;
PImage box;
PImage Granny;
PImage Beach;
PImage EvilLair;
PImage Forest;
PImage PRINCESS;
PImage BODYBUILDER;
PImage Island;
PImage Med;
PImage Moutians;
PImage Rat;
PImage Town;
PImage arrow;
PImage mAP;
PImage go;
PImage shopGuy;
PImage backT;

int page;
PFont fontSTART;
PFont fontSPEAK;
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
 Button AttackBox;
 Button MapButton;
 Button NextFour;
 Button MeddowButton;
 Button TownButton;
 Button AttackSalesman;
 Button TalkSales;
 Button ForestButton; 
 Button SnakeButton;
 Button MoutiansButton;
 Button IslandButton;
 Button LairButton;
 Button RatButton;
 Button PrincessButton;
 Button  GYMButton;
 Button BuilderButton;
 
 
 void setup(){
background(0);
size(900, 700);
hero = loadImage("hero.png");
box = loadImage("box.png");
BODYBUILDER = loadImage("BODYBUILDER.png");
Granny = loadImage("Granny.png");
arrow = loadImage("arrow.png");
Beach = loadImage("Beach.png");
EvilLair = loadImage("EvilLair.png");

Island = loadImage("Island.png");
Med = loadImage("Med.png");
Moutians = loadImage("Moutians.png");
Town = loadImage("Town.png");
Forest = loadImage("Forest.png");
talking = loadImage("talking.png");
shopGuy = loadImage("shopGuy.png");
backT = loadImage("backT.png");
snake = loadImage("snake.png");


fontSTART = loadFont("ArabicTypesetting-100.vlw");
fontSPEAK = loadFont("ArabicTypesetting-48.vlw");
 font2 = loadFont("ArabicTypesetting-20.vlw");
 
textFont(fontSTART);
Rat = loadImage("Rat.png");
talking = loadImage("talking.png");
AT= loadImage("AT.png");
mAP = loadImage("MAP.png");
go = loadImage("go.png");
PRINCESS = loadImage("PRINCESS.png");

  page = 1;
 start = new Button(330, 300, 210, 70, 2);
 GTALK = new Button (640, 530, 20, 20, 6);
 next = new Button(20, 650, 45,45, 3);
move = new Button (50, 650, 45,45, 33);
attackG = new Button (590, 530, 20, 20, 5);
restart = new Button(530, 250, 150, 45, 1);
BOXB = new Button(500, 200, 90, 90, 6);
NextThree = new Button(200, 200, 45,45, 0);
NextFour = new Button(500, 500, 45, 45, 4);
RestartOne = new Button (450, 240, 130, 50, 1);
AttackBox = new Button (300, 520, 20, 20, 7);
MapButton = new Button (100, 100, 50, 50, 8);
MeddowButton = new Button (70, 10, 20, 20, 7);
TownButton = new Button(150, 10, 20, 20, 9);
AttackSalesman = new Button (700, 400, 20, 20, 10);
TalkSales = new Button (750, 400, 20, 20, 11);
ForestButton = new Button ( 250, 10, 20, 20, 12);
SnakeButton = new Button (500, 400, 20, 20, 13);
MoutiansButton = new Button (30, 300, 20, 20, 14);
IslandButton = new Button(570, 20, 20, 20, 15);
 LairButton = new Button (600, 490, 20,20 ,16);
 RatButton = new Button (450, 500, 20, 20, 17);
 PrincessButton = new Button( 600, 400, 20, 20, 18);
 GYMButton = new Button ( 360, 50, 20, 20, 19);
 BuilderButton = new Button(300, 350, 20, 20,20);
 // start = new StartButton(100, 150, 500);
}

void draw() {
 
 start.update();
  start.display();
  start.press();
  start.release();
  
    
  //opening page with start button
  
  if(page == 0){
    pageZero();
    NextFour.update();
     NextFour.display();
  NextFour.press();
 NextFour.release();
  }
  
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
    AttackBox.update();
    AttackBox.display();
    AttackBox.press();
    AttackBox.release();
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
    AttackBox.update();
    AttackBox.display();
    AttackBox.press();
    AttackBox.release();
}
if(page == 7){
  pageSeven();
  MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
  
  
  attackG.update();
  attackG.display();
  attackG.press();
  attackG.release();
}
if(page == 8){
  pageEight();
  
   MeddowButton.update();
MeddowButton.display();
  MeddowButton.press();
  MeddowButton.release();
  TownButton.update();
TownButton.display();
TownButton.press();
TownButton.release();
ForestButton.update();
ForestButton.display();
ForestButton.press();
ForestButton.release();
MoutiansButton.update();
MoutiansButton.display();
MoutiansButton.press();
MoutiansButton.release();
IslandButton.update();
IslandButton.display();
IslandButton.press();
IslandButton.release();
LairButton.update();
LairButton.display();
LairButton.press();
LairButton.release();

GYMButton.update();
GYMButton.display();
GYMButton.press();
GYMButton.release();
}
if(page ==9){
  pageNine();
  MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
    AttackSalesman.update();
 AttackSalesman.display();
  AttackSalesman.press();
   AttackSalesman.release();
   
    TalkSales.update();
  TalkSales.display();
  TalkSales.press();
  TalkSales.release();
}
if(page == 10){
  pageTen();
 RestartOne.update();
RestartOne.display();
RestartOne.press();
RestartOne.release();
}
if(page == 11){
  pageEleven();
  MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
    AttackSalesman.update();
 AttackSalesman.display();
  AttackSalesman.press();
   AttackSalesman.release();
}

if(page == 12){
  pageTwelve();
   MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
  SnakeButton.update();
  SnakeButton.display();
  SnakeButton.press();
 SnakeButton.release();
}

if(page == 13){
  pageThirteen();
  RestartOne.update();
RestartOne.display();
RestartOne.press();
RestartOne.release();
}
if(page == 14){
  pageFourteen();
     MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
  
}
if(page == 15){
  pageFifteen();
     MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
}
 if(page == 16){
   pageSixteen();
   MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
  RatButton.update();
RatButton.display();
 RatButton.press();
RatButton.release();
  PrincessButton.update();
  PrincessButton.display();
 PrincessButton.press();
  PrincessButton.release();

}
if(page == 17){
  pageSeventeen();
   MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
    RatButton.update();
  RatButton.display();
 RatButton.press();
RatButton.release();
      PrincessButton.update();
  PrincessButton.display();
 PrincessButton.press();
  PrincessButton.release();
}
if(page == 18){
  pageEighteen();
   MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
   RatButton.update();
  RatButton.display();
 RatButton.press();
RatButton.release();
 PrincessButton.update();
  PrincessButton.display();
 PrincessButton.press();
  PrincessButton.release();
}
if(page == 19){
  pageNineteen();
   MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
  
BuilderButton.update();
  BuilderButton.display();
  BuilderButton.press();
  BuilderButton.release();
}
if(page == 20){
  pageTwenty();
   MapButton.update();
  MapButton.display();
  MapButton.press();
  MapButton.release();
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
    AttackBox.press();
  
  }
  if (page ==5){
    RestartOne.press();
  }
  if (page ==6){
    GTALK.press();
    attackG.press();
    AttackBox.press();
  }
  if (page ==7){
    attackG.press();
    MapButton.press();
  }
  if (page == 0){
    NextFour.press();
  }
  if (page == 8){
    MeddowButton.press();
     TownButton.press();
     ForestButton.press();
MoutiansButton.press();
IslandButton.press();
LairButton.press();
GYMButton.press();


  }
  if(page == 9){
  MapButton.press();
  AttackSalesman.press();
   TalkSales.press();
 
 }
 if(page == 10){
   RestartOne.press();
 }
 
 if(page == 11){
    MapButton.press();
  AttackSalesman.press();
 }
 if(page == 12){
   MapButton.press();
    SnakeButton.press();
 }
 if(page == 13){
   RestartOne.press();
 }
 if(page == 14){
     MapButton.press();
 }
 if(page == 15){
  MapButton.press(); 
 }
 if(page == 16){
     MapButton.press();
      RatButton.press();
       PrincessButton.press();
 

 }
 if(page == 17){
   MapButton.press();
    PrincessButton.press();
     RatButton.press();
  
 }
 if(page == 18){
   MapButton.press();
    PrincessButton.press();
     RatButton.press();
 }
if(page == 19){
  MapButton.press();
    BuilderButton.press();
 
}
  if(page == 20){
   MapButton.press();
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
   AttackBox.release();
}
if (page == 5){
RestartOne.release();
}
if (page == 6){
  GTALK.release();
  attackG.release();
  AttackBox.release();
}
if(page == 7){
  attackG.release();
  MapButton.release();
}
if(page == 0){
  NextFour.release();
}
if(page == 8){
  MeddowButton.release();
   TownButton.release();
   MoutiansButton.release();
   IslandButton.release();
   LairButton.release();
   GYMButton.release();
}
if(page == 9){
  MapButton.release();
  AttackSalesman.release();
  TalkSales.release();
  ForestButton.release();
}

if(page == 10){
  RestartOne.release();
}

if(page == 11){
   MapButton.release();
  AttackSalesman.release();
}

if(page == 12){
  MapButton.release();
   SnakeButton.release();
}
if(page == 13){
  RestartOne.release();
}
if(page == 14){
    MapButton.release();
}
if(page == 15){
 
  MapButton.release();
}
if(page == 16){
    MapButton.release();
    RatButton.release();
    PrincessButton.release();
}
if(page == 17){
  
  PrincessButton.release();
  MapButton.release();
  RatButton.release();
   
}
if(page == 18){
 PrincessButton.release();
  MapButton.release();
  RatButton.release();
}
if(page == 19){
  MapButton.release();
   BuilderButton.release();
}
if(page == 20){
  MapButton.release();
}
   
}

//PAGE ONE-------------------------------------------------------
  void pageOne(){
    textFont(fontSTART);
    background(0);
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
     textFont(fontSTART);
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
    textFont(fontSTART);
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
      textFont(fontSTART);
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
image(Granny, 590, 150, 100, 150);
 textFont(fontSPEAK);

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

image(Granny, 590, 550, 100, 150);

 textFont(font2);
  fill(255);
   rect(300, 50, 250, 150);
   fill(0);
   text("Hello I am Granny Magepie, I will teach ", 310, 70);
   text("you how to finght in this magic world. To", 310, 95);
   text("attack click the attack icon above your ", 310,120);
   text("Opponent, why not try attacking that crate?", 310, 145);
 }

    
 //Page SEVEN (did not attack Granny)------------------------------
 void pageSeven(){
background(54, 208, 252);
fill(6, 90, 15);
  rect(0,600 ,900, 600);
  fill(255);
  
 textFont(font2);

 
image(hero, mouseX, 550);

//Granny buttons
image(AT ,590, 530, 20, 20);
image(Granny, 590, 550, 100, 150);


 
   rect(300, 50, 250, 150);
   fill(0);
   text("  Good now that you have taken", 310, 70);
   text("granny's battle class you pay ", 310, 95);
   text("99 gold and are free to explore!!!", 310,120);
   text("", 310, 145);
   image(Granny, 590, 550, 100, 150);
   image(mAP,  100, 100, 50, 50);
   
 }
 //MAP ------------------------------------------------------
 void pageEight(){
      
   background(190, 193, 18);
size(900, 700);
fill(2, 62, 124);
ellipse(600, 150, 400, 400);
 image(go, 70, 10, 20, 20);
  image(Med, 20, 20 ,120, 90);
  
  image(go, 150, 10, 20, 20);
  image(Town, 120, 20 ,95, 90);
  
  image(go, 250, 10, 20, 20);
  image(Forest, 220, 20, 95, 90);
  
  image(go, 570, 20, 20, 20);
  image(Island, 550, 60, 95, 90);
  
  image(go, 360, 50, 20, 20);
  image(Beach, 320, 75, 95, 90);
  
  image(go, 30, 300, 20, 20);
  image(Moutians, 5, 90, 300, 220);
  
 image(go, 600, 490, 20, 20);
  image(EvilLair, 600, 500, 150, 120);
 }
 //icons page
 void pageZero(){
   size(900, 700);
   background(255);
   
AT= loadImage("AT.png");
arrow = loadImage("arrow.png");
image(AT, 100, 100, 100, 100);
fill(0);
text("This means attack", 200, 200);
image(talking, 300, 300, 100, 100);
text("this means Talk", 400, 400);
image(arrow, 500, 500, 45, 45);
 }
 
 //ENTERING TOWN++++++++++++++++++++++++++++++++++++++++++++++++++++
  void pageNine(){
    background(23, 107, 193);

//street
fill(95, 95, 95);
  rect(0,600 ,900, 600);


//SHOP GUY buttons
image(backT, 0, 100, 900, 500);


image(hero, mouseX, 550);
image(AT ,700, 400, 20, 20);
image(talking, 750, 400, 20, 20);
image(shopGuy, 650, 450, 170, 250);
image(mAP,  100, 100, 50, 50);
  }
  // KILLED BY SALES MAN ++++++++++++++++++++++++++++++++++++++
 
 void pageTen(){
    textFont(fontSPEAK);
  background(137,7,7);
image(shopGuy, 650, 0, 170, 250);
   fill(0);
   rect(450, 240, 130, 50);
   fill(255);
   text("Next",480, 275);
   
   text("You were killed by the really awesome sword, ", 10,65);
  text("idiot.", 10, 125);
 }
//Talking to salesman++++++++++++++++++++++++++++++++++++ 
 void pageEleven(){
   background(23, 107, 193);

//street
fill(95, 95, 95);
  rect(0,600 ,900, 600);
 


//SHOP GUY buttons
image(backT, 0, 100, 900, 500);
image(hero, mouseX, 550);
image(AT ,700, 400, 20, 20);
image(shopGuy, 650, 450, 170, 250);
image(mAP,  100, 100, 50, 50);
 fill(255);
rect(300, 50, 250, 150);
fill(0);
   text("Hello warrior can I interest you in some ", 310, 70);
   text("license- free-murdering -supplies?",310, 95);
   text("Only 9,999 gold for this really awesome ", 310,120);
   text("sword!!!!", 310, 145);
 }
 //the deadly forest%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 void pageTwelve(){
background(0);
size(900, 700);
textFont(font2);
background(23, 107, 193);
//street
fill(70, 124, 74);
  rect(0,500 ,900, 500);
image(hero, mouseX, 450);
   fill(160, 59, 19);
   rect(100, 10, 20, 700);
   fill(9, 100, 26);
   ellipse(100, 100, 200, 200);
 image(mAP,  100, 100, 50, 50);
 fill(160, 59, 19);
   rect(300, 30, 20, 700);
   fill(9, 100, 26);
   ellipse(300, 100, 200, 200);
   fill(160, 59, 19);
   rect(550, 30, 20, 700);
   fill(9, 100, 26);
   ellipse(550, 100, 200, 200);
      fill(160, 59, 19);
   rect(700, 30, 20, 700);
   fill(9, 100, 26);
   ellipse(700, 100, 200, 200);
    fill(160, 59, 19);
   rect(900, 30, 20, 700);
   fill(9, 100, 26);
   ellipse(900, 100, 200, 200);
   fill(255);
   rect(300, 55, 190, 20);
   fill(0);
   text("THE DEADLY FOREST!!!!!!", 310, 70);
   //snake buttom
   image(snake, 500, 450, 200, 100);
     image(AT, 500, 400, 20, 20); 
 }
  //Killed by snake %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 void pageThirteen(){
   textFont(fontSPEAK);
    background(137, 7,7);
size(900, 700); 
  text("    Deadly forest … what part of that didn't you understand", 10,65);


  
image(snake, 500, 450, 200, 100);
fill(0);
   rect(450, 240, 130, 50);
   fill(255);
   text("Next",480, 275);
 }
  
  //Mountiane %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
  void pageFourteen(){
    background(23, 107, 193);
textFont(font2);
//street
fill(142, 137, 137);
  rect(0,400 ,900, 600);
  ellipse(600, 400, 200, 200);
 

image(hero, mouseX, 350);
image(mAP,  100, 100, 50, 50);
 fill(255);
 
 
 
rect(300, 50, 250, 50);
fill(0);
   text("A giant bolder blocks you from going", 310, 70);
   text("deeper into the mountain…. lol!",310, 95);
  }
  // PAGEFIFTEEN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
  
  void pageFifteen(){
textFont(fontSTART);
background(64, 8, 255);

image(hero, mouseX, 640);
image(mAP,  100, 100, 50, 50);
 
 
 fill(255);
   text("you have no boat...", 200, 70);
  }
  
 //EVIL LAIR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 void pageSixteen(){
      textFont(fontSTART);
background(235, 232, 245);
 fill(246, 255, 10);
   rect(0, 500, 900, 200);

image(hero, mouseX, 440);
image(mAP,  100, 100, 50, 50);

image(talking, 600, 400, 20, 20);
image(PRINCESS, 600, 440);

image(AT, 450, 500, 20, 20);
image(Rat, 400, 500);
 fill(0);
   text("THE BOSS STAGE !!!!", 200, 70);
   
 }
 //ATTACK RAT
 void pageSeventeen(){
    textFont(fontSTART);
background(235, 232, 245);
 fill(246, 255, 10);
   rect(0, 500, 900, 200);

image(hero, mouseX, 440);
image(mAP,  100, 100, 50, 50);

image(talking, 600, 400, 20, 20);
image(PRINCESS, 600, 440);

image(AT, 450, 500, 20, 20);

image(Rat, 400, 500);

 
 fill(255);
 rect (295, 285, 155, 20);
 fill(0);
   text("THE BOSS STAGE !!!!", 200, 70);
   
   
   textFont(font2);
   
   text("ouch….no...that was weak", 300, 300);
  }
  
  void pageEighteen(){
       textFont(fontSTART);
background(235, 232, 245);
 fill(246, 255, 10);
   rect(0, 500, 900, 200);

image(hero, mouseX, 440);
image(mAP,  100, 100, 50, 50);

image(talking, 600, 400, 20, 20);
image(PRINCESS, 600, 440);

image(AT, 450, 500, 20, 20);
image(Rat, 400, 500);

 
 fill(255);
 rect (595, 285, 205, 20);
 fill(0);
   text("THE BOSS STAGE !!!!", 200, 70);
   
   
   textFont(font2);
   
   text("I think we should see other people", 600, 300);
  }
  
  void pageNineteen(){
   textFont(font2);
    background(250, 255, 3);
//street
fill(255, 146, 3);
  rect(0,600 ,900, 600);
//SHOP GUY buttons
image(AT, 300, 350, 20, 20);
image(BODYBUILDER, 200, 350, 300, 300);

image(mAP,  100, 100, 50, 50);
   image(hero, mouseX, 550);
  }
  void pageTwenty(){
    textFont(font2);
    background(250, 255, 3);

//street
fill(255, 146, 3);
  rect(0,600 ,900, 600);
 


//SHOP GUY buttons
image(AT, 300, 350, 20, 20);
image(BODYBUILDER, 200, 350, 300, 300);

image(mAP,  100, 100, 50, 50);
 fill(255);
rect(300, 50, 350, 150);
fill(0);
   text("    As you begin to attack, the body builder stops you", 310, 70);
   text("He sits down with you and explains random Violence",310, 95);
   text("never helps you achieve your goals. You make plans to ", 310,120);
   text(" go clubbing after you kill the rat guy", 310, 145);
   image(hero, mouseX, 550);
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


