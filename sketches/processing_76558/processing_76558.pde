
/*

TITLE
Veni Vidi Venice

DESCRIPTION
This game is meant to present a funny take on hazards and difficulties
that a student encounters when coming for the first time in Venice.
The game itself is composed of four different levels each with a different gameplay.

MADE BY
Federica Di Leo, Manfredi Pumo, Chiara Contrino

19 October 2012


*/
void draw() {


  if (keyPressed) {
    if (key == '0') {
      gameLevel=0;
    }
    if (key == '1') {
      gameLevel=1;
    }
    if (key == '2') {
      gameLevel=2;
    }
    if (key == '3') {
      gameLevel=3;
    }
    if (key == '4') {
      gameLevel=4;
    }
  }


  if (gameLevel == -1) {
    startScreen();
  }

  if (gameLevel == 0) {   
    level0();
  }
  if (gameLevel == 1) {
    level1();
  }
  if (gameLevel == 2) {
    level2();
  }
  if (gameLevel == 3) {
    level3();
  }
  if (gameLevel == 4) {
    level4();
  }
  if (gameLevel == 5) {
    endScreen();
  }

  noCursor();

  image(curs[cu], mouseX, mouseY);

  /* fill(0);
   rect(0,0,400,50);
   fill(255);
   textSize(30);
   text(cu, 20, 20 ); */
}

void endScreen() {

  image(endScreen, 0, 0);

  timeW[5]++;
  if (timeW[5] >= 150) { 
    gameLevel=-1;
  }
}

void level0() {

  cu=0;
  
  checkKeys();
  checkState();

  background(255);

  // background

  for (int i=0; i < 2; i = i + 1)

  { 
    image(level0bkg, bkgX+(bkgLength*i), 0);
  } 

  // floor

  fill(0);
  noStroke();
  rectMode(CORNERS);
  rect(0, floorHeight, width, height);

  // tokens

  tokenX = bkgX*tokenParallax;

 for (int tk=1; tk < 5; tk++)

 { if (levelWon[tk-1]==true && levelWon[tk]==false) {
      
    image(token[tk], tokenX+tokenDist*tk, tokenY, tokenSize, tokenSize);
   
    if (manX+manWidth/2>tokenX+tokenDist*tk && manX+manWidth/2<tokenX+tokenDist*tk+tokenSize && manY>tokenY && manY<tokenY+tokenSize) {
       gameLevel=tk; manX=manX+70;
    }
  } 

  if (levelWon[tk-1]==false) { 
    image(tokenGray[tk], tokenX+tokenDist*tk, tokenY, tokenSize, tokenSize);
  }

  if (levelWon[tk]==true) {
    image(token[tk], tokenX+tokenDist*tk, tokenY, tokenSize, tokenSize);
    image(check, tokenX+tokenDist*tk+60, tokenY);
    
     /* if (manX+manWidth/2>tokenX+tokenDist*tk && manX+manWidth/2<tokenX+tokenDist*tk+tokenSize && manY>tokenY && manY<tokenY+tokenSize) {
     gameLevel=tk; manY=manYpos;
    } */
     
  }   }


  //character

  if (dirState == "right") {

    image(manR[walkIndexR], manX, manY, manWidth, manHeight);
  }  

  else  if (dirState == "left") {

    image(manL[walkIndexL], manX, manY, manWidth, manHeight);
  }  

  else if (chillState == "right") {  
    image(manR[0], manX, manY, manWidth, manHeight);
  }
  else if (chillState == "left") {  
    image(manL[0], manX, manY, manWidth, manHeight);
  }

}

void runRight()
{ 
  if (manX+manWidth<width && (manX+manWidth/2<=width/2 || bkgX<=-levelLength))
  {
    dirState = "right";
    manX+= manSpeed;
  } 
  else if (bkgX>=-levelLength && (manX+manWidth/2>=width/2 && manX+manWidth<width))
  {
    dirState = "right";
    bkgX -= manSpeed;
  }

  timeR++;

  if (timeR % 10 == 0) { 
    walkIndexR++;
  }

  if (timeR >= 40) {
    timeR = 0; 
    walkIndexR = 1;
  }
}


void runLeft() {
  if (manX>0 && (manX+manWidth/2>=width/2 || bkgX>=0) ) {
    dirState = "left";
    manX-= manSpeed;
  } 

  else if (bkgX<=0 && (manX+manWidth/2<=width/2 && manX>0)) {
    dirState = "left";
    bkgX += manSpeed;
  } 

  timeL++;

  if (timeL % 10 == 0) { 
    walkIndexL++;
  }

  if (timeL >= 40) {
    timeL = 0; 
    walkIndexL = 1;
  }
}

void chill()
{
  dirState = "chill";
  manX -=0;
}

void jumping() {

  if (jumpState == "jump")
  {
    manY -= 6;
    if (manY <= manYpos-jumpHeight) {
      jumpState = "falling";
    }
  }
}

void falling() {
  if (jumpState == "falling")
  {
    manY += 5;
    if (manY >= manYpos) {
      jumpState = "none";
    }
  }
}


void checkState()
{

  if (dirState == "right") {
    runRight();
    chillState = "right";
  }
  else if (dirState == "left") {
    runLeft();
    chillState = "left";
  }
  else if (dirState == "chill") {
    chill();
  } 

  if (jumpState == "jump") {
    jumping();
  }
  else if (jumpState == "falling") {
    falling();
  }
}

void checkKeys() {
  if (keyPressed) {
    if (keyCode == RIGHT) {
      dirState = "right";
    }  

    if (keyCode == LEFT) {
      dirState = "left";
    }

    if (keyCode == UP && jumpState == "none") {
      jumpState = "jump";
    }
  }   
  else {
    dirState = "chill";
  }
} 

void level1() {
  
  image(level1bkg, 0, 0);
  image(bryanMsg[bm], 195, 490);

  fill(0);
  textSize(60);
  text(int(price1) + "€", 190, 380);
  text(int(price2) + "€", 388, 380);
  text(int(price3) + "€", 590, 380);

  if (levelWon[1]==false) {timeP++;}

  if (timeP>=200) {
    price1 = random(10, 99);
    price2 = random(10, 99);
    price3 = random(10, 99);
    
    ranBmChance = random(100);
    ranBm = random(3,5);
    
    
    timeP = 0;
  }

  color col = level1bkgUI.get(mouseX, mouseY);
  
  if (col==-517076 || col==-3532 || col==-16734634){cu=1;} else{cu=0;}

  if (price1<price2 && price1<price3) { rCol=-517076;    wCol1=-3532;      wCol2=-16734634; }
  if (price2<price3 && price2<price1) { rCol=-3532;      wCol1=-517076;    wCol2=-16734634;}
  if (price3<price1 && price3<price2) { rCol=-16734634;  wCol1=-517076;    wCol2=-3532;}  

  if (mousePressed && col == rCol) { 
  
  if (ranBmChance <= 20) { bm = 2; }
  if (ranBmChance >= 20) { bm = int(ranBm); }
  
  }
  
  else if (mousePressed && (col == wCol1 || col == wCol2)){ bm=1; }  
  
  if (bm == 2) {levelWon[1]=true;} 
  if (levelWon[1]==true){ timeW[1]++; if(timeW[1] >= 150) { gameLevel=0; } }
  
  
}

void level2(){
  

    background(0);
    
  if (mousePressed) {levelWon[2]=true;}
  
  if (levelWon[2]==true){level0();}


      }
void level3() {

  image(level3bkg, 0, 0);
  image(rent, 70, 180);
  image(rentAd[rentIndex], 83, 256);

  pushMatrix();

  translate(100, 467); 
  rotate(-PI/2);


  if (levelWon[3]==false) {timePH++;}

  if (timePH>=1000) {

    phone[0] = 3;
    phone[1] = int(random(2, 4));
    phone[2] = int(random(3, 9));
    phone[3] = int(random(1, 9));
    phone[4] = int(random(1, 9));
    phone[5] = int(random(1, 9));
    phone[6] = int(random(1, 9));
    phone[7] = int(random(1, 9));
    phone[8] = int(random(1, 9));
    phone[9] = int(random(1, 9));

    timePH = 0;
    dn = 0;
    rentIndex++; 
    
    if (rentIndex>=4) {
      rentIndex=4;
    }    

    for (int g = 0; g < 10; g++) {
      dialNumber[g]=0;
    }
  }

  textSize(15);
  fill(0);
    
  for (int ph = 0; ph < 10; ph++) { 
    text(phone[ph], ph*9, 0);
    text(phone[ph], ph*9, 35);
    text(phone[ph], ph*9, 80);
    text(phone[ph], ph*9, 130);
    text(phone[ph], ph*9, 178);
    text(phone[ph], ph*9, 230);
    text(phone[ph], ph*9, 280);
    text(phone[ph], ph*9, 330);
  } 

  popMatrix();

  pushMatrix();
  translate(550, 138);
  image(dial, 0, 0);
  popMatrix();

  color dialColor = dialUI.get(mouseX, mouseY);

  if (dialColor != 16777215){cu=1;} else {cu=0;}

  if (mousePressed) {

    if (dialColor==-16734634) { 
      dialNumber[dn] = 1;
    }
    if (dialColor==-517076) { 
      dialNumber[dn] = 2;
    }
    if (dialColor==-15895111) { 
      dialNumber[dn] = 3;
    }
    if (dialColor==-7105128) { 
      dialNumber[dn] = 4;
    }
    if (dialColor==-370379) { 
      dialNumber[dn] = 5;
    }
    if (dialColor==-6388102) { 
      dialNumber[dn] = 6;
    }
    if (dialColor==-20402) { 
      dialNumber[dn] = 7;
    }
    if (dialColor==-655222) { 
      dialNumber[dn] = 8;
    }
    if (dialColor==-3532) { 
      dialNumber[dn] = 9;
    }
    if (dialColor==-9819250) { 
      dialNumber[dn] = 0;
    }
  } 


  textSize(30);
  
  if (dialNumber[0]==0) {  } else {
  
  for (int dn = 0; dn < 10; dn++) { 
    fill(dialHue[dn]);
    text(dialNumber[dn], 595+dn*18, 205);
  } }

  for (int q = 0; q < 10; q++) {
    if (phone[q] == dialNumber[q]) {
      dialHue[q]=0;
    }
    if (dialNumber[q] == 0) {
      dialHue[q]=255;
    }
    if (phone[q] != dialNumber[q] && dialNumber[q] != 0) {
      dn=0; 
      for (int g = 0; g < 10; g++) {
        dialNumber[g]=0;
      }
    }
  } 

  if (dialNumber[0] == 0) {
    dn=0;
  }

  if (phone[9] == dialNumber[9]) {
    levelWon[3] = true;
  }
  
  if (levelWon[3]==true){timeW[3]++; if(timeW[3] >= 200) {gameLevel=0;}    for (int q = 0; q < 10; q++) {dialHue[q]=#00A656;}  } }

void mouseClicked() {

  if (cu==1) {dn++;}
  if (dn>=10) {
    dn=0;
  }
}

void level4() {

  image(level4bkg, 0, 0);
  //image(level4bkgUI, 0, 0);

  for (int i=0; i < 5; i++) {
    wordX[i]=420+i*80;
  } 
  for (int i=5; i < 9; i++) {
    wordX[i]=60+i*80;
  } 
 
  for (int i=0; i < 9; i++) {
    if (wordCheck[i] == 1) {
      image(word[i], mouseX - word[i].width/2, mouseY - word[i].height/2);
    }
    else if (wordCheck[i] == -1) {
      if (i < 5) {
        image(word[i], wordX[i], wordYrow1);
      }
      else {
        image(word[i], wordX[i], wordYrow2);
      }
    }
    else if (wordCheck[i] == 2) {
      
      
      if (i == 2) {
        image(word[i], 440, 181);
      }
      if (i == 5) {
        image(word[i], 495, 271);
      }
      if (i == 8) {
        image(word[i], 537, 303);
      }
    }
  }
  
  if (wordCheck[2] == 2 && wordCheck[5] == 2 && wordCheck[8] == 2){levelWon[4] = true; }
  if (levelWon[4]==true){ timeW[4]++; if(timeW[4] >= 150) { gameLevel=5; } }


  colWord = level4bkgUI.get(mouseX, mouseY);
  
  if (colWord != 16777215){cu=1;} else {cu=0;}

  if (colWord == -6453894 && mousePressed) {
    wordCheck[0] = 1;
  }
  
  if (colWord == -16723494 && mousePressed) {
    wordCheck[1] = 1;
  }
  
  if (colWord == -8716240 && mousePressed) {
    wordCheck[2] = 1;
  }
  
  if (colWord == -11308032 && mousePressed) {
    wordCheck[3] = 1;
  }
  
  if (colWord == -14425 && mousePressed) {
    wordCheck[4] = 1;
  }
  
  if (colWord == -12910668 && mousePressed) {
    wordCheck[5] = 1;
  }
  
  if (colWord == -16693248 && mousePressed) {
    wordCheck[6] = 1;
  }
  
  if (colWord == -1048415 && mousePressed) {
    wordCheck[7] = 1;
  }
  
  if (colWord == -21205 && mousePressed) {
    wordCheck[8] = 1;
  }
  
  
  
}

void mouseReleased() {
  colWord = level4bkgUI.get(mouseX, mouseY);

  if (colWord == -1298944 && wordCheck[2] == 1) {
    wordCheck[2] = 2;
  }
  else if(wordCheck[2] != 2){
    wordCheck[2] = -1;
  }
  
  if (colWord == -3532 && wordCheck[5] == 1) {
    wordCheck[5] = 2;
  }
  else if(wordCheck[5] != 2){
    wordCheck[5] = -1;
  }
  
  if (colWord == -16734634 && wordCheck[8] == 1) {
    wordCheck[8] = 2;
  }
  else if(wordCheck[8] != 2){
    wordCheck[8] = -1;
  }
  
  wordCheck[0] = -1;
  wordCheck[1] = -1;
  wordCheck[3] = -1;
  wordCheck[4] = -1;
  wordCheck[6] = -1;
  wordCheck[7] = -1;
  
    println(colWord);
}

//global variables

PImage[] curs = new PImage[2];
PImage startScreen;
PImage endScreen;

int cu = 0;
int gameLevel = -1;

int timeW[] = new int[6];
boolean[] levelWon = new boolean[5];

//level 0 variables

PImage level0bkg;

PImage[] manR = new PImage[5];
PImage[] manL = new PImage[5];
PImage[] token = new PImage[5];
PImage[] tokenGray = new PImage[5];

PImage check;

String dirState = "none";
String jumpState = "none";
String chillState = "right";

int bkgX = 0;
int bkgLength = 1812;
int levelLength = 1300;

int floorHeight = 417;
int manHeight = 140;
int manWidth = 66;
int manX = 50;
float manY = floorHeight-manHeight+7;
int manYpos = floorHeight-manHeight+7;
int jumpHeight = 90;
int manSpeed = 5;

int tokenSize = 100;
float tokenX = 0;
int tokenY = 150;
int tokenYfix = 150;
float tokenParallax = 1.1;
int tokenDist = 450;

int timeT = 0;

int timeR = 0;
int timeL = 0;

int walkIndexR = 1;
int walkIndexL = 1;

//level 1 variables

PImage level1bkg;
PImage level1bkgUI;
PImage[] bryanMsg = new PImage[6];

int timeP = 100;
float price1 = 0;
float price2 = 0;
float price3 = 0;
int rCol;
int wCol1;
int wCol2;
int bm = 0;
float ranBmChance;
float ranBm;

//level 3 variables

PImage level3bkg;
PImage rent;
PImage dial;
PImage dialUI;
PImage[] rentAd = new PImage[5];

int[] phone = new int[10];
int[] dialNumber = new int[10];
color dialColor;
color[] dialHue = new color[10];
int dn = 0;
int timePH = 0;
int rentIndex = 0;

//level 4 variables

PImage level4bkg;
PImage level4bkgUI;
PImage[] word = new PImage[9];

int[] wordX = new int[9];
int wordYrow1 = 550;
int wordYrow2 = 600;
int[] wordCheck = new int[9];
color colWord;


void setup() {

  size(900, 650);
  
  level0bkg = loadImage("level0bkg.png");


  curs[0] = loadImage("cursor0.png");
  curs[1] = loadImage("cursor1.png");

  startScreen = loadImage("start.png");
  endScreen = loadImage("end.png");


  manR[0] = loadImage("manR0.png");
  manR[1] = loadImage("manR1.png");
  manR[2] = loadImage("manR0.png");
  manR[3] = loadImage("manR2.png");
  manR[4] = loadImage("manR0.png");

  manL[0] = loadImage("manL0.png"); 
  manL[1] = loadImage("manL1.png"); 
  manL[2] = loadImage("manL0.png");
  manL[3] = loadImage("manL2.png");
  manL[4] = loadImage("manL0.png");

  token[0] = loadImage("token01.png");
  token[1] = loadImage("token01.png");
  token[2] = loadImage("token02.png");
  token[3] = loadImage("token03.png");
  token[4] = loadImage("token04.png");

  tokenGray[0] = loadImage("tokenGray01.png");
  tokenGray[1] = loadImage("tokenGray01.png");
  tokenGray[2] = loadImage("tokenGray02.png");
  tokenGray[3] = loadImage("tokenGray03.png");
  tokenGray[4] = loadImage("tokenGray04.png");

  check = loadImage("check.png");

  level1bkg = loadImage("level1bkg.png");
  level1bkgUI = loadImage("level1bkgUI.png");

  bryanMsg[0] = loadImage("bryanmsg00.png");
  bryanMsg[1] = loadImage("bryanmsg01.png");
  bryanMsg[2] = loadImage("bryanmsg02.png");
  bryanMsg[3] = loadImage("bryanmsg03.png");
  bryanMsg[4] = loadImage("bryanmsg04.png");
  bryanMsg[5] = loadImage("bryanmsg05.png");     

  level3bkg = loadImage("level3bkg.png");
  rent = loadImage("rent.png");
  dial = loadImage("dial.png");
  dialUI = loadImage("dialUI.png");

  rentAd[0] = loadImage("rentAd01.png");
  rentAd[1] = loadImage("rentAd02.png");
  rentAd[2] = loadImage("rentAd03.png");
  rentAd[3] = loadImage("rentAd04.png");
  rentAd[4] = loadImage("rentAd05.png");

  level4bkg = loadImage("level4bkg.png");
  level4bkgUI = loadImage("level4bkgUI.png");
  
  
  for(int i = 0; i < word.length; i++){
    word[i] = loadImage("word0" + i + ".png");
    wordCheck[i] = -1;
  }

  price1 = random(10, 99);
  price2 = random(10, 99);
  price3 = random(10, 99);

  phone[0] = 3;
  phone[1] = int(random(2, 4));
  phone[2] = int(random(3, 9));
  phone[3] = int(random(1, 9));
  phone[4] = int(random(1, 9));
  phone[5] = int(random(1, 9));
  phone[6] = int(random(1, 9));
  phone[7] = int(random(1, 9));
  phone[8] = int(random(1, 9));
  phone[9] = int(random(1, 9));

  levelWon[0]=true;
  levelWon[1]=false;
  levelWon[2]=false;
  levelWon[3]=false;
  levelWon[4]=false;
}

void startScreen() {
  image(startScreen, 0, 0);

  for (int i=1; i < 5; i++) {
    levelWon[i] = false;
  }
  for (int i=0; i < 5; i++) {
    timeW[i] = 0;
  }
  for (int i = 0; i < 10; i++) {
    dialNumber[i] = 0;
  }

  bm=0;


  for (int i=0; i < 9; i++) {
    wordCheck[i] = 0;
  }


  bkgX=0;
  manX=50;


  if (keyPressed || mousePressed) { 
    gameLevel = 0;
  }
}



