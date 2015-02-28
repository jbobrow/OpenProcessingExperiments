
//Everything is temporary and will be translated to english
//sooner or later. If you want to help just take a look after
//the smooth() line.

import arb.soundcipher.*;
import arb.soundcipher.constants.*;

//creazione 3 oggetti SoundCipher per le voci degli accordi.

SoundCipher voce1 = new SoundCipher(this);
SoundCipher voce2 = new SoundCipher(this);
SoundCipher voce3 = new SoundCipher(this);

//array di costanti double dove copio le 7 note di una scala (dalla libreria). 
double[] NOTES = new double [7];    

//array dove piazzero' 7 note random (prese dall'array NOTES creato).
double[] notes = new double [7]; 

//array dove piazzo 7 durate random, una per ogni nota (in battute).
double[] durations = new double[7];

//array dove metto 7 dinamiche random (piano, forte, per ognuna delle 7 note).
double[] dynamics = new double[7];

//array di note corrispondendi all'inizio di un ottava.
int[] ottave = { 20, 32, 44, 56, 68, 80, 92 };


void setup() {

  size(800,600);
 
  //purtroppo tutto avviene solo grazie ad una questione di timing... per adesso.
  frameRate(0.237);
 
  smooth();
  
  // Getting midi devices info. How to fix the problem 
  // that a different midi synth (lower quality) is used when 
  // executed in browser rather than locally ? I tried with
  // setMidiDeviceOutput=x (x = i tried them all) but still no
  // luck. When in browser it uses the lower quality one anyway...
  // Tnx

  
  voce1.getMidiDeviceInfo();   
  
//  voce1.setMidiDeviceOutput=2;
//  voce2.setMidiDeviceOutput=2;
//  voce3.setMidiDeviceOutput=2;
  
  voce1.tempo(100); 
  voce2.tempo(100);
  voce3.tempo(100);
  
  voce1.instrument=40;//40-4-4-47
  voce2.instrument=98;//98-24-73-98
  voce3.instrument=73;//73-69-69-98
  
  // Take the time.
  
  //Creo una copia della scala sulla quale "costruire musica" sul mio array di costanti double 
  //E' necessario per SC playPhrase() che vuole array di double e non float.
  
  //Provare ad usare i seguenti array! :
 
  //AEOLIAN, AUGMENTED, BLUES, CHROMATIC, DIATONIC_MINOR, DORIAN, HARMONIC_MINOR,
  //INDIAN, IONIAN, LOCRIAN, LYDIAN, MAJOR, MAJOR_PENTATONIC, MAJOR_TRIAD, MELODIC_MINOR, 
  //MINOR, MINOR_PENTATONIC, MINOR_TRIAD, MIXOLYDIAN, NATURAL_MINOR, PENTATONIC, PHRYGIAN
  //ROOT, ROOT_FIFTH, TURKISH, WHOLETONE 
  
  for (int i = 0; i < voce1.PENTATONIC.length; i++) { 
    NOTES[i]=voce1.PENTATONIC[i];
    //println(NOTES[i]);
  }
}


void draw() {

  background(#285B64);
  
  fill(255);
  textSize(11.5);
    
  playChrd();
  
  fill(#EDE732);
  textSize(14);
  text("Procedural music...", 400, height-80);
  text("p - pause | r - restart | 1, 2, 3 - change instruments", 400, height-60);
  text("please allow some time for changes to take effect!", 400, height-40);
  
}  


void playChrd() { 

  //double[] pitches =       { 70, 75, 72, 63, 65, 67, 68, 70  };
  double[] articulations = { 1, 1, 1, 1, 1, 1, 1 };
  double[] pans =          { 64,64,64,64,64,64,64 };
  
  text("Strumento voce 1: " + (int)voce1.instrument, 10,20);
  text("Strumento voce 2: " + (int)voce2.instrument, 10,40);
  text("Strumento voce 3: " + (int)voce3.instrument, 10,60);
  
  voce1.playPhrase (0, 0, voce1.instrument, calcola_scala(1,round(random(0,2))), calcolaDinamiche(1), durataBattute(1), articulations, pans);
  voce2.playPhrase (0, 1, voce2.instrument, calcola_scala(2,round(random(2,3))), calcolaDinamiche(2), durataBattute(2), articulations, pans);
  voce3.playPhrase (0, 2, voce3.instrument, calcola_scala(3,round(random(3,5))), calcolaDinamiche(3), durataBattute(3), articulations, pans);

}


double[] calcola_scala (int idVoce, int ottava) {
  
  //itera nell'array notes
  for (int i = 0; i < notes.length; i++) {
    
    //assegna a ogni elemento dell'array notes un valore random dall'array NOTES
    notes[i] = NOTES[int(random(NOTES.length))]+ottave[ottava];
     
    text (notes[i] + ": valore array 'notes' in pos. num. "+i +" per la voce " +idVoce, 10, (15*i)+idVoce*120);
  }
  return notes;
}



double[] durataBattute(int idVoce) {
  
  double sum=0;
  for (int i = 0; i < durations.length; i++) {
    
    
    int chance = round(random(1,7));   
    
    if (chance == 1) durations[i] = 1; 
    if (chance == 2) durations[i] = 2; 
    if (chance == 3) durations[i] = 0.5; //.25 
    if (chance == 4) durations[i] = 0.5; //.25
    if (chance == 5) durations[i] = 1.5; //0.5 this also.
    if (chance == 6) durations[i] = 1.5;
    if (chance == 7) durations[i] = 2;   //0.5 this 1 for a nice change.
    
    sum=sum+durations[i];
    
  text (durations[i] + ": valore array 'durations' in pos. num. "+i +" per la voce " +idVoce, 400, (15*i)+idVoce*120);
  
}   
  text ("Somme totali durata battute complessive per ogni voce "+sum,  200, idVoce*20);
  return durations;
}


double[] calcolaDinamiche(int idVoce) {
  
  if (0.02 < random (1) ) {
    for (int i = 0; i < notes.length; i++) {
      dynamics[i]=random(80,100);
    }
    } else { //una volta ogni tanto dinamiche zero (voce muta).
      for (int i = 0; i < notes.length; i++) {
        dynamics[i]=0;
      }
      text ("Voce "+idVoce + " silenziosa..", 10, height-100+idVoce*20);
    }
    return dynamics;
}

void keyPressed() {
  switch(key) { 
    
    case 'p':
    case 'P': noLoop(); break;
    
    case 'r': 
    case 'R': loop(); break;
    
    case '1': voce1.instrument=random(127); break; 
    case '2': voce2.instrument=random(127); break; 
    case '3': voce3.instrument=random(127); break; 
    
  }
}








//   ------------------------ old code ---------------------------

//while (majNotes[i] == majNotes[i+1])  {                 //confronta ogni elemento randomizzato per vedere se è uguale al successivo
//majNotes[i]=MAJNOTES[int(random(MAJNOTES.length))];     //nel caso, randomizza di nuovo il valore dell'elemento a questo indice
//}


//voce1.playNote (0,0, 65, voce1.MAJOR[round(random(-.5, 6.5))]+ottave[round(random(3,4))], random (50,100), 10, 0.8, random(0, 127) ;





//  int a = round(random(0.6, 7.5));                        crea un ritardo anke nel disegno su skermo (draw non finisce)
//  text(a +" = lunghezza pausa.", 200,320);
//  if (a == 1) delay(int(2000+random(-10, 10)));
//  if (a == 2) delay(int(2000+random(-10, 10)));
//  if (a == 3) delay(int(2000+random(-10, 10)));
//  if (a == 4) delay(int(2000+random(-10, 10)));
//  if (a == 5) delay(int(2000+random(-10, 10)));
//  if (a == 6) delay(int(2000+random(-10, 10)));
//  if (a == 7) delay(int(1000+random(-10, 10)));

//float durata() {
//  float d=random(0.1, 1);
//  d=d*10;
//  d=round(d);
//  d=d/10;
//  
//  return d;
//  
//}  


//  //assegna durata (in battute) ad ognuna 3 note 
//
//  float durataNota1=durata(); 
//  float durataNota2=durata();
//  float durataNota3=durata();
//
//  //determina quale dura di piu' e memorizzane la durata (in battute) in notaPiuLunga
//
//    float notaPiuLunga=0;
//
//  if (durataNota1 > durataNota2 && durataNota1 > durataNota3) notaPiuLunga = durataNota1;
//  if (durataNota2 > durataNota3 && durataNota2 > durataNota1) notaPiuLunga = durataNota2;
//  if (durataNota3 > durataNota1 && durataNota3 > durataNota2) notaPiuLunga = durataNota3;


//double instrument = constrain(mouseX, 0, 127);




//some random code.

//float m = millis();
//text(m % 255 + " millisecondi passati modulo 255", 20, 100);
//fill(m % 255);
//rect(100, 100, 200, 200);




