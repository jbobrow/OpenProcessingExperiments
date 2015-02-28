
//========ArrayLists Minim AudioPlayers und globale Variablen
import ddf.minim.*;
Minim song;
Minim click;
Minim shot;
Minim reload;
Minim shell;
Minim scream;
Minim die;
Minim die2;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
ArrayList<Megusta> megustaKiste = new ArrayList<Megusta>();
ArrayList<Fast> fastKiste = new ArrayList<Fast>();
ArrayList<Troll> trollKiste = new ArrayList<Troll>();
ArrayList<Dumm> dummKiste = new ArrayList<Dumm>();
float q = 0;
int Schuesse = 8;
int points = 0;
String time = "050";
int t = 50;
int interval = 50;
//=============================================================================Setup
void setup() {
  //=============================================Sounds
  song = new Minim (this);
  player = song.loadFile ("song.mp3");
  player.play ();
  player.loop();
  click = new Minim (this);
  player2 = click.loadFile ("click.mp3");
  shot = new Minim (this);
  player3 = shot.loadFile ("shot.mp3");
  reload = new Minim (this);
  player4 = reload.loadFile ("reload.mp3");
  shell = new Minim (this);
  player5 = shell.loadFile ("shell.mp3");
  scream = new Minim (this);
  player6 = scream.loadFile ("scream.mp3");
  die = new Minim (this);
  player7 = die.loadFile ("die.mp3");
  die2 = new Minim (this);
  player8 = die2.loadFile ("die2.mp3");
  //========================erschaffe  neue Bots in ArrayLists
  for (int i= 0; i<10; i++) {
    trollKiste.add(new Troll());
  }
  for (int i= 0; i<10; i++) {
    fastKiste.add(new Fast());
  }
  for (int i= 0; i<10; i++) {
    dummKiste.add(new Dumm());
  }
  for (int i= 0; i<10; i++) {
    megustaKiste.add(new Megusta());
  }
  imageMode(CENTER);//=============allgemeine Grundinfos
  size(1300, 700);
  noStroke();
  background(0);
  frameRate(100);
  textSize(32);
}
//==============================================================================draw
void draw() {
  //====================================allgemeine Funktionen
  tint(255, 255);
  fill(0, 180);
  rect(0, 0, 1500, 800);

  //============================================FunktionenBots
  for (Troll t:trollKiste) {
    t.move();
  }
  for (Fast f:fastKiste) {
    if (!f.move()) {
      f.isdead=true;
      if (f.sichtbarkeit<1) {
        fastKiste.remove(f);
        break;
      }
    }
  }
  tint(255, 255);
  for (Dumm d:dummKiste) {
    if (!d.move()) {
      d.isdead=true;
      if (d.sichtbarkeit<1) {
        dummKiste.remove(d);
        break;
      }
    }
  }
  tint(255, 255);

  for (Megusta m:megustaKiste) {
    if (!m.move()) {
      m.isdead=true;
      if (m.sichtbarkeit<1) {
        megustaKiste.remove(m);
        break;
      }
    }
  }
  tint(255, 255);
    //===================================points und Countdown
  fill(255);
  text(("points: "+points), 1050, 40);
  time = nf(t, 3);
  if (t == 0) {
    textSize(64);
    fill(255,0,0);
    text(("GAME OVER"), width/2, height/2);
    t = 0;
    textSize(32);
    fill(255);
    text(("points: "+points), width /2, height/2 +64);
  }
  else{text(time, width/2, 40);
  t = interval-int(millis()/1000);
  }
    //===============================Schüssebilder
  gunshell();
  //==============================================Maus
  PImage fadenkreuz = loadImage("fdkreuz.png");
  image(fadenkreuz, mouseX, mouseY, 90, 90);
}

class Dumm { 
  //===================================================Variablen
  PImage dummpic = loadImage("dummy.png");
  PImage dummpicdead = loadImage("dummdead.png");
  float x = random(1300);
  float y =random(700);
  float r = 1;
  float sichtbarkeit = 255;
  float q = random(0.001, 0.1);
  boolean isdead = false;
  //=====================================================Methode Move
  boolean move() {
    //========================tot
    if (isdead == true) {
      tint(255, sichtbarkeit);
      image(dummpicdead, x, y, 90, 90);
      sichtbarkeit= sichtbarkeit -5;
      return false;
    }
    //=======================lebend(bewegen)
    tint(255, 255);
    noiseDetail(4, 0.7);
    r=noise(q)*4;  
    q = q+random(0.001, 0.1);
    image(dummpic, x, y, 80, 80);
    if (mousePressed == false || dist(mouseX, mouseY, x, y)>40 || Schuesse == 0) { //lebend
      boolean lstatus= true;
      //=====================bewegen
      if (r<=1) {
        x = x + random(5, 10);
      }
      else if (r<=2) {
        x = x - random(5, 10);
      }
      else if (r<=3) {
        y = y + random(5, 10);
      }
      else {
        y = y -random(5, 10);
      }
      if (x>width) {
        x=0;
      }
      if (x<0) {
        x=width;
      }
      if (y>height) {
        y=0;
      }
      if (y<0) {
        y=height;
      }
      return lstatus;
    }
    else {
      //==============================sterben
      player6.play (0);
      if (t>0) {
        points= points + 50;
      }
      boolean lstatus = false;
      return lstatus;
    }
  }
}


//======================================Schiessen
void mousePressed() {
  if (Schuesse >0) {
    Schuesse = Schuesse - 1;
    player3.play (0);
    player5.play (-300);
  }
  else {
    Schuesse = 0;
    player2.play (0);
  }
}
//======================================Nachladen
void keyPressed() {
  if (key == ' ') {
    Schuesse = 8;
    player4.play (0);
  }
}
//=======================================SchüsseAnzeige
void gunshell() {
  PImage gunshell = loadImage("gunshell.png");
  for (int i = 0; i < Schuesse; i++) {
    image(gunshell, i* 25 +25, 50, 25, 70);
  }
}

class Troll { 
  PImage trollpic = loadImage("troll.png");
  float x = random(1300);
  float y = random(700);
  float r = 1;
 
  void move() {
    image(trollpic, x, y, 50, 50);
    r=random(4);
    if (r<=1) {
      x = x + 5;
    }
    else if (r<=2) {
      x = x - 5;
    }
    else if (r<=3) {
      y = y + 5;
    }
    else {
      y = y -5;
    }
    if (x>width) {
      x=0;
    }
    if (x<0) {
      x=width;
    }
    if (y>height) {
      y=0;
    }
    if (y<0) {
      y=height;
    }
    if(dist(mouseX, mouseY, x, y)<40){
      x = x + x- mouseX;
      y = y + y -mouseY;
    }
  }
}

class Fast { 
  //===================================================Variablen
  PImage fastpic = loadImage("fasty.png");
  PImage fastpicdead = loadImage("fastydead.png");
  float x = random(1300);
  float y =random(700);
  float r = 1;
  float sichtbarkeit = 255;
  float q = random(0.001, 0.1);
  boolean isdead = false;
  //=====================================================Methode Move
  boolean move() {
    //========================tot
    if (isdead == true) {
      tint(255, sichtbarkeit);
      image(fastpicdead, x, y, 40, 40);
      sichtbarkeit= sichtbarkeit -5;
      return false;
    }
    //=======================lebend(bewegen)
    tint(255, 255);
    noiseDetail(4, 0.7);
    r=noise(q)*4;  
    q = q+random(0.001, 0.1);
    image(fastpic, x, y, 40, 40);
    if (mousePressed == false || dist(mouseX, mouseY, x, y)>40 || Schuesse == 0) { //lebend
      boolean lstatus= true;
      //=====================bewegen
      if (r<=1) {
        x = x + random(10, 15);
      }
      else if (r<=2) {
        x = x - random(10, 15);
      }
      else if (r<=3) {
        y = y + random(10, 15);
      }
      else {
        y = y -random(10, 15);
      }
      if (x>width) {
        x=0;
      }
      if (x<0) {
        x=width;
      }
      if (y>height) {
        y=0;
      }
      if (y<0) {
        y=height;
      }
      return lstatus;
    }
    else {
      //==============================sterben
      player8.play(0);
      if (t>0) {
        points= points + 100;
      }
      boolean lstatus = false;
      return lstatus;
    }
  }
}

class Megusta { 
  //===================================================Variablen
  PImage megustapic = loadImage("megusta.png");
  PImage megustapicdead = loadImage("megustadead.png");
  float x = random(1300);
  float y =random(700);
  float r = 1;
  float sichtbarkeit = 255;
  boolean isdead = false;
  //=====================================================Methode Move
  boolean move() {
    //========================tot
    if (isdead == true) {
      tint(255, sichtbarkeit);
      image(megustapicdead, x, y, 100, 100);
      sichtbarkeit= sichtbarkeit -5;
      return false;
    }
    //=======================lebend(bewegen)
    tint(255, 255);
    r= random(4);
    image(megustapic, x, y, 100, 100);
    if (mousePressed == false || dist(mouseX, mouseY, x, y)>40 || Schuesse == 0) { //lebend
      boolean lstatus= true;
      //=====================bewegen
      if (r<=1) {
        x = x + random(6, 10);
      }
      else if (r<=2) {
        x = x - random(6, 10);
      }
      else if (r<=3) {
        y = y + random(6, 10);
      }
      else {
        y = y -random(6, 10);
      }
      if (x>width) {
        x=0;
      }
      if (x<0) {
        x=width;
      }
      if (y>height) {
        y=0;
      }
      if (y<0) {
        y=height;
      }
      return lstatus;
    }
    else {
      //==============================sterben
      player7.play(0);
      if (t>0) {
        points= points + 30;
      }
      boolean lstatus = false;
      return lstatus;
    }
  }
}



