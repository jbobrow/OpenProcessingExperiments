
//start Importing Audio
import ddf.minim.*;
Minim minim;
AudioSample missed;
AudioPlayer endscreen;
AudioPlayer backgroundmusic;
AudioSample nomnom;


//end Importing Audio

//start Variables
Io Nest;
explosie Knal;
GameStart beginSpel;
GameEnd eindSpel;
EnemySpawner maakVijand;


//[change game core]
int levens = 130;
int HitMissMoments = 10;
int MaxSpeedEnemies = 5;     // mini
int MaxSpawnRate = 200;     //standart 200
int StandardVolume = -30;  //goes from -80 to +14)
int Muted = 0;
//[end change game core]


String ScoreTekst = "";
ArrayList Nios_in_beeld, RaakMis, explosie_in_beeld;
int teller, nieuwe_Nio_timer, volume, hoeveelPlaatjes, hoeveelPlaatjesNIO, eaten, counter; 

PFont MooieLetters;
PImage soundicon;
PImage achtergrond, achtergrond2, overlay;
PImage[] explosiePlaatjesArray;
PImage[] nioPlaatjesArray;
boolean  ScoreZichtbaar;

PImage mutepicture;
void setup() { 
  minim = new Minim(this);
  beginSpel = new GameStart();
}


void draw() { 
  
  maakVijand = new EnemySpawner();
  
  
}
void keyReleased() {

  if (key == 'm' || key == 'M') {
    if (Muted == 0 ) {
      Muted = 1;
      backgroundmusic.mute();
      missed.mute();
      endscreen.mute();
      nomnom.mute();
    }
    else { 
      Muted = 0;

      backgroundmusic.unmute();
      missed.unmute();
      endscreen.unmute();
      nomnom.unmute();
    }
  }
}

//start Keep Score & Remove Enemies
void RaakOfMis (int x_loc_Nio, int welkeindelijst, int y_loc_Nio) {
  int x_loc_Io = Nest.MijnXLocatie();
  int y_loc_Io = Nest.MijnYLocatie();

  if ((abs(x_loc_Io - x_loc_Nio) < 50) ) {             //if enemyies do hit the player
    RaakMis.add(" Raak ");
    Nios_in_beeld.remove(welkeindelijst);
    explosie_in_beeld.add(new explosie(y_loc_Io-60));
    eaten++;
    volume += 4 ; 
    nomnom.setGain(StandardVolume);                             
    nomnom.trigger();
  }
  else if (y_loc_Nio > height+20) {                   //if enemies don't hit the player
    RaakMis.add(" Mis ");
    Nios_in_beeld.remove(welkeindelijst);
    if (levens > 0 ){
    levens+= -26;
    }
    missed.setGain(StandardVolume);
    missed.trigger();
  }
  println(RaakMis);
}

void verwijderExplosie() {
  explosie_in_beeld.remove(0);
}

//Audio Control


void stop()
{
  missed.close();
  endscreen.close();
  nomnom.close();
  minim.stop();

  super.stop();
}
//end Audio Control

class EnemySpawner {

  EnemySpawner() {
    if (levens > 0) {  
      if (RaakMis.size() <HitMissMoments) {
        background(achtergrond);
        teller++;

        if (teller == nieuwe_Nio_timer) {
          Nios_in_beeld.add(new Nio(MaxSpeedEnemies));
          teller = 0;
          nieuwe_Nio_timer = int(random(1, MaxSpawnRate));
        }

        for (int i=0;i<Nios_in_beeld.size();i++) {
          Nio MoronBird_temp = (Nio) Nios_in_beeld.get(i);
          MoronBird_temp.display();
          MoronBird_temp.beweeg(i);
        }

        for (int i=0;i < explosie_in_beeld.size();i++) {
          explosie explosie_temp = (explosie) explosie_in_beeld.get(i);
          explosie_temp.display(Nest.MijnXLocatie());
        }
        fill(#642d28);
        rectMode(CORNER);
        stroke(#009900, 0);
        rect((width-1), (0+9), (levens*-1), 20);
        imageMode(CORNER);
        image(overlay, 0, 0);
        Nest.display();
        Nest.beweeg(mouseX);

        fill(50);
        textFont(MooieLetters, 15);
        textAlign(CENTER);
        text(eaten, (width/10), (height/24));
        if (Muted == 0 ) {
          mutepicture = loadImage("speakerunmute.png");
        }
        if (Muted != 0) {
          mutepicture = loadImage("speakermute.png");
        }
        image(mutepicture, (width - width/14), (height/14) );

        fill(#ffffff);
        textFont(MooieLetters, 15);
        textAlign(CENTER);
        text((round(levens/1.3))+ "%", (width-75), (height/28));
      }
      else {
        if (eindSpel == null) {
          eindSpel = new GameEnd();
        }
      }
    }
    else {
      if (eindSpel == null) {
        eindSpel = new GameEnd();
      }
    }
  }
}

class GameEnd {

  GameEnd() {
    background(achtergrond2);
    Voorbereiding();
    BeeldTekstAf();


    println(volume);
    endscreen.setGain(StandardVolume + volume);
    endscreen.play();
  }

  void Voorbereiding() { 
    for (int i=0; i<RaakMis.size();i++) {
      ScoreTekst += RaakMis.get(i);
      counter++;
      if (counter >= 5 ) {
        ScoreTekst += "\n" ;
        counter=0;
      }
    }
  }
  void BeeldTekstAf() {
    fill(255);
    textAlign(CENTER);
    textFont(MooieLetters, 25);
    text("Je behaalde resultaten", (width/2), (height/8));
    textFont(MooieLetters, 15);
    text(ScoreTekst, (width/2), (height/6));
  }
}

class GameStart {
  GameStart() {
    size(440, 700);
    achtergrond = loadImage("background.png");
    overlay = loadImage("overlay.png");
    achtergrond2= loadImage("background2.jpg");
    explosie_in_beeld = new ArrayList();
    Nios_in_beeld = new ArrayList ();
    RaakMis = new ArrayList ();

    nieuwe_Nio_timer = MaxSpawnRate ;
    Nest = new Io();

    ////////////////////////////////////////////
    hoeveelPlaatjesNIO = 14;
    nioPlaatjesArray = new PImage[hoeveelPlaatjesNIO] ;
    for (int i=0;i<hoeveelPlaatjesNIO; i++) {
      nioPlaatjesArray[i] = loadImage("enemy/try2/nio_body_" + nf((i+1), 4) + ".png");
    }
    //////////////////////////////////////
    hoeveelPlaatjes = 11;
    explosiePlaatjesArray = new PImage[hoeveelPlaatjes] ;
    for (int i=0;i<hoeveelPlaatjes; i++) {
      explosiePlaatjesArray[i] = loadImage("explosie/explosion_" + nf((i+1), 4) + ".png");
    }


    missed = minim.loadSample("missed.wav", 1024);
    nomnom = minim.loadSample("nomnom.mp3");
    endscreen = minim.loadFile("tafel.wav");
    backgroundmusic = minim.loadFile("backgroundmusic.wav") ;              //http://www.freesound.org/people/ERH/sounds/64436/
    backgroundmusic.setGain(StandardVolume+30);
    backgroundmusic.loop();

    MooieLetters = loadFont("UnrealTournament-30.vlw");
  }
}

class Io {
  float rotatie, hoek;
  PImage iobody;
  int MijnXLocatie() {
    return int(x_loc);
  }
  int MijnYLocatie() {
    return int(y_loc);
  }
  float x_loc; 
  float y_loc;
  float x_speed;


  Io() {
    iobody = loadImage("io_body.png");
    x_loc = width/2;
    y_loc = height-56;
    x_speed = 0;
    hoek = 0 ;
    rotatie = 0.01;
  }

  void display() {

    pushMatrix(); 
    
    rectMode(CORNER);
    rotate(hoek);
    //rect(height/2, width/2, 50, 50); 
    popMatrix();  
    imageMode(CENTER);
    image(iobody, x_loc, y_loc);
  }

  void beweeg(int WaarNaarToe) {
    x_speed = ( WaarNaarToe - x_loc )/10;
    x_loc = x_loc+x_speed ;
    hoek = hoek+ sin (rotatie)*2;
    if (hoek <-1.5 || hoek > 0.3 ) {
      rotatie = rotatie * -1;
    }
  }
}


class Nio {
  // variabelen
  int x_loc; 
  int y_loc;
  int y_speed;
  Nio_body Lichaam;  
  Nio_limb Vleugel;


  Nio(int maxsnelheid) {

    Lichaam = new Nio_body();
    Vleugel = new Nio_limb();

    x_loc = int(random(60, width-65));
    y_loc = 0-60;

    //x_speed = int (random(2,4));
    y_speed = int (random (2, maxsnelheid));
    // y_speed = 40;
  }

  void display() {
    Vleugel.display(x_loc, y_loc);    
      Lichaam.display(x_loc, y_loc);
    
    Vleugel.draai();
  }



  void beweeg(int WelkeInDeLijst) {
    if (y_loc > height-136) {
      RaakOfMis(x_loc, WelkeInDeLijst, y_loc);
    }
    y_loc = y_loc+y_speed;
  }
}





class Nio_body {
  float WelkPlaatjeIsZichtbaar;

  void display(float x_loc_param, float y_loc_param) {
    imageMode(CENTER);
     image(nioPlaatjesArray[round(WelkPlaatjeIsZichtbaar)], x_loc_param, y_loc_param);
    if (WelkPlaatjeIsZichtbaar < hoeveelPlaatjesNIO-1) {
      WelkPlaatjeIsZichtbaar+=0.50;
    }
    if (WelkPlaatjeIsZichtbaar == hoeveelPlaatjesNIO-1) {
      WelkPlaatjeIsZichtbaar = 0;
    }
  }
}





class Nio_limb {
  float x_loc, y_loc;
  float hoek, rotatie;
  int draailocatie  ; 
  int rectWidth, rectHeight, triaX, triaY ; 
  PImage limbpicture;

  //   Nio_limb2 extraArm;


  Nio_limb() {

    limbpicture = loadImage("rotorblade.png");
    rectWidth = 30;
    rectHeight = 10;
    triaX = 50;
    triaY= 90;
    hoek = 0;
    rotatie = random(0.10, 0.30);
  }

  void display(float x_loc_param, float y_loc_param) {
    pushMatrix();
    translate(x_loc_param-33, y_loc_param-44);
    rotate(hoek);
    imageMode(CENTER);
//    fill(#990000);
    image(limbpicture,0,0);
    //image(limbpicture, rectWidth, rectHeight );
    popMatrix();

    pushMatrix();
    translate(x_loc_param+37, y_loc_param-40);
    rotate(hoek*-1);
    imageMode(CENTER);
//    fill(#990000);
    image(limbpicture,0,0);
    popMatrix();
  }

  void draai() {

    hoek = hoek+ sin (rotatie)*2;
    
  }
}


class explosie {

  int y_loc;
  float WelkPlaatjeIsZichtbaar;

  explosie (int y_loc_param) {
    y_loc = y_loc_param ;
  }

  void display (int x_loc_param) {
    imageMode(CENTER);
    image(explosiePlaatjesArray[round(WelkPlaatjeIsZichtbaar)], x_loc_param, y_loc-10);

    if (WelkPlaatjeIsZichtbaar < hoeveelPlaatjes-1) {
      WelkPlaatjeIsZichtbaar+=0.50;
    }
  }
}



