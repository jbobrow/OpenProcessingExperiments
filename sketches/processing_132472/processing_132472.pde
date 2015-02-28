
// OP EEN OF ANDERE MANIER WERKT HET VANGEN ALLEEN AAN DE LINKER KANT VAN HET SCHERM
// ik heb op verschillende manier dit proberen te voorkomen maar als ik de getallen verander werkt mijn spelletje niet meer


Menu menu; //menu
Game game; //spelletje zelf
Laser[] laserArray; // de laserzwaarden

PImage bg, catcherImg; //Achtergrond  
PFont myFont, scoreFont; //Lettertype

int monsterX, monsterY, stage, totalLaser = 0, missed = 0, caught = 0, fallDelay = 56;

// AUDIO PLAYER
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

//GAME zelf

void setup() {
  size(800,400);
  bg = loadImage("sw.jpg"); //achtergrond
  monsterY = 200; 
  monsterX = 0;
  myFont = loadFont ("Serif-30.vlw"); // lettertype
  textFont(myFont,30); //lettertype
  scoreFont = createFont("SansSerif-20.vlw", 20); //lettertype
  menu = new Menu(); //menu maken
  game = new Game();  // spelletje maken
  laserArray = new Laser[500];  //aantal nieuwe lasers
  // AUDIO PLAYER
   minim = new Minim(this);
 player = minim.loadFile("Star Wars Theme Song By John Williams.mp3",2048);
  player.play();
 
noCursor(); //zodat er geen pijltje in beeld komt
  

 
}
// Tekenen
void draw() {
  background(bg); //achtergrond
  fill(178,128,81);
  rectMode(CENTER);
  ellipseMode(CENTER);
  fallDelay++;
  // aantal lasers die gaan vallen
  if (totalLaser < 500 && fallDelay == 60){
    laserArray[totalLaser] = new Laser();
    totalLaser++;
  }
  movement();  
if ( stage == 0) stage = menu.drawMenu(); // het "voorscherm" (werkt niet?)
if (mousePressed == true){ // gaan naar game
  stage = 1;
}

// "SPELREGELS"
if (stage ==2){
  bg = loadImage("dv.jpg");
}
if (stage == 1) {  
  stage = game.drawGame();
  for (int i = 0; i < totalLaser; i++){
    laserArray[i].move(mouseX,mouseY);
    missed += laserArray[i].missed();
    if (game.caught(laserArray[i])) caught += 1;
  }
  showScore(); // zodat de score in beeld komt
}
  if (fallDelay == 60){
    fallDelay = 0;
  }
if (keyPressed && key=='p'){
  stage=0;
}
if (missed == 10){
  stage = 2;
  missed = 0;
}

if ( keyPressed && key == 'r'){
  stage = 0;
  bg = loadImage("sw.jpg");
}
}
// Score in beeld brengen
void showScore(){
  textFont(scoreFont);
  textAlign(CENTER);
  text("Gevangen: " + caught, width-100, 25);
  text("Missed: " + missed, width-100, 50);
}

void movement(){
 
  
}

    
void stop(){
 player.close();
 minim.stop();
  super.stop();
}


// GAME ZELF
class Game{
  int drawGame(){
// MONSTERTJE R2D2

    //r2d2 hoofd
  fill(188);
  stroke(0);
  ellipse(mouseX , monsterY +29, 90,90);
  
  fill(43,71,244);
  noStroke();
  rect(mouseX, monsterY -0, 22,22);
  
  fill(0);
  noStroke();
  ellipse(mouseX, monsterY -0, 18,18);
  
  fill(29,56,222);
  noStroke();
  rect(mouseX +9, monsterY +22, 17,14);
  
  fill(200,0,0);
  stroke(0);
  ellipse(mouseX +9, monsterY +22, 9,9);
  
  fill(29,56,222);
  noStroke();
  rect(mouseX -22, monsterY +21, 10,18);
  
  fill(29,56,222);
  noStroke();
  ellipse(mouseX -35, monsterY +20, 9,18);
  
  fill(28);
  stroke(154);
  ellipse(mouseX +26, monsterY +23, 12,12);
  
  fill(29,56,222);
  noStroke();
  ellipse(mouseX -8, monsterY +22, 8,14);
    
  fill(29,56,222);
  noStroke();
  rect(mouseX +38, monsterY +23, 7,14);
  
  
 
    //r2d2 linker been
  
  fill(255);
  stroke(0);
  rect(mouseX -35, monsterY +100, 40,40); 
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +-54, monsterY +104, -4,30); 
  
  fill(255);
  stroke(0);
  triangle(mouseX +-31, monsterY +166, mouseX +-68, monsterY +166, mouseX +-49, monsterY +138);
  
  
  fill(255);
  stroke(0);
  rect(mouseX +-48, monsterY +132, monsterX +27, monsterY -171, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
    
    
  fill(255);
  stroke(0);
  rect(mouseX +-46, monsterY +67, monsterX +30, monsterY -155, monsterX +5, monsterY -194, monsterX +3, monsterY -194);
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +-52, monsterY +128, -7,5); 
  

  
  //r2d2 rechter been

  
  fill(255);
  stroke(0);
  rect(mouseX +35, monsterY +104, 40,40);  
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +54, monsterY +104, -4,30); 
  
  fill(255);
  stroke(0);
  triangle(mouseX +51, monsterY +135, mouseX +33, monsterY +166, mouseX +69, monsterY +166);
  
  fill(255);
  stroke(0);
  rect(mouseX +46, monsterY +67, monsterX +30, monsterY -155, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(mouseX +48, monsterY +132, monsterX +27, monsterY -171, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
    
  fill(29,56,222);
  stroke(0);
  rect(mouseX +52, monsterY +128, -7,5); 
 
  
 
  

  
  
  //r2d2 lichaam
  fill(255);
  stroke(0);
  triangle(mouseX +0, monsterY +136, mouseX +-26, monsterY +179, mouseX +25, monsterY +179);
  
  fill(255);
  stroke(0);
  rect(mouseX +0, monsterY +132, monsterX +90, monsterY -165, monsterX +0, monsterY -200, monsterX +14, monsterY -188);

  fill(255);
  stroke(0);
  rect(mouseX ,monsterY +85, 90,104);
  
  fill(29,56,222);
  noStroke();
  ellipse(mouseX +39, monsterY +122, 13,16);
  
  fill(29,56,222);
  noStroke();
  ellipse(mouseX +3, monsterY +122, 18,18);
  
  fill(29,56,222);
  noStroke();
  ellipse(mouseX -35, monsterY +121, 12,24);
  
  fill(190);
  stroke(60);
  rect(mouseX +-18, monsterY +125, monsterX +15, monsterY -186, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(255);
  stroke(30);
  rect(mouseX +-18, monsterY +111, monsterX +15, monsterY -194, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(mouseX +23, monsterY +125, monsterX +15, monsterY -186, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(255);
  stroke(0);
  rect(mouseX +-35, monsterY +72, monsterX +11, monsterY -130, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
    
  fill(255);
  stroke(0);
  rect(mouseX +22, monsterY +81, monsterX +12, monsterY -154, monsterX +13, monsterY -194, monsterX +13, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(mouseX+37, monsterY +72, monsterX +11, monsterY -130, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(mouseX +-19, monsterY +82, monsterX +12, monsterY -154, monsterX +13, monsterY -194, monsterX +13, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(mouseX +23, monsterY +111, monsterX +15, monsterY -194, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +2, monsterY +85, monsterX +21, monsterY -151, monsterX +8, monsterY -192, monsterX +8, monsterY -192);
  
  fill(255);
  stroke(0);
  rect(mouseX +2, monsterY +97, monsterX +14, monsterY -181, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(255);
  stroke(0);
  rect(mouseX +2, monsterY +74, monsterX +14, monsterY -180, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +1, monsterY +53, monsterX +55, monsterY -195, monsterX +5, monsterY -195, monsterX +5, monsterY -195);
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +1, monsterY +46, monsterX +55, monsterY -195, monsterX +7, monsterY -193, monsterX +7, monsterY -193);
  
  fill(29,56,222);
  stroke(0);
  rect(mouseX +1, monsterY +39,  +55, monsterY -195, monsterX +7, monsterY -193, monsterX +7, monsterY -193);
 return 1;   


}
// het "VANGEN"
boolean caught(Laser m){
  float distance = dist(mouseX, monsterY, m.xpos, m.ypos);
  
  if(distance < 50) {
    m.caught = true;
    return true;
  } else {
    return false;
  }
}
}

// De LASERZWAARDEN
class Laser{
  
  float xpos;
  float ypos;
  float yspeed;
  float cursorX;
  float cursorY;
  boolean caught;

Laser(){
  catcherImg = loadImage("Starwars_2013_Emote_Lightsaber.png"); //plaatje van het laserzwaard
  xpos = random(0,800); // de x positie van het plaatje wordt "random" bepaald
  ypos = -50; // de y positie is buiten het scherm zodat het lijkt alsof ze van buiten het scherm vallen
  yspeed = random(1,5); // ook de snelheid is random

}

// de "beweging" van de laserzwaarden
void move(float x, float y){
  if (!caught){ // wat er gebeurd als er eentje gevangen wordt 
    cursorX = x;
    cursorY = y;
    fall();
    display();
  }
  else {
    yspeed = 0;
    ypos = -100;
  }
}
// afbeelding van wat er valt 
void display(){
  image(catcherImg,xpos,ypos,50,50);
}

// code om ze te laten vallen
void fall(){
 
  ypos = ypos + yspeed; // de val beweging
}
  // wat er gebeurd als hij niet gevangen wordt
  int missed(){
    int missed = 0;
    if (ypos > 450) {
      yspeed = 0;
      ypos = -100;
      missed = 1;
    }
    return missed;
}
} 

// het start menu
class Menu{
  
  int drawMenu(){
    int stage = 0; // als het spelletje begint is het stage 1
    stage = 0;
   // MONSTERTJE
       //r2d2 hoofd
  fill(188);
  stroke(0);
  ellipse(monsterX , monsterY +29, 90,90);
  
  fill(43,71,244);
  noStroke();
  rect(monsterX, monsterY -0, 22,22);
  
  fill(0);
  noStroke();
  ellipse(monsterX, monsterY -0, 18,18);
  
  fill(29,56,222);
  noStroke();
  rect(monsterX +9, monsterY +22, 17,14);
  
  fill(200,0,0);
  stroke(0);
  ellipse(monsterX +9, monsterY +22, 9,9);
  
  fill(29,56,222);
  noStroke();
  rect(monsterX -22, monsterY +21, 10,18);
  
  fill(29,56,222);
  noStroke();
  ellipse(monsterX -35, monsterY +20, 9,18);
  
  fill(28);
  stroke(154);
  ellipse(monsterX +26, monsterY +23, 12,12);
  
  fill(29,56,222);
  noStroke();
  ellipse(monsterX -8, monsterY +22, 8,14);
    
  fill(29,56,222);
  noStroke();
  rect(monsterX +38, monsterY +23, 7,14);
  
  
    //r2d2 linker been
  
  fill(255);
  stroke(0);
  rect(monsterX -35, monsterY +100, 40,40); 
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +-54, monsterY +104, -4,30); 
  
  fill(255);
  stroke(0);
  triangle(monsterX +-31, monsterY +166, monsterX +-68, monsterY +166, monsterX +-49, monsterY +138);
  
  
  fill(255);
  stroke(0);
  rect(monsterX +-48, monsterY +132, monsterX +27, monsterY -171, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
    
    
  fill(255);
  stroke(0);
  rect(monsterX +-46, monsterY +67, monsterX +30, monsterY -155, monsterX +5, monsterY -194, monsterX +3, monsterY -194);
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +-52, monsterY +128, -7,5); 
  

  
  //r2d2 rechter been

  
  fill(255);
  stroke(0);
  rect(monsterX +35, monsterY +104, 40,40);  
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +54, monsterY +104, -4,30); 
  
  fill(255);
  stroke(0);
  triangle(monsterX +51, monsterY +135, monsterX +33, monsterY +166, monsterX +69, monsterY +166);
  
  fill(255);
  stroke(0);
  rect(monsterX +46, monsterY +67, monsterX +30, monsterY -155, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(monsterX +48, monsterY +132, monsterX +27, monsterY -171, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
    
  fill(29,56,222);
  stroke(0);
  rect(monsterX +52, monsterY +128, -7,5); 
 
  
 
  

  
  
  //r2d2 lichaam
  fill(255);
  stroke(0);
  triangle(monsterX +0, monsterY +136, monsterX +-26, monsterY +179, monsterX +25, monsterY +179);
  
  fill(255);
  stroke(0);
  rect(monsterX +0, monsterY +132, monsterX +90, monsterY -165, monsterX +0, monsterY -200, monsterX +14, monsterY -188);

  fill(255);
  stroke(0);
  rect(monsterX ,monsterY +85, 90,104);
  
  fill(29,56,222);
  noStroke();
  ellipse(monsterX +39, monsterY +122, 13,16);
  
  fill(29,56,222);
  noStroke();
  ellipse(monsterX +3, monsterY +122, 18,18);
  
  fill(29,56,222);
  noStroke();
  ellipse(monsterX -35, monsterY +121, 12,24);
  
  fill(190);
  stroke(60);
  rect(monsterX +-18, monsterY +125, monsterX +15, monsterY -186, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(255);
  stroke(30);
  rect(monsterX +-18, monsterY +111, monsterX +15, monsterY -194, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(monsterX +23, monsterY +125, monsterX +15, monsterY -186, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(255);
  stroke(0);
  rect(monsterX +-35, monsterY +72, monsterX +11, monsterY -130, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
    
  fill(255);
  stroke(0);
  rect(monsterX +22, monsterY +81, monsterX +12, monsterY -154, monsterX +13, monsterY -194, monsterX +13, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(monsterX +37, monsterY +72, monsterX +11, monsterY -130, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(monsterX +-19, monsterY +82, monsterX +12, monsterY -154, monsterX +13, monsterY -194, monsterX +13, monsterY -194);
  
  fill(255);
  stroke(0);
  rect(monsterX +23, monsterY +111, monsterX +15, monsterY -194, monsterX +5, monsterY -194, monsterX +5, monsterY -194);
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +2, monsterY +85, monsterX +21, monsterY -151, monsterX +8, monsterY -192, monsterX +8, monsterY -192);
  
  fill(255);
  stroke(0);
  rect(monsterX +2, monsterY +97, monsterX +14, monsterY -181, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(255);
  stroke(0);
  rect(monsterX +2, monsterY +74, monsterX +14, monsterY -180, monsterX +4, monsterY -196, monsterX +4, monsterY -196);
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +1, monsterY +53, monsterX +55, monsterY -195, monsterX +5, monsterY -195, monsterX +5, monsterY -195);
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +1, monsterY +46, monsterX +55, monsterY -195, monsterX +7, monsterY -193, monsterX +7, monsterY -193);
  
  fill(29,56,222);
  stroke(0);
  rect(monsterX +1, monsterY +39, monsterX +55, monsterY -195, monsterX +7, monsterY -193, monsterX +7, monsterY -193);
     
     // tekst die te zien is als het stage 0 is 
  text("CLICK TO START THE GAME",150,30);
  text("Move your mouse to controll R2D2",170,80);
  text("Druk op P om te pauzerenn",150,120);
  
  // hoe het spel te starten
if (mousePressed){
  stage = 1;
  return stage;
}
else{
  return stage;
}



  }
  }




