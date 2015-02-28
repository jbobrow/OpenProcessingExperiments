
class Catcher {
  float r;                                       // de radius
  float x, y;                                    // de locatie

  Catcher (float tempR) {
    r = tempR;
    x = 0;
    y = 0;
  }

  void setLocation (float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() { // het poppetje
    noStroke();
    ellipseMode(CENTER);


    fill(124, 252, 0);
    ellipse(x, y-10, r*5, r*3); //lichaam

    fill(255);
    ellipse (x-20, y-30, r*2, r*2);//oog
    ellipse (x+20, y-30, r*2, r*2);//oog

    fill(0);
    ellipse(x-20, y-35, r*1, r*1);//pupil
    ellipse(x+20, y-35, r*1, r*1);//pupil

    fill(0);
    ellipse( x, y-5, r*2, r*1);//mond
  }


  boolean intersect(Drops d) {                 // functie die bijhoud als je regendruppels vangt
    float distance = dist(x, y, d.x, d.y);     // afstand berekenen
    if (distance < r + d.r) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Drops {
  float r;                   // de radius van de regendruppel
  float x, y;                // de locatie van de druppels
  float speed;               // de snelheid van de regendruppel


  
  Drops (float tempR) {      // hoe de druppels vallen
    r = tempR;               //  de grootte van de druppels
    x = random(width);       // random locatie van de druppels
    y = 0;                   // hier begint de druppel
    speed = random(2, 3);    // de snelheid van de druppels
  }

  void fall() {
    y += speed*level;      // de snelheid gaat omhoog als je een level omhoog gaat
  }




  void display() {
    ;           // de druppels die naar beneden vallen: uiterlijk
    noStroke();
    fill(0,0,205);
    ellipseMode(CENTER);
    for (int i = 1; i < r; i++) {
      ellipse(x, y+i*2, i*2, i*2);
    }
  }

  void caught() {   // als de druppels worden gevangen, wordt de snelheid 0, en wordt bij de score opgeteld
    speed = 0;   // daarna word de druppel buiten het scherm geplaatst
    x = -1000;
    pos_score++;
    println(pos_score);
  }
  void offScreen() {   // als de druppel de onderkant raakt, wordt de snelheid 0 en wordt buiten het scherm geplaatst
    if (y > height+4) {
      neg_score--;
      x = -1000;
      speed = 0;
      y = 50;
    }
  }


  void score() {                           // blokjes die aftellen als je druppels niet raakt
    int y = 30;                            // staat aan de linker kant
    if (neg_score > 0) {                   // als je 0 hebt ben je af
      for (int i = 0; i < neg_score; i++) {
        fill(255, 106, 106);               // uiterlijk blokjes
        noStroke();
        ellipse(25, y, 30, 10);
        smooth();

        y = y + 20;    // de ruimte wat er tussen de bolletjes zit
      }
    }
    else {
      println("you lose.");
      exit();
    }
  }
}

class Timer {
   
  int savedTime;                               // De timer start
  float totalTime;                             // Hoe lang de timer doorgaat
   
  Timer (float tempTotalTime) {            
    totalTime = tempTotalTime;
  }
   
  void start() {                               
    savedTime = millis();                      // De timer wordt gestart en loopt in milliseconden
  }
   
  boolean isFinished() {                       // als de totale tijd voorbij is houd de functie op
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

import ddf.minim.spi.*;  //muziek
import ddf.minim.signals.*;//muziek
import ddf.minim.*;//muziek
import ddf.minim.analysis.*;//muziek
import ddf.minim.ugens.*;//muziek
import ddf.minim.effects.*;  // muziek

Minim minim;//muziek
AudioPlayer sou;//muziek

Catcher catcher;         // een object dat kan vangen
Drops[] drop;            // de druppels
Timer timer;             // de timer

int level = 1;           // je begint bij level 1
int pos_score = 0;       // je score is voordat je begint 0
int neg_score = 10;      // Het aantal levens dat je nog hebt
int totalDrops = 0;      // totale aantal druppels 


PImage img;              // achtergrond
void setup() {
  minim=new Minim(this);                           //muziek
  sou=minim.loadFile("Upbeat Ukulele Background Music - That Positive Feeling by Alumo.mp3");//muziek
  sou.loop();                                      //muziek

  size (800, 450);                // grootte van het scherm
  img = loadImage("natuur.jpg");  // foto op achtergrond
  catcher = new Catcher(15);      // maakt de vanger, met een radius van 15
  drop = new Drops[1000];         // maakt in totaal 1000 druppels
  timer = new Timer(random(300, 1000)); // timer gaat elke seconde af

  timer.start();                  // start de timer

  smooth();
}

void draw() {


  background (img);  // de achtergrond is een foto
  
  catcher.setLocation(mouseX, mouseY);  // de locatie van de catcher
  catcher.display();                    // laat de catcher zien

  if (timer.isFinished()) {  // als het spel start
    drop[totalDrops] = new Drops(random(5, 10)); // gaan er druppels vallen
    totalDrops++;                          // totale aantal druppels
    if (totalDrops>= drop.length) {        // als de druppel de onderkant raakt begint deze opnieuw
      totalDrops = 0;
    }
    timer.start();
  }

  for (int i = 0; i < totalDrops; i++) {       // beweegt en laat de druppels zien
    drop[i].fall();
   
    drop[i].display();
    drop[i].score();

    if (catcher.intersect(drop[i])) {
      drop[i].caught();
    }

    drop[i].offScreen();
  }
  if (pos_score == 20) {  // als er 50 druppels zijn gevallen
    level++;              // ga je een level hoger, gaan de druppels sneller
    pos_score = 0;
    println("level "+level);
    neg_score = 10;  // Je krijgt 10 levens als je een level hoger gaat
  }
}




