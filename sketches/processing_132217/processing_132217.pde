
Bird myBird; //vallend object en vanger
PImage bg; //achtergrond afbeelding

//achtergrond muziek
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){
  size(500,500); //grootte van het beeld
  myBird = new Bird(); //class vallend object en vanger
  bg = loadImage("achtergrond2.jpg"); //achtergrond afbeelding
  
  //achtergrond muziek
  minim = new Minim(this);
  player = minim.loadFile("Angrybirds.mp3", 2048);
  player.play();
}

void draw(){
  background(bg); //aanspreken achtergrond afbeelding
  myBird.display(); //tekenen van vallend object
  myBird.move(); //beweging van vallend object
  myBird.displaycatcher(); //tekenen van vanger
  myBird.catchcatcher(); //begewing van vanger
  myBird.levens(); //aantal levens
  myBird.gameover(); //gameover scherm
  myBird.levels(); //aantal levels
}

class Bird{
  float x; //positie van vallend object op x-as
  float y; //positie van vallend object op y-as
  float snelheid; //snelheid van vallend object
  PImage img; //vallend object
  int teller; //score teller
  int punten; //levens teller
  int score = 0; //begin van score
  boolean gameover; //gameover scherm
  
  Bird(){
    snelheid = 10; //snelheid van vallend object
    punten = 10; //aantal gevallen objecten
    teller = 0; //score bijhouden
  }
  
  void display(){
  img = loadImage("angrybird.png"); //vallend object
  image(img, x, y);
  }
  
  void move(){//vallend object valt daadwerkelijk
    y = y + snelheid;
    y++;
    if (y > height) {
    y = 0;
    }
    if (y == 0) {
    x = random(40,460);
    punten = punten-1;
    }
  }
    
  void displaycatcher(){//laten zien van vanger
      fill(220, 143, 37);
      stroke(220, 143, 37);
      rect(mouseX, 445, 100, 7);
      rect(mouseX, 433, 7, 15);
      rect(mouseX+93, 433, 7, 15);
    }
    
  void catchcatcher(){//vangen van vanger
      if (x <mouseX+40 && x > mouseX-60 && y > 380) {
    y=0;
    teller = teller+1;
    println(teller);
    x = random(40,460);
    score = score +1;
    }
    
  fill(255, 0, 0);//text score is, score bijhouden
  text("Score is " + score, 20, 30);
  textSize(18);
  
  fill(255, 0, 0);//text lives, aantal levens
  text("Lives " + punten, 20, 60);
  textSize(30);
  
  }
  
  void levens(){//aantal levens dat je over hebt, per level gaat snelheid omhoog
    if (teller > 10) { 
    snelheid = 10;
  }
  if (teller > 20) { 
    snelheid = 12;
  }
  if (teller > 30) { 
    snelheid = 14;
  }
  if (teller > 30) { 
    snelheid = 16;
  }
  if (teller > 40) { 
    snelheid = 18;
  }
  if (teller > 50) { 
    snelheid = 20;
  }
  if (teller > 60) { 
    snelheid = 22;
  }
  }
  
  void gameover(){//gameover bij 0 punten
    if (punten < 1) {
    gameover = true;
    }
    
    if (gameover) {//gameover scherm
   background(255);
   
   textAlign(CENTER);
   fill(0);
   textSize(60);
   text("GAME OVER",width/2,height/2);
  }
  }
  
  void levels(){//levels, bij elke 10 punten ga je een level omhoog
      if (teller < 10) {
    fill(0);
    textSize(18);
    text("Level 1", 420, 30);
  }
  if (teller < 20 && teller > 9) {
    fill(0);
    textSize(18);
    text("Level 2", 420, 30);
  }
  if (teller < 30 && teller > 19) {
    fill(0);
    textSize(18);
    text("Level 3", 420, 30);
  }
  if (teller < 40 && teller > 29) {
    fill(0);
    textSize(18);
    text("Level 4", 420, 30);
  }
  if (teller < 50 && teller > 39) {
    fill(0);
    textSize(18);
    text("Level 5", 420, 30);
  }
  if (teller < 50 && teller > 49) {
    fill(0);
    textSize(18);
    text("Level 5", 420, 30);
  }
  if (teller < 60 && teller > 59) {
    fill(0);
    textSize(18);
    text("Level 6", 420, 30);
  }
  if (teller < 70 && teller > 69) {
    fill(0);
    textSize(18);
    text("Level 7", 420, 30);
  }
}
}



void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


