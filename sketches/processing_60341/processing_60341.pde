
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;
PFont f;


int k;
int zeilen = 60; // Anzahl Zeilen
int intervall = 60; // Abnahmeintervall
int lastTime = 0;
int counter = 360;  // <--- VARIABEL
int abstand = counter;
int grenze = 53;  // <--- VARIABEL

int time = 1000; //Zeitintervall in Millisekunden

float highLevel = 0.6; //Schwellenwert für Uhrzeitanzeige
float amplitude = 0.2; //Level für maximale Sättigung

float[] levelColl;
float levelGesamt;
float levelAvg;

float[] dampedAvg;
float dampVal = 0.90;
float val = 0;

//-SETUP----------------------------------------------------//////////////// 

void setup () {

  size (1024, 768);
  colorMode(HSB,360,100,100,100);
  textMode(SCREEN);
  frameRate(60);
//  f = loadFont("AkzidenzGroteskBQ-Reg-12.vlw");  
  f = loadFont("AkzidenzGroteskBQ-Med-17.vlw"); //counter= 360, grenze = 53
//  f = loadFont("AkzidenzGroteskBQ-Med-20.vlw"); //counter= 360, grenze = 53
//  f = loadFont("AkzidenzGroteskBQ-Med-24.vlw"); //counter= 360, grenze = 53



  // Audiotoolkit anlegen
  minim = new Minim (this);
  minim.debugOn();
  in = minim.getLineIn (Minim.STEREO, 512);

  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(20, 3);
  dampedAvg = new float[fft.avgSize()];

  levelColl = new float[60];
  levelGesamt = 0;
  levelAvg = 0;

  smooth();
  noStroke ();
  fill (255,25);
  background (360);
}

//-DRAW----------------------------------------------------//////////////// 

void draw () {

   //Uhr
  String sr = nf(second(), 2);  // Values from 0 - 59
  String mr = nf(minute(), 2);  // Values from 0 - 59
  String hr = nf(hour(), 2);    // Values from 0 - 23
   
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  int now = millis();
  int nowUhr = millis();

  counter++;

  fft.forward(in.mix);

   //finde die stärkste Frequenz
  float maxFreq = 0.1;
  int maxIndex = 0;



  for(int i = 0; i < fft.avgSize(); i++)
  { 
    if(dampedAvg[i] < fft.getAvg(i)) {
      dampedAvg[i] = fft.getAvg(i);
    }
    if(dampedAvg[i] > maxFreq) {
      maxFreq =  dampedAvg[i];
      maxIndex = i;
    }
    dampedAvg[i] *= dampVal;
  }


  float breite = width/intervall;

  float xpos = map(s, 0, 60, 0, width);   //Position nach Uhrzeit (sekunden / x-weite)
  float ypos = map(m, 0, 60, 0, height);  //Position nach Uhrzeit (minuten / y-höhe)
  float khour = map(h, 0, 23, 0, 720);    //Farbwert nach Stunde

    //Durchschnitt ermitteln
 levelGesamt = 0;

 for(int j=59; j > 0; j--) 
   {
     levelColl[j] = levelColl[j-1];
     levelGesamt += levelColl[j];
   }

   levelColl[0] = in.mix.level();
   levelGesamt += levelColl[0];

   levelAvg = levelGesamt/intervall; 
 
   if(h >= 12) {
     khour = khour - 360;
   }
   
    //Kasten malen
  if(now - lastTime > time) {
    fill(map(maxIndex, 6, 22, khour, khour+15),map(levelAvg, 0, amplitude, 3, 100),100,80);
    rect (xpos, ypos, breite, height/zeilen);
    if(s == 0) {
      counter = abstand;
    }   

    //Bild speichern  
    if (m == 59 && s == 59 ) {
    saveFrame("bild-####.tiff");
  }
  
    lastTime = now;
  }
  
     //Uhrzeit anzeigen
 if(counter >= abstand) {
    if(in.mix.level() > highLevel) {
    textFont(f);     
    fill(0);      
    if(s <= grenze) {
      textAlign(LEFT);
      text(hr+ ":" +mr+ ":" +sr, xpos+breite, ypos+height/zeilen);
    } else {
      textAlign(RIGHT);
      text(hr+ ":" +mr+ ":" +sr, width, ypos+height/zeilen);
    }
    noStroke();
    rect (xpos, ypos+height/zeilen, breite, (height/zeilen)/5);
      counter = 0;  
    }
 
 }
  
  //PRINTLN///////   
  println(in.mix.level());
  println(counter);
  //////////////// 



}


