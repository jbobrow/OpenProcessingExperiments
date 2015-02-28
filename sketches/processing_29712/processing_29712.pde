

////////// Einstellungen //////////////////////////////////////////////// 

//------ Schrift groesse
int SG = 12;

//------ Zeichen muss mindestens so oft vorkommen das es angezeigt wird
int zVorkommen=1;

//------ stellt ein wie stark der unterschied der anzahl des zeichen zu sehen ist
float US=1.2;

////////// Einstellungen - ENDE /////////////////////////////////////////

int[] anzahl = new int[255];

float oldzSG =0;

PFont schrift; 
PFont schriftFR; 

/////////////////////// void setup

void setup() {
  
  size(620, 877);
  
  

  
  
  schrift = createFont("Verdana", 18); 
  textFont(schrift);
  
  
  schriftFR = createFont("Georgia", 18); 
  
  
  for(int i=0;i<anzahl.length;i=i+1){
    anzahl[i] = 0;
  }
}

void draw() {
  background(251, 152, 111);  
  
  ////////// Zeichenabstand
  float zAbstand = 30;
  
  // zHoehe - Zeichenhöhe
 // int zHoehe= SG + SG/2; 
    float zHoehe= height/2+height/5; 
  
  ////////// Text laden  
  String ENText = "";
  String lines[] = loadStrings("Text.txt");
  for (int i=0; i < lines.length; i++) {    
    ENText = ENText + lines[i];    
  }
  
  
  

  

    
  
  // 33 - 253 sind die Zahlenwerte der Zeichen, bedeutet nemme Zeichen 33 und überprüffe die häufigkeit
  for(int i=33; i<253; i=i+1) {
    
    ////////// ein Zeichen zaehlen ////////////////////////////////////////////////    
    int gesuchtesZeichen = i;
    // indexOf, gibt die Position zuruck an der das gesuchte Zeichen steht
    // wenn keines vorhandes ist, wird eine -1 zurueck gegeben
    int wordIndex = ENText.indexOf(gesuchtesZeichen);
    int wordCount = 0;
    // solange weitersuchen, bis indexOf -1 zurÃ¼ck gibt, also kein Zeichen mehr gefunden wird
    while(wordIndex > -1) {
      wordCount = wordCount + 1;
      // ab der gefundenen Position bis zum naechsten Zeichen weiter suchen
      wordIndex = ENText.indexOf(i, wordIndex+1);
    }
   // anzahl des buchstwben in ein array abspeichern
    anzahl[i] = wordCount; 
    
    ////////// Zeichenwert wieder in Zeichen umwandeln //////////////////////////////////////////////// 
    char letter;
    letter = char(gesuchtesZeichen);
    //Zeichen     Anzahl +  Zeichen  
    //println(wordCount + " " + letter);
    
    ////////// Ausgabe ////////////////////////////////////////////////
    
    float zSG = SG + wordCount * US;
    //textSize(SG + wordCount * US);
    textSize(zSG);
    
    if (zSG > oldzSG){
        oldzSG=zSG;              
      } 
      println(oldzSG);
    
    
    if (wordCount >= zVorkommen) {
       //println(char(gesuchtesZeichen) + " " + textWidth(char(gesuchtesZeichen)));   
      
      //println(zHoehe + " " + letter);
      
      
       // gehe in die nächste Zeile wenn sie über den Bildschirmrand läuft
      if (zAbstand+zSG-zSG/3 > width-30){
        zAbstand = 30;
        zHoehe =  zHoehe - zSG;              
      } 
      if (zHoehe-zSG < 30){
        zHoehe =  zHoehe + height/2 ;              
      } 
      
      fill(1,0,44,180);
      
      text(letter, zAbstand, zHoehe);
      fill(0,0);
       stroke(255,0,0);   
        
      zAbstand = zAbstand + zSG;
         
    }
    
  }
  
    String FRText = "";
  String linesFR[] = loadStrings("FRText.txt");
  for (int i=0; i < linesFR.length; i++) {    
    FRText = FRText + linesFR[i];    
  }
  
  
  
  
  textFont(schriftFR);
  ////////// FRText //////////////////////////////////////////////// 
    for(int i=33; i<253; i=i+1) {
    
    ////////// ein Zeichen zaehlen ////////////////////////////////////////////////    
    int gesuchtesZeichen = i;
    // indexOf, gibt die Position zuruck an der das gesuchte Zeichen steht
    // wenn keines vorhandes ist, wird eine -1 zurueck gegeben
    int wordIndex = FRText.indexOf(gesuchtesZeichen);
    int wordCount = 0;
    // solange weitersuchen, bis indexOf -1 zurÃ¼ck gibt, also kein Zeichen mehr gefunden wird
    while(wordIndex > -1) {
      wordCount = wordCount + 1;
      // ab der gefundenen Position bis zum naechsten Zeichen weiter suchen
      wordIndex = FRText.indexOf(i, wordIndex+1);
    }
   // anzahl des buchstwben in ein array abspeichern
    anzahl[i] = wordCount; 
    
    ////////// Zeichenwert wieder in Zeichen umwandeln //////////////////////////////////////////////// 
    char letter;
    letter = char(gesuchtesZeichen);
    //Zeichen     Anzahl +  Zeichen  
    //println(wordCount + " " + letter);
    
    ////////// Ausgabe ////////////////////////////////////////////////
    
    float zSG = SG + wordCount * US;
    //textSize(SG + wordCount * US);
    textSize(zSG);
    
    if (zSG > oldzSG){
        oldzSG=zSG;              
      } 
      println(oldzSG);
    
    
    if (wordCount >= zVorkommen) {
       //println(char(gesuchtesZeichen) + " " + textWidth(char(gesuchtesZeichen)));   
      
      //println(zHoehe + " " + letter);
      
      
       // gehe in die nächste Zeile wenn sie über den Bildschirmrand läuft
      if (zAbstand+zSG-zSG/3 > width-30){
        zAbstand = 30;
        zHoehe =  zHoehe - zSG;              
      } 
      if (zHoehe-zSG < 30){
        zHoehe =  zHoehe + height/2 ;              
      } 
      
      fill(255,255,185,180);
      
      text(letter, zAbstand, zHoehe);
      fill(0,0);
       stroke(255,0,0);   
        
      zAbstand = zAbstand + zSG;
         
    }
    
  }
  
  
  noLoop ();
  textSize(18);
  
  textFont(schrift);
  fill(1,0,44,180);
  text ("Deutsch", 40, height-70);
  
  textFont(schriftFR);
  fill(255,255,185,180);
  text ("Français", 40, height-50);
}


