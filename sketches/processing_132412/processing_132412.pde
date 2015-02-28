
//music//
import ddf.minim.*;  //import minim audio library
Minim minim;
AudioPlayer sou; //name for sound
PFont myFont;  //Font 
PImage bg;   
PImage img1;
PImage img2;

int minionY;
int minionX;

int richting;
int gameState;
int misses = 0;
int catches = 0;

float speed = 2;

int bananaX;
int bananaY;
Banana myBanana;
Banana myBanana2;
Banana myBanana3;

void setup(){
  size(600,600);
  minionX = 0;
  minionY = 447;
  richting = 3; 
  gameState = 0;
  
  myBanana = new Banana (230, 25, 2);
  myBanana2 = new Banana (500, 75, 2);
  myBanana3 = new Banana (10, 125, 2);
  
  myFont = loadFont ("LasVegas-Jackpot-48.vlw");      //font laden
  textFont(myFont, 50);                               //font grootte
  
  minim = new Minim(this);
  sou = minim.loadFile("Banana.mp3"); // upload the sound
  sou.loop() ; // repeat sound when it ends
  
  bg = loadImage ("background.jpg");
  img1 = loadImage ("sad-minion.png");
  img2 = loadImage ("happy-minion.png");
}

void draw(){
  background(bg);

if (gameState == 1){       //in het spel
  //functies banana
  myBanana.display();
  myBanana.falling();
  myBanana.arbitrary();
  
  myBanana2.display();
  myBanana2.falling();
  myBanana2.arbitrary();
  
  myBanana3.display();
  myBanana3.falling();
  myBanana3.arbitrary();
  
  //Minion vangt de bananen in een gebied rondom de muis //
  if ( ( myBanana.x > mouseX - 80 ) && (myBanana.x < mouseX + 80 ) && ( myBanana.y < 447 ) && ( myBanana.y > 320 ) ) {
        myBanana.y = 0;
        myBanana.x = int(random(width));
        catches = catches + 1;
  }          
  
  if ( ( myBanana2.x > mouseX - 80 ) && (myBanana2.x < mouseX + 80 ) && ( myBanana2.y < 447 ) && ( myBanana2.y > 320 ) ) {
        myBanana2.y = 0;
        myBanana2.x = int(random(width));
        catches = catches + 1;
  }
  
  if ( ( myBanana3.x > mouseX - 80 ) && (myBanana3.x < mouseX + 80 ) && ( myBanana3.y < 447 ) && ( myBanana3.y > 320 ) ) {
        myBanana3.y = 0;
        myBanana3.x = int(random(width));
        catches = catches + 1;
  }
} 

//EINDSCHERMEN//
//naar het 3e scherm gaan (hoog aantal bananen gevangen)/
if ( ( catches > 19 ) && ( misses < 11 ) ) {
  gameState = 3;
 if (gameState == 3) {
   fill(232,164,16);
   text("You're the best!", 155, 180);
   text("Click to play again", 200, 280);
      image (img2, 0, 310);
 }
}
   if (mousePressed) {
     gameState = 1;
     catches = 0;
     misses = 0;
   }
//naar het 4e scherm gaan (GAME OVER)/
if ( misses > 14 ) {
 gameState = 2; 
 if (gameState == 2){ 
  fill(232,164,16);
  text("GAME OVER", 160, 180);
  text("Click to play again", 200, 280); 
    image (img1, 0, 300);
 }
}
  if (mousePressed){
    gameState = 1;
    catches = 0;
    misses = 0;
  }


//*Startscherm*// 
  if(gameState == 0) {                        //als je in het startscherm zit
  fill(232,164,16);                           //kleur tekst
  text("'Minion wants Banana'", 150, 160);     //positie tekst "Minion wants banana"
  text("Move your mouse left and right to catch", 25, 250);
  text("Click to start",  210, 300);           //positie tekst "Click to start"
  if (mousePressed){                          //muis klikken leidt tot het spel (gamestate 1)
  gameState = 1;
 } 
 
//*minion (catcher)//
  /*body*/
  noStroke();
  fill(244,227,32);
  rectMode(CENTER);
  rect(minionX,minionY,90,180,100);
  /*glasses*/
  noStroke();
  fill(191,187,185);
  ellipse(minionX,minionY-30,55,55);
  noStroke();
  fill(0);
  rect(minionX-35,minionY-30,17.5,10);
  noStroke();
  fill(0);
  rect(minionX+35,minionY-30,17.5,10);
    /*skin*/
  noStroke();
  fill(244,227,32);
  ellipse(minionX,minionY-30,45,40);
  /*eye*/
  noStroke();
  fill(255);
  ellipse(minionX,minionY-31,44,33);
  stroke(0);
  fill(144,103,70);
  ellipse(minionX,minionY-30,10,10);
  noStroke();
  fill(0);
  ellipse(minionX,minionY-30,5,5);
  /*mouth*/
  noStroke();
  fill(0);
  ellipse(minionX,minionY+17,40,12);
  noStroke();
  fill(244,227,32);
  ellipse(minionX,minionY+14,39,12);
  /*clothing*/
  noStroke();
  fill(70,115,191);
  ellipse(minionX,minionY+60,86,65.5);
  /*straps*/
  noStroke();
  fill(70,115,191);
  rect(minionX-33,minionY+33.6,23,5);
  noStroke();
  fill(0);
  ellipse(minionX-27,minionY+33.6,5,5);
  noStroke();
  fill(70,115,191);
  rect(minionX+33,minionY+33.6,23,5);
  noStroke();
  fill(0);
  ellipse(minionX+27,minionY+33.6,5,5);
  noStroke();
  fill(0);
  ellipse(minionX,minionY+65,10,10);
  /*zakje*/
  stroke(98,144,198);
  fill(70,115,191);
  rect(minionX,minionY+56,20,10);
  stroke(98,144,198);
  fill(70,115,191);
  ellipse(minionX,minionY+63,20,15);
  noStroke();
  fill(244,227,32);
  ellipse(minionX,minionY+28,86,8);
  /*skin zijkanten*/
  noStroke();
  fill(244,227,32);
  ellipse(minionX-33.5,minionY+47,24,22.3);
  noStroke();
  fill(244,227,32);
  ellipse(minionX+33.5,minionY+47,24,22.3);
  /*legs*/
  noStroke();
  fill(70,115,191);
  rect(minionX-20,minionY+90,15,18);
  noStroke();
  fill(70,115,191);
  rect(minionX+20,minionY+90,15,18);
  /*shoes*/
  noStroke();
  fill(0);
  ellipse(minionX+20,minionY+98,16,15);
  noStroke();
  fill(0);
  ellipse(minionX-20,minionY+98,16,15);
  
  /*moving*/
  minionX = minionX + richting;
  if(minionX > 600 || minionX < 0){
    richting = -richting;  //minion verandert van richting
  }
  }
    
 //GAME//   
 if (gameState == 1){            // als je het spel speelt
   fill(232,164,16);             // kleur tekst
   text("Misses:", 15, 50);      //positie van de tekst "catches"
   text(misses, 132, 50);        // positie score
   
   fill(232,164,16);             // kleur tekst
   text("Catches:", 400, 50);    //positite van de tekst "catches"
   text(catches, 530,50);        // positite score
   
  /*minion*/
  /*body*/
  noStroke();
  fill(244,227,32);
  rectMode(CENTER);
  rect(minionX,minionY,90,180,100);
  /*glasses*/
  noStroke();
  fill(191,187,185);
  ellipse(minionX,minionY-30,55,55);
  noStroke();
  fill(0);
  rect(minionX-35,minionY-30,17.5,10);
  noStroke();
  fill(0);
  rect(minionX+35,minionY-30,17.5,10);
    /*skin*/
  noStroke();
  fill(244,227,32);
  ellipse(minionX,minionY-30,45,40);
  /*eye*/
  noStroke();
  fill(255);
  ellipse(minionX,minionY-31,44,33);
  stroke(0);
  fill(144,103,70);
  ellipse(minionX,minionY-30,10,10);
  noStroke();
  fill(0);
  ellipse(minionX,minionY-30,5,5);
  /*mouth*/
  noStroke();
  fill(0);
  ellipse(minionX,minionY+17,40,12);
  noStroke();
  fill(244,227,32);
  ellipse(minionX,minionY+14,39,12);
  /*clothing*/
  noStroke();
  fill(70,115,191);
  ellipse(minionX,minionY+60,86,65.5);
  /*straps*/
  noStroke();
  fill(70,115,191);
  rect(minionX-33,minionY+33.6,23,5);
  noStroke();
  fill(0);
  ellipse(minionX-27,minionY+33.6,5,5);
  noStroke();
  fill(70,115,191);
  rect(minionX+33,minionY+33.6,23,5);
  noStroke();
  fill(0);
  ellipse(minionX+27,minionY+33.6,5,5);
  noStroke();
  fill(0);
  ellipse(minionX,minionY+65,10,10);
  /*zakje*/
  stroke(98,144,198);
  fill(70,115,191);
  rect(minionX,minionY+56,20,10);
  stroke(98,144,198);
  fill(70,115,191);
  ellipse(minionX,minionY+63,20,15);
  noStroke();
  fill(244,227,32);
  ellipse(minionX,minionY+28,86,8);
  /*skin zijkanten*/
  noStroke();
  fill(244,227,32);
  ellipse(minionX-33.5,minionY+47,24,22.3);
  noStroke();
  fill(244,227,32);
  ellipse(minionX+33.5,minionY+47,24,22.3);
  /*legs*/
  noStroke();
  fill(70,115,191);
  rect(minionX-20,minionY+90,15,18);
  noStroke();
  fill(70,115,191);
  rect(minionX+20,minionY+90,15,18);
  /*shoes*/
  noStroke();
  fill(0);
  ellipse(minionX+20,minionY+98,16,15);
  noStroke();
  fill(0);
  ellipse(minionX-20,minionY+98,16,15);
  
  /*left and right*/
  minionX = mouseX;     //minion beweegt van links naar rechts met de muis mee   
 }    
 
  }

class Banana {
  PImage myBanana;
  float x;
  int y;
  int snelheid; 
  
 Banana(float tempX, int tempY, int tempSnelheid) {
   x = tempX;
   y = tempY;
   snelheid = tempSnelheid;
   myBanana = loadImage ("banana.png");
 }
 
 void display() {
   image (myBanana, x, y);     //afbeelding laten zien
 }
 
 void falling() {
   y = y + snelheid;          //beweging naar onder
   
   if(y > 447) {
     y=0;
     misses = misses + 1;
   }
 }
 
 void arbitrary() {          //op willekeurige plekken naar onder vallen
   if (y == 0) {
     x = random(5,480);
   }
 }
   
}


