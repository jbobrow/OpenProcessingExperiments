
Menu menu;
Game game;
Mouse[] mouseArray;

PImage bg, catcherImg; // Achtergrond
PFont myFont, scoreFont; //  Lettertype

int catX, catY, gameState, totalMice = 0, missed = 0, caught = 0, fallDelay = 56;
boolean pauze = false;

import ddf.minim.*;

AudioPlayer player;
Minim minim; // audio

void setup() {
  size(850,650); // Afbeeldingsgrootte
  bg = loadImage ("Keuken.jpg"); // Achtergrond
  catX = 570;
  catY = 420;
  myFont = loadFont ("Minnie-65.vlw"); //Lettertype
  textFont(myFont, 65); // Lettertype
  scoreFont = createFont("Minnie", 25);
  menu = new Menu();
  game = new Game();
  mouseArray = new Mouse[500];
  minim = new Minim(this);
  player = minim.loadFile("Nyancat.mp3");
  player.play();
  noCursor();
}

void draw(){
  background(bg); // achtergrond
  fill(178,128,81);
  stroke(20,20,20);
  strokeWeight(2);

  if (gameState == 5){
    textFont(myFont);
    text("PAUSE", width/2, height/2);
  }
  
  fallDelay++; // muizen worden gevangen
  if (totalMice < 500 && fallDelay == 60){
  mouseArray[totalMice] = new Mouse();
  totalMice++;
  }  
  movement();
  if (gameState == 0) gameState = menu.drawMenu(); // Gamestate 0 is het startscherm
  if (gameState == 1){  
    gameState = game.drawGame(); // Gamestate 1 is het spel zelf  
    for (int i = 0; i < totalMice; i++){
      mouseArray[i].move(mouseX, mouseY);
      missed += mouseArray[i].missed();
      if (game.caught(mouseArray[i])) caught += 1;
    }
    showScore();
   } 
   
  if (fallDelay == 60){
    fallDelay = 0;
  }
}

void showScore(){ // text van gevangen onderdeel
  textFont(scoreFont);
  textAlign(CENTER);
  text("Press P to pause", width/2, 50);
  text("Gevangen Muizen: " + caught, 200, 80);
  text("Gemiste Muizen: " + missed, 660, 80);
}

void movement(){
/*BEWEGING*/
  
  /*left and right*/
  catX = mouseX; // Cat beweegt hierdoor naar links en rechts alleen,
                 // zodat hij dingen kan "vangen", beweegt niet omhoog.
}
  
void keyPressed(){
    
 if (keyPressed){
   if (key == 'p' || key == 'P'){    
     if (gameState == 5){
       gameState = 1;
     }
     else {
       gameState = 5;    
     }
   }
   }
}
  
void stop(){
  player.close();
  minim.stop();
  super.stop();
}

class Game{
int drawGame(){  
/*GAME*/
   /*CAT*/  
  // Gehele code "monster" // 
  
  /*Whiskers*/
  line(catX, catY+90, catX - 70, catY + 70);
  line(catX + 180,catY+90, catX + 250, catY + 70);
  line(catX, catY+110, catX - 70, catY + 110);
  line(catX + 180, catY+110, catX + 250, catY + 110);
  line(catX, catY + 130, catX - 70, catY + 150);
  line(catX + 180, catY + 130, catX + 250, catY + 150);
    
  /*Ears*/
  fill(216,141,70);
  triangle(catX, catY, catX, catY +100, catX + 190, catY + 100);
  triangle(catX +170, catY, catX + 190, catY + 100, catX + 40, catY + 100);
  fill(185,141,101);
  triangle(catX + 15, catY + 30, catX + 5, catY + 140, catX + 190, catY + 140);
  triangle(catX + 160, catY + 30, catX + 180, catY + 140, catX - 10, catY + 140);
  
  /*face*/
  fill(216,141,70);
  ellipse(catX + 90, catY + 110, 200, 130);
  
  /*nose*/
  stroke(255,196,196);
  fill(255,196,196);
  triangle(catX + 90, catY + 135, catX + 85, catY + 130, catX + 95, catY + 130);
  line(catX + 90, catY + 140, catX + 75, catY + 150);
  line(catX + 90, catY + 140, catX + 105, catY + 150);
  
  /*eyes*/
  noStroke();
  fill(0,0,0);
  ellipse(catX + 60, catY + 97, 20,20);
  ellipse(catX + 120, catY + 97,20,20);
  fill(255);
  ellipse(catX + 55, catY + 97,2,2);
  ellipse(catX + 115, catY + 97,2,2);
  ellipse(catX + 63, catY + 95, 5,5);
  ellipse(catX + 123, catY + 95,5,5);
  fill(0);
  return 1;
}

  boolean caught(Mouse m) {
    // Calculate distance
    float distance = dist(catX + 100, catY + 70, m.xpos, m.ypos); 
    
    // Compare distance to sum of radii
    if (distance < 50) { 
      m.caught = true;
      return true;
    } else {
      return false;
    }
  }
}
class Menu{
  
  int drawMenu(){  
  int gamestate = 0;
  /*STARTMENU*/

  /*CAT*/ // gehele code van "monster" //

    /*Whiskers*/
    line(catX+10, catY+90, catX - 70, catY + 70);
    line(catX + 170,catY+90, catX + 250, catY + 70);
    line(catX +10, catY+110, catX - 70, catY + 110);
    line(catX + 170, catY+110, catX + 250, catY + 110);
    line(catX +10, catY + 130, catX - 70, catY + 150);
    line(catX + 170, catY + 130, catX + 250, catY + 150);
    
    /*Ears*/
    fill(216,141,70);
    triangle(catX, catY, catX, catY +100, catX + 190, catY + 100);
    triangle(catX +170, catY, catX + 190, catY + 100, catX + 40, catY + 100);
    fill(185,141,101);
    triangle(catX + 15, catY + 30, catX + 5, catY + 140, catX + 190, catY + 140);
    triangle(catX + 160, catY + 30, catX + 180, catY + 140, catX - 10, catY + 140);
  
    /*face*/
    fill(216,141,70);
    ellipse(catX + 90, catY + 110, 200, 130);
  
    /*nose*/
    stroke(255,196,196);
    fill(255,196,196);
    triangle(catX + 90, catY + 135, catX + 85, catY + 130, catX + 95, catY + 130);
    line(catX + 90, catY + 140, catX + 75, catY + 150);
    line(catX + 90, catY + 140, catX + 105, catY + 150);
  
    /*eyes*/
    noStroke();
    fill(0,0,0);
    ellipse(catX + 60, catY + 97, 20,20);
    ellipse(catX + 120, catY + 97,20,20);
    fill(255);
    ellipse(catX + 55, catY + 97,2,2);
    ellipse(catX + 115, catY + 97,2,2);
    ellipse(catX + 63, catY + 95, 5,5);
    ellipse(catX + 123, catY + 95,5,5);
    fill(0);
    
    
    text("MOUSE MANIA", 130, 170); // Startscherm tekst
    text("CLICK TO START", 110, 260); // Startscherm tekst
    if (mousePressed) { // Spel begint zodra je klikt
      gamestate = 1;
      return gamestate; // leidt je naar spel
    }
    else{
      return gamestate;
    }
    
} 
}
class Mouse{
  float xpos;
  float ypos;
  float yspeed;
  float cursorX;
  float cursorY;
  boolean caught;
  
  Mouse(){
    catcherImg = loadImage("Muis.png");
    xpos = random(0, 800);
    ypos = -50;
    yspeed = random(1, 5);   
  }
  
  void move(float x, float y){
    if (!caught){
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
  
  void display(){
    image(catcherImg,xpos,ypos,50,50);
  }

  void fall(){  
    ypos = ypos + yspeed;
  }
  
  int missed(){
    int missed = 0;
    if (ypos > 670){
      yspeed = 0;
      ypos = -100;  
      missed = 1;        
    } 
     return missed;
  }
}



