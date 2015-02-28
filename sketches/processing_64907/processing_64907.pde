
/* 
 * Animazione 2
 * Autore: Ivo Mazzieri Sankovic
 * Audio: Eduard Khil - Trololo ("I Am Glad, 'Cause I'm Finally Returning Back Home")
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// oggetti usati
Minim minim;
AudioPlayer player;
FFT fft;
LowPassSP low;
HighPassSP high;
BandPass band;

// variabili
int f1,f2,fc,fb;   // frequenze per passa-basso, passa-alto, frequenza centrale e ampiezza
int fmin = 20;     // frequenza minima selezionabile con i controlli
int fmax = 10000;  // frequenza massima selezionabile con i controlli
int numfreq = 23;    // numero di bande di frequenza considerate

boolean lowPassActive, highPassActive, bandPassActive;

// memorizzo tutte le posizioni nei vettor
Button1 lowButton, highButton, bandButton;
ControlBar bar1, bar2, bar3, bar4;

void setup() {  
  
  size(600,600);
  
  lowButton = new Button1(10, height * 3/4, "LowPass");
  highButton = new Button1(10, lowButton.y + lowButton.buttonHeight, "HighPass");
  bandButton = new Button1(10, highButton.y + highButton.buttonHeight, "BandPass");
  
  bar1 = new ControlBar(150, lowButton.y + 10);
  bar2 = new ControlBar(150, highButton.y + 10);
  bar3 = new ControlBar(150, bandButton.y + 10);
  bar4 = new ControlBar(150, bandButton.y + bandButton.buttonHeight + 10);  
  
  minim = new Minim(this);  
  player = minim.loadFile("Trololo.mp3");
  player.loop();
  player.play();
  
  // crea i filtri
  low = new LowPassSP(1, player.sampleRate());
  high = new HighPassSP(1, player.sampleRate());
  band = new BandPass(1, 1, player.sampleRate());
  
  // aggiunge i filtri al player e li disattiva
  player.addEffect(low);
  player.addEffect(high);
  player.addEffect(band);
  player.disableEffect(low);
  player.disableEffect(high);
  player.disableEffect(band);
    
  fft = new FFT(player.bufferSize(), player.sampleRate());
  fft.linAverages(200);
  
  refreshFilters();
  
}

// disegna i controlli dei filtri
void controls() {   
  
  // disegna i button
  lowButton.draw();
  highButton.draw();
  bandButton.draw();
  
  // disegna barre per modiicare la funzione  
  bar1.draw();
  bar2.draw();
  bar3.draw();
  bar4.draw();
  
  // indica le frequenze e l'ampiezza selezionati
  textSize(12);
  fill(0);
  text("low f: " + f1, width - 120, lowButton.y + lowButton.buttonHeight * 2/3);
  text("high f: " + f2, width - 120, highButton.y + highButton.buttonHeight * 2/3);
  text("band fc: " + fc, width - 120, bandButton.y + bandButton.buttonHeight * 2/3);
  text("ampiezza: " + fb, width - 120, bandButton.y + bandButton.buttonHeight * 2/3 + bandButton.buttonHeight);

}

void draw() {
  
  background(255);
  
  controls();
  
  fft.forward(player.mix);
  
  ventaglio();
  
  // disegna dei semplici indicatori per le frequenze
  fill(0,0,255);
  text("LOW", 200, 300);
  fill(255,0,0);
  text("HIGH",350,300);   
 
}

// mantiene aggiornate le modifiche alle frequenze e applica modifiche ai filtri
void refreshFilters() {
  
  // modifica le frequenze in base allo spostamento dei controlli
  f1 = (int) map (bar1.control1.x, bar1.x, bar1.x + bar1.barWidth, fmin, fmax);
  f2 = (int) map (bar2.control1.x, bar2.x, bar2.x + bar2.barWidth, fmin, fmax);
  fc = (int) map (bar3.control1.x, bar3.x, bar3.x + bar3.barWidth, fmin, fmax);
  fb = (int) map (bar4.control1.x, bar4.x, bar4.x + bar4.barWidth, fmin, fmax);
  
  // gestione dell'attivazione dei filtri
  if (lowPassActive) {    
    low.setFreq(f1);
    player.enableEffect(low);
  } else {
    player.disableEffect(low);  
  }
  if (highPassActive) {    
    high.setFreq(f2);
    player.enableEffect(high);
  } else {
    player.disableEffect(high);  
  }
  if (bandPassActive) {    
    band.setFreq(fc);
    band.setBandWidth(fb);
    player.enableEffect(band);
  } else {
    player.disableEffect(band);  
  }  
}

void mousePressed() {

  if (lowButton.isClicked()) {
    
    if (lowPassActive){      
      lowButton.deselect();
      lowPassActive = false;
      player.removeEffect(low);          
    } else {
      lowButton.select();
      lowPassActive = true;
      player.addEffect(low);
    }
  }
          
  if (highButton.isClicked()) {
    if (highPassActive){
      highButton.deselect();
      highPassActive = false;
      player.removeEffect(high);
    } else {
      highButton.select();
      highPassActive = true;
      player.addEffect(high);
    }
 }
 
 if (bandButton.isClicked()) {
    if (bandPassActive){
      bandButton.deselect();
      bandPassActive = false;
      player.removeEffect(band);
    } else {
      bandButton.select();
      bandPassActive = true;
      player.addEffect(band);
    }    
 }

  // gestione dello spostamento dei controlli cliccando sulla barra
  bar1.onClick();
  bar2.onClick();
  bar3.onClick();
  bar4.onClick();    
  
  refreshFilters();
}

void mouseDragged() {
  
  // gestione dello spostamento dei controlli
  bar1.onDrag();
  bar2.onDrag();
  bar3.onDrag();
  bar4.onDrag();
  
  refreshFilters();
  
}

void ventaglio() {
  
  int size;            // serve per modificare la dimensione dei cerchi
  int precisione = 13;  // numero di cerchi usati per banda
  float rapporto = 1.2;  // rapporto di crescita dei cerchi
  int angle = 270 / numfreq * (-1);    
  
  noStroke();
  
  // associa lo spazio dei colori HSB al numero di frequenze considerate
  colorMode(HSB, numfreq);
  
  pushMatrix();
  
  // sposta il centro del sistema di coordinate nel punto medio del cerchio
  translate(300,200);
  
  // rotazione iniziale per iniziare a disegnare il ventaglio
  rotate(radians(211));
  
  for (int i=0; i<(numfreq - 1); i++){
    
    // assegna un colore alla banda di frequenze
    // usa il fattore 3/4 per evitare i colori violacei
    fill(i * 3/4,numfreq,numfreq);
    
    size = 10;  // ripristina la dimensione al valore più piccolo

    // effettua la conversione per poter rappresentare con i cerchi
    int temp = (int) map (fft.getAvg(numfreq - 1 - i), 0, 50, 1 , precisione);

    for (int j=0; j<temp; j++){
      // disegna il numero di cerchi necessario
      ellipse(j*(-10)-size,0,size,size);
      size = round(size * rapporto);
    }
    rotate(radians(angle));
  }
  popMatrix();
  
  colorMode(RGB, 255); // ripristina il default
  stroke(0);
}

// controllo della riproduzione del file tramite tastiera
void keyPressed() {
  
  if (key == ' ') {  // spazio
    
    if (player.isPlaying())
      player.pause();
    else  
      player.play();
    
  } else if (key == BACKSPACE) {
    player.rewind();
  }
}

void stop() {
  
  player.close();
  minim.stop();
  super.stop();

}

