
PImage bg;
Totoro totoro;
Timer timer; 
Drop[] drops;
int totalDrops;
float make;
PFont myFont, scoreFont; //Lettertype
int caught;
int tijd;
int gameState; // voorscherm, in het spel, eindscherm
import ddf.minim.*; // achtergrond muziek
 AudioPlayer player;// achtergrond muziek
 Minim minim; // achtergrond muziek

// Game
void setup (){
size (600,527);
bg = loadImage("save-totoro-forest-luc-desmarchelier.JPG"); // achtergrond
smooth();
totoro = new Totoro(50);
timer = new Timer(500); // snelheid timer 
timer.start();
tijd = 50; // tijd per spel 
drops = new Drop[1000];
totalDrops = 0; 
caught = 0; // start aantal gevangen drops
gameState = 0; // startscherm is voorscherm (menu)
minim = new Minim(this);
 player = minim.loadFile("550825_Orange-Sunset.mp3", 2048); //achtergrond muziek
myFont = loadFont ("Chalkduster-30.vlw"); // lettertype 
 textFont(myFont,30);
 scoreFont = createFont("Chalkduster-30.vlw", 20);
}

void draw (){
background(bg);
showScore();
totoro.setLocation(mouseX,340);
  
if (gameState == 0) { //als je in het voorscherm(menu) zit
  text("PRESS S TO START", 300, 400);
  if (keyPressed  && key == 's') {
    gameState = 1;
    player.play();
  }
 }

if (gameState == 2) { //als je in het eindscherm(menu) zit
  text("FINAL SCORE", 300, 100);
  text("PRESS R TO RESTART", 300, 280);
  text(caught, 300, 200);
  if (keyPressed && key == 'r') {
    gameState = 0;
    setup();
  }
 }
  
if (gameState == 1) { // als je in het spel zit
  if (tijd <= 0) {
    gameState = 2;
    player.close();
 }

totoro.display(); 
make = random(0,100);

if (timer.isFinished()) {  //timer
  tijd = tijd -1;
  drops[totalDrops] = new Drop();
  totalDrops ++ ;
   if (totalDrops >= drops.length) {
     totalDrops = 0; // start opnieuw
    }
    timer.start();
}

for (int i = 0; i < totalDrops; i++ ) {
 drops[i].move(); // beweging acorns
 drops[i].display(); // weergave acorns
  if (totoro.intersect(drops[i])) {
   drops[i].caught(); // vangen acorns
  }
 }
}
}

void showScore(){ // weergave scores en tijd
 textFont(scoreFont);
 textAlign(CENTER);
 text("Gevangen: " + caught, width-100, 25);
 text("Time: " + tijd, width-550, 25);
}


PImage acorn; 
class Drop {
float x,y;   // variabelen locatie van acorn
float speed; // snelheid van acorn
color c;
float r;     //radius van acorn
float bad;

Drop() {
 r = 8;                 // grootte van acorns blijft hetzelfde
 x = random(width);     // spawnen van acorns op de x-as is random
 y = 0;              // spawnen van acorns is iets boven de bovenkant van het scherm
 speed = random(1,5);   // random snelheid van vallen acorns
 acorn = loadImage("230px-acorn.png");
}

void move() { // acorn beweegt naar beneden
 y += speed;   
}

boolean reachedBottom() { // kijken naar wanneer onderkant geraakt wordt
 if (y > height + r*4) {
   return true;
 } 
 else {
   return false;
 }
}

void display() {   // weergeven van acorn
 if  (bad<=0.9){
   image(acorn,x,y);
 }
}

void caught() {   // als acorn gevangen is 
 speed = 0;   // beweging stopt
 y = - 1000; // acorn buiten scherm (onzichtbaar)
 caught = caught +1; // 1 punt erbij per gevangen acorn
 }
}
class Timer {
 
int savedTime; // wanneer timer gestart is
int totalTime; // duur van timer
 
Timer(int tempTotalTime) {
totalTime = tempTotalTime;
 }
  
// start timer
void start() {
// als timer gestart is, opslaan tijd in millisecondes
 savedTime = millis(); 
 }
  
// The function isFinished() returns true if "totalTime" has passed. 
// The work of the timer is farmed out to this method.
boolean isFinished() { 
int passedTime = millis()- savedTime; // kijk hoeveel tijd gepasseerd is
 if (passedTime > totalTime) {
 return true;
 } 
else {
 return false;
    }
  }
}
PImage catcher;
class Totoro {
float r;   // radius

float x,y; // locatie
  
Totoro(float tempR) {
  r = tempR;

  x = 0;
  y = 0;
  catcher = loadImage("sad_totoro_by_jax89man-d4w0y23 01.33.41.png");
}
  
void setLocation(float tempX, float tempY) {
  x = tempX;
  y = tempY;
}

void display() { //weergeven catcher
  image(catcher,x,y);
}
  
// true of vals of catcher de acorn opvangt of niet
  boolean intersect(Drop d) {
    // afstand berekenen
    float distance = dist(x,y,d.x,d.y); 
    
    //afstand vergelijken met som radius
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}


