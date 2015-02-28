
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;

/* COSTANTI */
int SENSITIVITY_BEAT_DETECT = 1000; // millisecondi di attesa tra un beat ed un altro
int FREQUENCY_RANGE = 32;
int UP_SQUARE_WIDTH = width;
int UP_SQUARE_HEIGHT = 700;
float SAMPLE_RATE = 2048;
float SAMPLE_RATE_FILTER = SAMPLE_RATE*10;

/* VARIABILI PER L'AUDIO */
Minim minim;
AudioPlayer song;

FFT fft;

PImage img;

Cerchio[] cerchi = new Cerchio[FREQUENCY_RANGE];
// Servono per gestire l'applicazione di filtri passa basso
CerchioFiltro[] cerchiFiltri = new CerchioFiltro[FREQUENCY_RANGE];

// Filtri passa basso per ogni banda di frequenza
LowPassFS[] filters = new LowPassFS[FREQUENCY_RANGE];

// Gestisce lo slider per variare il pan
CerchioSlider panSlider;

boolean isFilterSet = false;

void setup(){
  size(1000,700,P3D);
  
  colorMode(RGB);
  background(0,0,0);
  
  setAudio();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  setupCerchi();
  
  setupCerchiFiltri();
  setupPanSlider();
} // end setup

void draw(){
  colorMode(RGB);
  background(0,0,0);
  
  doFFT();
  
  if(!isFilterSet){
    setFilters();
    isFilterSet = true;  
  }
  
  drawControls();
  
  drawLineSlider();
  panSlider.display();
} // end draw


/*
* Setting dell'audio
*/
void setAudio(){
  minim = new Minim(this);
  song = minim.loadFile("01-Fuel.mp3", (int) SAMPLE_RATE);
  song.play();  
} // end setAudio


void setupCerchi(){
  colorMode(HSB, FREQUENCY_RANGE, 100, 100);
  color c;
  for(int i = 0; i < FREQUENCY_RANGE; i++){
     c = color(i, 100, 100);
     cerchi[i] = new Cerchio(c,i*30+30,15);
     cerchi[i].setRadius(FREQUENCY_RANGE);
     cerchi[i].display();
  }
} // end setupCerchi


/* Settaggio dei cerchi da usare come filtri passa basso*/
void setupCerchiFiltri(){
  colorMode(HSB, FREQUENCY_RANGE, 100, 100);
  color c;
  for(int i = 0; i < FREQUENCY_RANGE; i++){
     c = color(i, 100, 100);
     cerchiFiltri[i] = new CerchioFiltro(c,i*30+30,625);
     cerchiFiltri[i].setRadius(FREQUENCY_RANGE);
     cerchiFiltri[i].display();
  }
} // end setupCerchiFiltri


/* Settaggio del pan slider */
void setupPanSlider(){
  drawLineSlider();
  colorMode(HSB);
  color c = color(0,0,100);
  panSlider = new CerchioSlider(c, width/2, 660, width-30*2, 30, 30);
  panSlider.display();
}

/* Disegna la linea dello slider per il pan */
void drawLineSlider(){
  colorMode(HSB);
  color c = color(0,0,100);
  stroke(c);
  fill(c);
  line(30,675,width-30,677);
  textSize(20);
  text("Sx", 5,675);
  text("Dx", width-25,677);
}

/** Setta i filtri in base alle bande di frequenza */
void setFilters(){
  float bandWidth = fft.getBandWidth();
  println("BandWidth" + bandWidth);
  println("Larghezza calcolata " + fft.specSize()/FREQUENCY_RANGE);
  float freq;
  for(int i=0; i< filters.length; i++){
    //freq = ((i*bandWidth) + (bandWidth/2));
    freq = fft.getAverageCenterFrequency(i)/10;
    if(freq<60){
      freq = 60; 
    }
    if(i==0 || i==(filters.length-1)){
      println("Freq posizione "+ i + ": " + fft.indexToFreq(i));
      filters[i] = new LowPassFS(freq,SAMPLE_RATE_FILTER);
    } else {
      println("Freq posizione "+ i + ": " + fft.indexToFreq(i));
      filters[i] = new LowPassFS(freq, SAMPLE_RATE_FILTER);
    }
  } 
} // end setFilters


/**
* Effettua l'analisi di Fourier e con i valori visualizza i cerchi
*/
void doFFT(){
  fft.linAverages(FREQUENCY_RANGE);
  fft.forward(song.mix);
  println(fft.specSize());
  float vel;
  colorMode(HSB, FREQUENCY_RANGE, 100, 100);
  float minAmp = fft.getAvg(0);
  float maxAmp = fft.getAvg(0);
  for (int i = 0; i < FREQUENCY_RANGE; i++){
    vel = constrain(fft.getAvg(i),0,5);
    
    cerchi[i].setVelocita(int(vel), int(vel));
    
    if(fft.getAvg(i)<minAmp)
      minAmp = fft.getAvg(i);
    if(fft.getAvg(i)>maxAmp)
      maxAmp = fft.getAvg(i);
  }
  for (int i = 0; i < FREQUENCY_RANGE; i++){
    cerchi[i].c = color(i, 100, map(fft.getAvg(i), minAmp, maxAmp, 10, 100));
    cerchi[i].update();
    cerchi[i].display();
  }
} // end doFFT


/** Disegna i controlli per applicare i filtri */
void drawControls(){
  colorMode(HSB, FREQUENCY_RANGE, 100, 100);
  color c;
  for(int i = 0; i < FREQUENCY_RANGE; i++){
     cerchiFiltri[i].display();
  }
}


/** Aggiunge il filtro i-esimo alla canzone */
void addFilter(int i){
  println("Applicato filtro con frequenza " + filters[i].frequency());
  song.clearEffects();
  song.addEffect(filters[i]);
  
  //song.addEffect(b);
}

/** Rimuove i filtri attivi sulla canzone */
void removeFilter(){
  println("Rimosso filtro");
  song.clearEffects();
}


void mouseClicked(){
  // Controllo se qualche cerchioFiltro è stato cliccato
  for(int i=0; i< cerchiFiltri.length; i++){
     if (cerchiFiltri[i].isPressed()){
       if(cerchiFiltri[i].isDisable() || !cerchiFiltri[i].isClicked()){
         removeFilter();
         for(int j = 0; j<cerchiFiltri.length; j++){
           cerchiFiltri[j].isClicked = false;
           cerchiFiltri[j].enable(); 
         }
       } else {
         addFilter(i);
         for(int j = i+1; j<cerchiFiltri.length; j++){
           cerchiFiltri[j].disable(); 
         } // end for
       } // end if
     }
  } // end for
}


void mousePressed(){
 if(panSlider.isPressed()){
   panSlider.update();
   panSlider.display();
   song.setPan(panSlider.getPanValue());
 } 
}


void mouseReleased(){
  if(panSlider.isClicked()){
   panSlider.isClicked = false; 
   panSlider.update();
   panSlider.display();
   song.setPan(panSlider.getPanValue());
  }
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
} // end stop

