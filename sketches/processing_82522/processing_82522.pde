
/*
Build in Processing 2.0b5
Badr Ismaili
Interaction Design 
Deadline 07-12-2012
Docent: Ton Markus

Gebaseerd op het stijldocument voor de lessen van Thinkg Of Art
Emo & Kleur
Muziek : http://soundcloud.com/cory-lee-stevens/dave-and-i
*/

import ddf.minim.*; // import muziek libary
Minim  minim;        // geheugen maken voor muziek libary

GameSetup gameSetup;   //geheugen vrij gemaakte classes
GameStart gameStart;
GameHome gameHome;
GameEnd spelEinde;
Heart heart;
Io Nest;
explosie knal;


AudioSample ExplosieSound; 
AudioPlayer ApplauseSound;
AudioSample FailSound;
AudioPlayer bgLoop; 

PFont font;    // geheugen vrij gemaakt  geluid

ArrayList RaakMis;  // geheugen vrij gemaakt arraylist
ArrayList Nios_in_beeld;
ArrayList explosies_in_beeld;
ArrayList heartList;


PImage nioImg; // geheugen vrij gemaakt  afbeeldingen
PImage bgImg;
PImage bgStartImg;
PImage bgEndImg;
PImage limbImg;
PImage ioImg;
PImage heartImg;
PImage[] ExplosiePlaatjes_main;


int hoeveelPlaatjes;  // geheugen maken voor getallen floats, strings vrimaken vrij 
int WelkeInDeLijst;
int teller, nieuwe_Nio_timer;
int moveHeart;
float x_posNio;
float volume;
String spelVerloop = "";
Boolean ShowEnd = false;
Boolean showStart = false;


void setup() { // Het hart 
  minim = new Minim(this);

  ExplosieSound = minim.loadSample("data/sound/explosie.mp3",256); 
  ApplauseSound = minim.loadFile("data/sound/applaus.mp3",256);
  bgLoop = minim.loadFile("data/sound/bgMusic.mp3");
  FailSound = minim.loadSample("data/sound/fail.mp3",256);
  
  
  gameSetup = new GameSetup(); // classes bestaan rechtgevem
  gameStart = new GameStart();
  gameHome = new GameHome();
  Nest = new Io(150);
}

void draw() { //  De 60fps machine

if(showStart == false){ // Beginscherm
    gameHome.gamePlayButton();
  }else if (showStart == true){
   
    
  gameStart.display(); // GameStarten



  


}} // Hier ziet de slash van de sluiter van show start

// Raak of mis heb ik hier gewoon in deze class geplaats want het is nog steeds best overzichtelijk.
void RaakOfMis( int x_locNio,int y_locNio, int HoeveelsteInDeLijst) { // dit doet een deel van de collision maar is wel een het gedeelte waarbij
  int x_locIo = Nest.WaarBenIk();
  int beslissingsafstand = x_locIo - x_locNio;
  if (abs(beslissingsafstand) < 50) { // absolute span breedte tussen de objecen is kleinder dan 50 
    RaakMis.add("raak");
    println("bots!!!!!!!!!!!!!!!!!!!!!!!!");
    //  Nios_in_beeld.remove(WelkeInDeLijst);
    ExplosieSound.trigger(); // 
    explosies_in_beeld.add(new explosie(x_locNio)); // explsie word aangemaakt
    //moveHeart -= 50;  //zorgt er voor dat een hartje bij komt //!!!!!!!!!!!!! Aangezien het niet mag om je score onscreen bijtehouden staat deze lijn uit.
    //heartList.add(new Heart(moveHeart));  //!!!!!!!!!!!!! Aangezien het niet mag om je score onscreen bijtehouden staat deze lijn uit.
  }
  else {
    RaakMis.add("mis"); // Als een nio niet word aangeraakt door de io dan word een fail sound afgespeeld
    FailSound.trigger();
    println("MIS!!!");
  }

  println(RaakMis);
  Nios_in_beeld.remove(HoeveelsteInDeLijst);  // verwijdert Nio die geraakt/gemist is
}
void ExplosieKlaar() { // Als explosie klaar is moet hij het gaan verwijderen
  explosies_in_beeld.remove(WelkeInDeLijst);
  if (RaakMis != null) {
  }

}

public void stop() { // `Zorgt er voor dat muziek stopt
  bgLoop.close(); 
  ExplosieSound.close();
  ApplauseSound.close();
  super.stop();
}
class GameEnd{
  
  GameEnd(){ // Eidn scherm haalt de raakmis uit de variabel RaakMis en zit dit vervolgens onder elkaar in tekst wat je op de display kan zien
            // Ook is een er een klap geluid die waarbij de volume gekoppeld is aan met hoeveel je hebt gewonne.
    if (ShowEnd==false) {
      //
      ShowEnd=true;
      for (int i=0;i<RaakMis.size();i++) {
        String woord = (String)RaakMis.get(i);
        // Spelverloop += RaakMis.get(i)+"\n";
        if (woord=="mis") {
          spelVerloop += "mis\n";
        }
        else if (woord == "raak") {
          spelVerloop += "raak\n";
          volume++;
        }
      }
      volume = (volume*2)-10; 
      ApplauseSound.play();
    }

   


    //volume
  }
    void display(){
          background(bgEndImg); // stelt achtergrondkleur in
           text(spelVerloop, width/2+100, 150);
           ApplauseSound.setGain(volume);
           
        if (mousePressed && (mouseButton == LEFT)) {
        showStart = true;
         ApplauseSound.close();
          bgLoop.close(); 
        println("");
        setup();
        
      }
  }
     boolean test_r(boolean startGame){
     return startGame;
  }
      
}


class GameHome{ //titel menu met klik functie voor volgend scherm
    void gamePlayButton(){  
      if (mousePressed && (mouseButton == LEFT)) {
        showStart = true;
        println("");
      }
    background(bgStartImg);
  }
     boolean test_r(boolean startGame){
     return startGame;
  }
}

class GameSetup{ // laad data zoals font en afbeeldingen in het spel. Behalve muziek. 

  GameSetup(){
  size(500, 500); // hoe groot wordt het venster van mijn programma
  font = loadFont("data/font/Chalkduster-18.vlw");
  textFont(font, 12);
  Nios_in_beeld = new ArrayList();
  RaakMis = new ArrayList();


  bgLoop.loop(); // achtergrond muziek starten
                  // Variabel vullen
  teller = 0; 
  moveHeart = 0;
  explosies_in_beeld = new ArrayList();
  heartList = new ArrayList();

  RaakMis = new ArrayList();
  nieuwe_Nio_timer = int(random(200,500 ));
  nioImg = loadImage("data/img/nioImg.png");
  limbImg = loadImage("data/img/ioLimbImg.png");
  bgImg = loadImage("data/img/bgImg.jpg");
  bgStartImg = loadImage("data/img/bgStartImg.jpg");
  ioImg = loadImage("data/img/ioImg.png");
  bgEndImg = loadImage("data/img/bgEndImg.jpg");
  heartImg = loadImage("data/img/heartImg.png");
  moveHeart = width-50;

  for (int i=0;i<2;i++) {
    Nios_in_beeld.add(new Nio(i*25)); // voegt afbeeldingen voor animatie toe
    hoeveelPlaatjes= 13;
    ExplosiePlaatjes_main = new PImage[hoeveelPlaatjes];
  }
  for (int i=0;i<hoeveelPlaatjes;i++) { // afbeeldingen voor de animatie laden
    String filenaam = "data/img/suck/suck" + nf(i+1, 4) + ".png";
    ExplosiePlaatjes_main[i] = loadImage(filenaam);
    println(filenaam);
  }
  }
}
public class GameStart{ // hier worden alle mechanismes van de game samengevoegd
  
 void display(){
    
    
background(bgImg); 
  textSize(10);
  text("Note: catch the hearts!",15,15) ; // Links boven tip
  
  if (RaakMis.size() < 10) { // RaakSize houd bij 
      teller++;

    //    knal.display();
    if (teller == nieuwe_Nio_timer) { // Geeft aan wanneer er een nio moet aangemaakt worden( in de setup staat tussen wanneer en wanneer 
      teller=0;
      
      Nios_in_beeld.add(new Nio(1));  
      println("nieuwe nio!");
    }
    for (int i=0;i<Nios_in_beeld.size();i++) { // temp maken voor de Nios zodat ze in een array kunnen
      Nio MoronBird_temp = (Nio) Nios_in_beeld.get(i);
      MoronBird_temp.beweeg(i);
      MoronBird_temp.display();
    }

    for (int i = 0; i<explosies_in_beeld.size(); i++) { // temp maken voor de Nios zodat ze in een array kunnen
      explosie explosie_temp= (explosie) explosies_in_beeld.get(i);
      explosie_temp.display();
    }
    for (int i = 0; i<heartList.size(); i++) { //temp voor de scor hartjes
      Heart heart_temp= (Heart) heartList.get(i);
      heart_temp.display();
    }
    Nest.display(); // Nio laten leven
    Nest.beweeg();
  } 
  
  
  
 else {
   
   if(spelEinde == null){    // zorgt er voor dat je naar scorelijst gaat
   spelEinde = new GameEnd();
   }
   spelEinde.display();
 }
}

    
    
    
    
 }



class Heart{ // hartjes voor je score tijdens de game NOTE: ziet niet in die van ton
  int x_loc;
  Heart(int x_pos){
    x_loc = x_pos;
  }
 void display(){
   image(heartImg,x_loc,100);
  }
}
class Io {
int x_loc;
int y_loc;
int x_speed;
int c;
Io_limb Vleugel;
Io_limb Vleugel2;

Io_body Lichaam;

Io(float c_parameter){
  x_loc  = width/2;
  y_loc = 340;
  x_speed = 0;
   Lichaam = new Io_body();  
    Vleugel = new Io_limb();
    Vleugel2 = new Io_limb();

}

void beweeg(){ // berekent de snelheid. Hoe verder het object staat van de cursor hoe sneller hij beweegt en traagt langzaam af.
  int afstand = mouseX - x_loc;
  x_speed = afstand/50;

  if (abs(afstand) > 1){
  x_loc = x_loc + x_speed;
  }
}

  int WaarBenIk(){  //brengt de x_loc terug zodat de collision io van nio kan aftrekken
    return x_loc;
  
}

 void display(){  // Alle Io delen in 1 display functie zetten 
   
  
       
       Vleugel.draai();
       Vleugel.display(x_loc,y_loc);

     Vleugel2.draai2();
       Vleugel2.display(x_loc,y_loc);
        Lichaam.display(x_loc,y_loc);

    }

}

class Io_body {
 

  Io_body() {

  }

  void display(int x_loc_param,int y_loc_param) { // afbeelding voor het poppetje
    imageMode(CENTER);
  image(ioImg,x_loc_param,y_loc_param,43,92);
   
  }
}

class Io_limb {
  color c;
  float x_loc;
  float y_loc;
  float hoek;
  float rotatie;
    float hoek2;
  float rotatie2;
  float sizeX;
  float sizeY;
  Boolean Versie2 = false;

  

  Io_limb () {
    hoek = 20;
     hoek = 20;
    rotatie = 0.1;
    rotatie2 = 0.1;

 } 
 
 
  


  void display(float x_loc_param, float y_loc_param) { // doet het fladderen voor beide vleugels
   pushMatrix();
   translate(x_loc_param+5, y_loc_param); // positie aanpassen
   rotate(hoek);
   imageMode(CORNER);
   if(Versie2 == true){ // zorgt er voor dat de draai2 gespiegeld is
     scale(-1, 1); 
     x_loc = +10;
     y_loc = +3;

   }
   image(limbImg,x_loc,y_loc);
   popMatrix();
  }
  
 
 void draai() {
    rotatie += 0.04;
    hoek = sin(rotatie)/3;
  }
  
   
 void draai2() {
    rotatie2 -= 0.04;
    hoek = sin(rotatie2)/3;
    Versie2 = true; // zegt versie2 moet gespiegeld worden

  }
}
class Nio{
 // variabelen
  int x_loc; // geheugenruimte inruimen voor float-vorm (getal met cijfers achter de komma)
  int y_loc;
  int x_speed;
  int y_speed;
  int grote;
  float c; // variabele voor kleur
  Nio_body Lichaam; // geheugenruimte inruimen voor Nio_body-vorm 
 
  //
  //
  
  Nio(float c_parameter) {    
    c = color(c_parameter); // ingeruimde geheugenruimte vullen met waarde in parameter

    Lichaam = new Nio_body(c);  // ingeruimde geheugenruimte vullen met Nio_body vorm
//    Vleugel = new Nio_limb(c); 

     
     x_loc = int (random(50,350));
     x_speed= int (random(0.5,1));
     y_loc = -10;
     y_speed= int(random(2,4));
     grote= int (random(10,20));


  }
   void beweeg(int HoeveelsteInDeLijst) { // Het eerste teken om te kijken of de collision wel toepasbaar is
    
    
    if(x_loc<25 || x_loc>width-25)
    x_speed = x_speed * -1;
   
    if(y_loc>height+25)
    y_loc = y_loc - 625;
    

    y_loc = y_loc + y_speed;
    

    y_loc = y_loc + y_speed;
    if(y_loc > height-180 ){
      RaakOfMis(x_loc,y_loc,HoeveelsteInDeLijst);
    
  }
}
    void display(){

    Lichaam.display(x_loc,y_loc,grote);

    }
}
  

  
 

class Nio_body {
  color c;

  Nio_body(float c_param) {
    c = color(c_param);
  }

  void display(int x_loc_param,int y_loc_param,int grote_param) { // Hier worden de Nios tot leven gewekt
    

 
   image(nioImg, x_loc_param, y_loc_param, grote_param,grote_param );
  }
}

class explosie {
 int welkplaatjeIsZichtBaar;
  int x_loc;
  explosie(int x_locNio){  // verzorgt de nie x_pos zodat het bij de display functie komt
   x_loc = x_locNio;
  

    
  }
 
  


  void display() { // speelte de geladen "gif" af op de x_loc en vaste height Het gaat in 
  welkplaatjeIsZichtBaar++;
    imageMode(CORNER);

 image(ExplosiePlaatjes_main[round(welkplaatjeIsZichtBaar)], x_loc, height-200);
 if(welkplaatjeIsZichtBaar<hoeveelPlaatjes-1){// zorgt er voor  dat de loop neit eindeloos doorgaat
   welkplaatjeIsZichtBaar+= 0.01;
 }else{
   welkplaatjeIsZichtBaar = 0;
  ExplosieKlaar();
 }
  }
  }


