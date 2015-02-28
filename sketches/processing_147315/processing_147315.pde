
PImage []mario = new PImage [2];
PImage []luigi = new PImage [2];
PImage []koopa = new PImage [2];
PImage []peach = new PImage [2];
PImage []bowser = new PImage [2];
PImage []toad = new PImage [2];
PImage []yoshi = new PImage [2];
PImage []wario = new PImage [2];
PImage []dk = new PImage [2];
PImage []diddy = new PImage [2];
PImage []krool = new PImage [2];
PImage []birdo = new PImage [2];
PImage []waluigi = new PImage [2];

int marioA = -1;
int luigiA = -1;
int koopaA = -1;
int peachA = -1;
int bowserA = -1;
int toadA = -1;
int yoshiA = -1;
int warioA = -1;
int dkA = -1;
int diddyA= -1;
int kroolA = -1;
int birdoA = -1;
int waluigiA = -1;

float marioX = 200;
float luigiX = 200;
float koopaX = 200;
float peachX = 200;
float bowserX = 200;
float toadX = 200;
float yoshiX = 200;
float warioX = 200;
float dkX = 200;
float diddyX = 200;
float kroolX = 200;
float birdoX = 200;
float waluigiX = 200;

int marioY = 0;
int luigiY = 50;
int peachY = 100;
int bowserY = 150;
int koopaY = 200;
int toadY = 250;
int yoshiY = 300;
int warioY = 350;
int dkY = 400;
int diddyY = 450;
int kroolY = 500;
int birdoY = 550;
int waluigiY = 600;

int kart = 0;

void setup(){
  size (700, 700);
  frameRate(30);
  background(255);
  mario[0] = loadImage("mario1.png");
  mario[1] = loadImage("mario2.png");
  
  luigi[0] = loadImage("luigi1.png");
  luigi[1] = loadImage("luigi2.png");
  
  peach[0] = loadImage("peach1.png");
  peach[1] = loadImage("peach2.png");
  
  bowser[0] = loadImage("bowser1.png");
  bowser[1] = loadImage("bowser2.png");
  
  koopa[0] = loadImage("koopa1.png");
  koopa[1] = loadImage("koopa2.png");
  
  toad[0] = loadImage("toad1.png");
  toad[1] = loadImage("toad2.png");
  
  yoshi[0] = loadImage("yoshi1.png");
  yoshi[1] = loadImage("yoshi2.png");
  
  dk[0] = loadImage("dk1.png");
  dk[1] = loadImage("dk2.png");
  
  wario[0] = loadImage("wario1.png");
  wario[1] = loadImage("wario2.png");
  
  diddy[0] = loadImage("diddy1.png");
  diddy[1] = loadImage("diddy2.png");
  
  krool[0] = loadImage("krool1.png");
  krool[1] = loadImage("krool2.png");
  
  birdo[0] = loadImage("birdo1.png");
  birdo[1] = loadImage("birdo2.png");
  
  waluigi[0] = loadImage("waluigi1.png");
  waluigi[1] = loadImage("waluigi2.png");
} 
  void draw(){
  
  marioA++;
  luigiA++;
  peachA++;
  bowserA++;
  toadA++;
  koopaA++;
  yoshiA++;
  warioA++;
  dkA++;
  diddyA++;
  kroolA++;
  birdoA++;
  waluigiA++;
  
  if (marioA == 1){
    marioA = 0;}
  if (luigiA == 1){
    luigiA = 0;}
  if (peachA == 1){
    peachA = 0;}
    if (bowserA == 1){
    bowserA = 0;}
  if (toadA == 1){
    toadA = 0;}
  if (yoshiA == 1){
    yoshiA = 0;}
    if (dkA == 1){
    dkA = 0;}
  if (diddyA == 1){
    diddyA = 0;}
  if (kroolA == 1){
    kroolA = 0;}
    if (birdoA == 1){
    birdoA = 0;}
  if (warioA == 1){
    warioA = 0;}
  if (waluigiA == 1){
    waluigiA = 0;}
    if (koopaA == 1){
    koopaA = 0;}
  
  image(mario[marioA],marioX,marioY);
  image(luigi[luigiA],luigiX,luigiY);
  image(peach[peachA],peachX,peachY);
  marioX = marioX +random(10);
  luigiX = luigiX +random(10);
  peachX = peachX +random(10);
  image(bowser[bowserA],bowserX,bowserY);
  image(toad[toadA],toadX,toadY);
  image(yoshi[yoshiA],yoshiX,yoshiY);
  bowserX = bowserX +random(10);
  toadX = toadX +random(10);
  yoshiX = yoshiX +random(10);
  image(wario[warioA],warioX,warioY);
  image(dk[dkA],dkX,dkY);
  image(diddy[diddyA],diddyX,diddyY);
  warioX = warioX +random(10);
  dkX = dkX +random(10);
  diddyX = diddyX +random(10);
  image(koopa[koopaA],koopaX,koopaY);
  image(birdo[birdoA],birdoX,birdoY);
  image(krool[kroolA],kroolX,kroolY);
  koopaX = koopaX +random(10);
  birdoX = birdoX +random(10);
  kroolX = kroolX +random(10);
  image(mario[marioA],marioX,marioY);
  image(luigi[luigiA],luigiX,luigiY);
  image(peach[peachA],peachX,peachY);
  marioX = marioX +random(10);
  brownX = brownX +random(10);
  blackX = blackX +random(10);
  image(waluigi[waluigiA],waluigiX,waluigiY);
  waluigiX = waluigiX +random(10);
  }


