
// speler: 

float playerX = 225;
float playerY= 225;

// afbeeldingen:

PImage img; // achtergrond
PImage img2; // speler 
PImage img3; // ballen (objecten)
PImage gameover; // game over scherm

// muziek achtergrond:

import ddf.minim.*;
AudioPlayer player;
Minim minim; // audio context

void setup (){
  size(500,300); // canvas grootte
  smooth();
  img = loadImage("anfieldroad.jpg"); // achtergrond
  img2 = loadImage("voetballertje.png"); // speler
  img3 = loadImage("voetbal.png"); // ballen
  gameover = loadImage("gameover.jpg"); // gameover
  
eersteVoetbal = new Voetbal (100,10,50,40,1); // drukpers objecten
tweedeVoetbal = new Voetbal (200,10,50,40,3); // drukpers objecten
derdeVoetbal = new Voetbal (300,10,50,40,2); // drukpers objecten
  
  // scorebord:
  
  fontG = createFont("Arial", 48); // tekst
  fontS = createFont("Tahoma", 16); // tekst
           
  importHighscore(); // highscore
  
  // Muziek achtergrond: 
  
  minim = new Minim(this);
  player = minim.loadFile("YNWA.mp3");
  player.play();
}

void draw (){
  
  image(img,0,0,500,300); // achtergrond
  tekenSpeler();
  
  eersteVoetbal.update(); // update
  eersteVoetbal.test(); // test
  eersteVoetbal.teken(); // teken
  
  tweedeVoetbal.update(); // update
  tweedeVoetbal.test(); // test 
  tweedeVoetbal.teken(); // teken
  
  derdeVoetbal.update(); // update
  derdeVoetbal.test(); // test
  derdeVoetbal.teken(); // teken
  

  // scorebord:
  
  if (state == 'p'){ // Play

  // scorebord:
  
  }
  textFont(fontS);
  fill(255,0,0); // rood
  text(SC + score, 25, 25); // tekst score aanmaken + positie
  text(HS + highscore, 25, 45); // tekst highscore aanmaken + positie
  text(MI + mis, 25,65); // tekst mis aanmaken + positie
  updateHighscore(); 
}




// besturing dmv de a (links), d (rechts), z (score resetten), x (highscore resetten) en de v(muziek stoppen) toets. 

void keyPressed() {
 if (key == 'z'){ // Score naar 0 terugzetten
 score = 0;
 return;
 }
 if (key == 'x'){ // Highscore terug naar 0 zetten
 highscore = 0;
 return;
 }
 if (key == 'v'){ // Stop de muziek
 minim.stop();
 }
 if (key == 'd'){ // Beweeg naar rechts
 playerX = playerX + 25;
 }
 if  (key == 'a') // Beweeg naar links
 {
 playerX = playerX - 25;
 }
}
// objecten declareren

Voetbal eersteVoetbal;
Voetbal tweedeVoetbal;
Voetbal derdeVoetbal;
Voetbal vierdeVoetbal;


// Class "Voetbal": 

class Voetbal{
  float voetbalX;
  int voetbalY;
  int voetbalBreedte;
  int voetbalHoogte;
  int voetbalRichting;

  
  Voetbal(float tempX, int tempY, int tempBreedte, int tempHoogte, int tempRichting){
  voetbalX= tempX;
  voetbalY = tempY;
  voetbalBreedte = tempBreedte;
  voetbalHoogte = tempHoogte;
  voetbalRichting = tempRichting;

  }
  void update(){
  voetbalY = voetbalY + voetbalRichting; // beweging aanmaken
  }
  
  void test(){ 
  if(X > voetbalX && Y < voetbalX+40 && Y > voetbalY){ // richting testen
    voetbalRichting = - voetbalRichting ; // richting
  }
  if(voetbalY > height){ // positie objecten bepalen
    voetbalX = random(width);
    voetbalY = 0;
  }
  if(voetbalX > playerX && voetbalY > playerY && voetbalX < playerX+40){ // de bal raakt de speler
    upScore(); // score + 1
    voetbalX = random(width); // de ballen beginnen opnieuw verdeelt over de hele breedte
    voetbalY = 0; // de ballen beginnen vanaf de hoogte 0
  }
  if(voetbalX >= 300 && voetbalY >= 300){ // punten aftellen
    downScore(); // punten aftellen
  }
  if(mis >= 50){ // game over 
   image (gameover,-35,-50); // positie game over scherm
   voetbalY = -40; // objecten verdwijnen
   voetbalX = -40; // objecten verdwijnen
   score = score; // behaalde score is te zien
  }
  }
  void teken(){ // speler maken 
  image(img3,voetbalX,voetbalY,voetbalBreedte,voetbalHoogte);
}
}

//score bord:

int mis = 0 ; // mis start bij 0
int score = 0 ; // score begint met 0
int highscore;
PFont fontS, fontG; 

String highscoreFile = "highscore.txt";
final String SC = "Score: ";
final String HS = "Highscore: ";
final String MI = "Mis: ";
final String GO = "Game Over: ";

PrintWriter output;
BufferedReader reader;

int state = 'p';

float direction;

// score bord:
                
  void showGame(String msg){
  textFont(fontG);
  fill(110, 50, 255);
  text(msg, (width - textWidth(msg)) / 2, height / 2);
  }
  
  // puntentelling: 
                 
  void upScore() {
  score = score +1; // score optellen
  }
  
  void downScore () {
   mis = mis + 1; // missers optellen
  }
  
  // highscore: 
  
  void updateHighscore() { 
  if (highscore < score) {
  highscore = score;
 
  output = createWriter(highscoreFile);
  output.println(highscore);
  output.close(); // Writes the remaining data to the file & Finishes the file
  }
  }
                 
  void importHighscore() {

  reader = createReader(highscoreFile);
  if (reader == null) {
  highscore = 0;
  return;
  }
  
  String line;
  try {
  line = reader.readLine();
  } catch (IOException e) {
  e.printStackTrace();
  line = null; 
  }
  
  if (line != null) {
  highscore = int(line);
  println(highscore);
  }
  try {
  reader.close();
  } catch (IOException e) {
  e.printStackTrace();
}
 }
// speler aanmaken

  void tekenSpeler (){ // speler maken
  fill(0); // zwart
  image(img2,playerX,playerY,90,86); // positie speler bepalen
}


