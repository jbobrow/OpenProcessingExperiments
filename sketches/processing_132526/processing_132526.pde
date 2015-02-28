
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;            //audio

Minim minim;                      //audio
AudioPlayer sou;

Catcher catcher;              //vang poppetje
Drops[] drop;                 //de drop
Timer timer;                  //timer object
int level = 1;                //begin level 1
int pos_score = 0;           //score is 0 bij begin
int neg_score = 3;          //aantal levens
int totalDrops = 0;           //totale drops

PImage img;                  //plaatje
void setup() {
  minim=new Minim(this);    //plaatjes
  sou=minim.loadFile("Fire Aura.mp3");    //muziek
  sou.loop();                    //loop muziek
  size (1193, 554);            //groote
  img = loadImage("skyline.png"); //afbeelding file
  catcher = new Catcher(40);  //catcher met een radius van 20
  drop = new Drops[1000];     //1000 nieuwe drops
  timer = new Timer(random(300, 1000));  //timer die random gaat

  timer.start();              //timer starten
}

void draw() {
  background (img);                     //achtergrond plaatje
  catcher.setLocation(mouseX, mouseY); //catcher gaat met muis mee
  catcher.display();                  //laat de catcher zien

  if (timer.isFinished()) {           //als timer begint vallen er druppels
    drop[totalDrops] = new Drops(random(5, 10));  //
    totalDrops++;
    if (totalDrops>= drop.length) {
      totalDrops = 0;
    }
    timer.start();
  }

  for (int i = 0; i < totalDrops; i++) {
    drop[i].fall();
    //drop[i].setColor();
    drop[i].display();
    drop[i].score();

    if (catcher.intersect(drop[i])) {
      drop[i].caught();
    }

    drop[i].offScreen();
  }
  if (pos_score == 20) {          //score voor level up
    level++;
    pos_score = 0;
    println("level "+level);
    neg_score = neg_score + 1;          //+1 Leven bij level up
  }
}


class Catcher {
  float r;
  float x,y;
   
  Catcher (float tempR) {
    r = tempR;
    x = 0;
    y = 0;
  }
   
 void setLocation (float tempX, float tempY) {
 x = tempX;
 y = tempY;
}
 
                        
void display() {         //mannetje die de catcher is
  noStroke();
  fill(250,0,0);
  rect(x,y,10,50);
  rect(x-29,y-29,5,50);
  rect(x,y-30,30,30);
  fill(0,250,0);
  rectMode(CENTER);
  rect(x,y,60,20);
    rect(x,y+30,20,20);
    rect(x+10,y+40,7,40);
      rect(x-10,y+40,7,40);
      fill(255,0,0);
      rect(x-20,y+60,30,10);
       rect(x+20,y+60,30,10);
 
}
 
  
 boolean intersect(Drops d) {        //functie die kijkt of regendrop gevangen word
  float distance = dist(x,y,d.x,d.y);      //afstand berekenen
  if (distance < r + d.r) {
    return true;
  } else {
    return false;
  }
 }
}

class Drops {
  float r;
  float x, y;
  float speed;



  Drops (float tempR) {
    r = tempR;              //groote drop
    x = random(width);      //random drop locatie
    y = -r*4;                //drop begin iets boven het scherm
    speed = random(1, 4);      //random snelheid tussen 1 en 4
  }

  void fall() {        //snelheid van druppels wordt groter naarmate het level hoger is
    y += speed*level;
  }



  void display() {
    ;      //hoe ziet het drop object eruit
    noStroke();
    //fill(col);
    fill(0, 255, 0);
    ellipseMode(CENTER);
    for (int i = 3; i < r; i++) {
      ellipse(x, y, i+2, i+9);
    }
  }

  void caught() {       //als drop wordt gevangen wordt snelheid nul wordt er bij de score opgeteld en wordt de
    speed = 0;          //  drop ver buiten het scherm geplaatst
    x = -1000;
    pos_score++;
    println(pos_score);
  }
  void offScreen() {    //als de drop de onderkant raakt wordt snelheid nul wordt score afgetrokken en drop uit het scherm geplaatst
    if (y > height+4) {
      neg_score--;
      x = -1000;
      speed = 0;
      y = 50;
    }
  }


  void score() {                //score
    int y = 30;                  //score wordt rechts van het scherm getekend als score 0 is ben je af
    if (neg_score > 0) {
      for (int i = 0; i < neg_score; i++) { 
        fill(255, 0, 0);               //uiterlijk score
        noStroke();
        rect(1180, y, 20, 20);
        y = y + 30;
      }
    }
    else {
      println("you lose.");
      exit();
    }
  }
}

class Timer {

  int savedTime;       //timer start
  float totalTime;     //hoe lang timer doorgaar

  Timer (float tempTotalTime) {
    totalTime = tempTotalTime;
  }


  void start() {               //timer wordt gestart en onthoud het in miliseconde
    savedTime = millis();
  }

  boolean isFinished() {            //als total tijd voorbij is dan houd de functie op.
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}



