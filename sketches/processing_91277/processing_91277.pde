
/*
Mit dieser Programm kan man in kleine Fenstern zeichnen
mit Linkermaustaste - zeichnent man
mit Rechtermaustaste - wegradieren

mit Tasten:
E - macht man dicker den stift
W - macht man kleiner


A - rote Farbe funktioniert nur wen man drückt
S - blau Farbe funktioniert nur wen man drückt
D - schwarz Farbe funktioniert nur wen man drückt

Q - wegradieren und Maske weckseln
*/

/*MEINE VARIABLE*/
// variable die für speichern von meinen Bildern dient
int saveCounter = 0;
//für Linien Dicke
int linienDicke = 1;
//für farbe
int R=0;
int G=0;
int B=0;

/*HAUPTFUNKTION*/
void setup(){
  //meine animation geschwiendigkeit
  frameRate(60);
  //die grösse
  size(400,400);
  //background farbe
  background(255);
  //blau farbe (0,51,195,80);
//farbe vom strich standart ist schwarz
  stroke(R,G,B);
  //die dicke von meinem strich;
}

/*MALEN*/

void draw(){
/*TASTEN_BEFEHLE*/
 if (keyPressed) {
    //Background weckseln und Bild
    if (key == 'Q' || key == 'q') {// mit TAB
    //hintergrund weiss
       background(255);
       //variable erhöhen auf eins
       }
    }
    
  /*DICKE VOM STIFT*/
  if (key == 'E' || key == 'e') {
 //erhöhen von variable dicke für stift 
    linienDicke ++;
    if (linienDicke > 50){
       linienDicke =50;
       }
      strokeWeight(linienDicke);
      } 
   
   if (key == 'W' || key == 'w') {
 //kleiner machen von variable dicke für stift 
    linienDicke --;
    if (linienDicke < 1){
       linienDicke =1;
       }
      strokeWeight(linienDicke);
     } 
 
 /*FARBEN*/
   //für ROT
    if (key == 'A' || key == 'a') {
//werte von verändern
    int R=188;
    int G=1;
    int B=10;
          stroke(R,G,B);
   }  
    //für blau
    if (key == 'S' || key == 's') {
 //werte von verändern 
    int R=0;
    int G=5;
    int B=190;
          stroke(R,G,B);
   }
    //für schwarz
    if (key == 'D' || key == 'd') {
 //werte von verändern 
    int R=0;
    int G=0;
    int B=0;
          stroke(R,G,B);
   }
   
  
 
 }
void mousePressed() {
  if(mouseButton == RIGHT) {
    stroke(255);
  } 
  if(mouseButton == LEFT) {
  stroke(R,G,B,lOpasity);
  }
}

//so wird es flüsig mit linien führung gemalt
void mouseDragged() {
     /*
     mit pmouseX und pmouseY kann man werte von den punkten
     des Obyekts vermieteln
     */
     line(pmouseX, pmouseY, mouseX, mouseY);

}
