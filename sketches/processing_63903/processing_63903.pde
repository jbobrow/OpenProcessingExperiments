
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import controlP5.*;

Minim minim;
AudioPlayer song;

FFT fft;
BeatDetect beat; //beatDetect per i Beat Snare, Kick e Hat
BeatDetect beat2; //beatDetect per i Beat OnSet
BeatListener bl;

//filtro passaBasso
LowPassSP lowpass;
//filtro passaAlto
HighPassSP highpass;
//filtro passaBanda
BandPass bandpass;

//pulsanti
PassaBassoButton pBasB;
PassaAltoButton pAltB;
PassaBandaButton pBandB;

//attributi per i pulsanti
PFont font;
color noSelColor= color (255);
color selColor=color (0,255,255,50);

//barra per lavorare com i filtri
ControlP5 guib;
ControlP5 guia;
ControlP5 guibf;
ControlP5 guiba;


//cerchi che rappresentano le diverse tipologiedi Beat
OnSetEllipse onSetEl, onSetEl2; 
KickEllipse kickEl;
SnareEllipse snareEl;
HatEllipse hatEl;

//elissi Beat
float kickSize, snareSize, hatSize, eRadius, eRadius2; //raggi per gli elissi
//posizioni degli elissi
int kickX;
int kickY;
int snareX; 
int snareY;
int hatX;
int hatY;
int onSetX; 
int onSetY;
int mode=-1;//flag per i colori caldo-freddo

int w;//larghezza dei rettangoli delle frequenze

//dati per le particelle
int num = 100;
Particle[] p = new Particle[num];

//flag per abilitare i filtri
int pb=0;
int pa=0;
int pbb=0;



void setup()
{
  size(600, 400);
  noStroke();
  smooth();
  
  textMode(SCREEN);

  //carico la traccia sonora
  minim = new Minim(this);
  song = minim.loadFile("Scary Monsters and Nice Sprites.mp3", 1024);
  
  //creazione oggetti filtri
  lowpass = new LowPassSP(20, 44100);
  highpass = new HighPassSP(200, 44100);
  bandpass = new BandPass(200, 50, 44100);
  
  //avvio la traccia sonora
  song.play();
  
  //creo gli oggetti BeatDetect
  beat2 = new BeatDetect();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);  
  
  //creo un nuovo ascoltatore del ritmo, in modo da non perdere tutti i buffer per l'analisi
  bl = new BeatListener(beat, song);  
  
  
  //Setto i valori degli attributi dei cerchi che rappresentano i beat
  ellipseMode(CENTER_RADIUS);
  kickSize = snareSize = hatSize = eRadius = 20;
  eRadius2 = 20;
  kickX=width;
  kickY=0;
  snareX = width; 
  snareY= (height/4)*3;
  hatX =0;
  hatY=0;
  onSetX= width/2; 
  onSetY= height/2;
  
  
  //istanzio un oggetto relativo alle frequenze assunte dalla traccia musicale
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(100);
  
  
  //istanzio un vettore di particelle con massa pari a 100 e raggio 0.5
  for (int i = 0; i < p.length; i++) {
    float velx = random(-1,1);
    float vely = random(-1,1);
    p[i] = new Particle(int(random(width)), int(random(height)), velx, vely, 100.0, 0.5);
  }
 
  //console di controllo animazione
  font = loadFont("AndaleMono-24.vlw");//font utilizzato per i pulsanti
  
  pBasB = new PassaBassoButton(10, 330,105,25); //pulsante per abilitare il filtro passaBasso
  guib = new ControlP5(this);//barra per selezionare le frequenze di cutOff dato un range
  guib.addSlider( "PassaBasso", 20.0f, 10000.f, 120,312, 400, 20 );
  
  pAltB = new PassaAltoButton(10, 360,105,25);//pulsante per abilitare il filtro passaAlto
  guia = new ControlP5(this);//barra per selezionare le frequenze di cutOff dato un range
  guia.addSlider( "PassaAlto", 200.0f, 20000.f, 120,342, 400, 20 );
  
  
  pBandB = new PassaBandaButton(10, 390,105,25);//pulsante per abilitare il filtro passaBanda
  guibf = new ControlP5(this);//barra per selezionare le frequenze di cutOff dato un range
  guibf.addSlider( "PassaBanda Freq", 200.0f, 44100.f, 120,372, 400, 10 );
  guiba = new ControlP5(this);//barra per selezionare l'ampiezza dell'intervallo data una frequenza
  guiba.addSlider( "PassaBanda Amp", 50.0f, 500.f, 120,386, 400, 10 );


  //istanzio cerchi grandi per rappresentare i Beat
  onSetEl=new OnSetEllipse(onSetX,onSetY,eRadius);
  kickEl=new KickEllipse(kickX,kickY,kickSize);
  snareEl=new SnareEllipse(snareX,snareY,snareSize);
  hatEl=new HatEllipse(hatX,hatY,hatSize);

  //istanzio cerchi piccoli per rappresentare i Beat
  onSetEl2=new OnSetEllipse(onSetX,onSetY,eRadius2);

}

void draw()
{
  //setto il colore di sfondo dell'animazione
  background(0);
  
  //setto il colore delle particelle che staranno sullo sfondo dell'animazione
  fill(100, 100,0);
  //disegno le particelle
  for (int i = 0; i < p.length; i++) {
    PVector f = p[i].forzaGravita( p[i] );
    p[i].forzaGravita( f );
    p[i].update();
    p[i].controlloBordi();
    p[i].display();
  }
  
 //disegno i cerchi per i beat
  beat2.detect(song.mix);
  
 //cerchio centrale con cerchio piccolo al centro per l'onSeat Beat
  if ( beat2.isOnset() ) {eRadius = 100; eRadius2 = 50; }
  onSetEl.display(eRadius, mode); 
  eRadius *= 0.95; 
  if (eRadius < 20 ) {eRadius = 20;}
  if(onSetEl.x==width/2){
    onSetEl2.display(eRadius2, mode*(-1));
    eRadius2 *= 0.95;
    if (eRadius2 < 10) eRadius2 = 10;
  }
  
  
          
 //cerchio per il beat Kick
  if ( beat.isKick() ){ kickSize = 100;}
  kickEl.display(kickSize, mode);
  kickSize *= 0.95;
  if ( kickSize < 20 ) kickSize = 20;
  
  //cerchio per il beat Snare
  if ( beat.isSnare() ) {snareSize = 120;}
  snareEl.display(snareSize, mode);
  snareSize *= 0.95;
  if ( snareSize < 20 ) snareSize = 20;
  
  //cerchio per il beat Hat
  if ( beat.isHat() ) {hatSize = 140;}
  hatEl.display(hatSize, mode);
  hatSize *= 0.95;
  if ( hatSize < 20 ) hatSize = 20;

  //disegno le frequenze con suddivisione lineare
  rectMode(CORNERS);
  // esegue trasformata di Fourier sul buffer mix
  fft.forward(song.mix);
  w = int(width/fft.avgSize());
  //in base al mode selezionato cambia le combinazione di colori
  for (int i = 0; i < fft.avgSize(); i++)
  {
    fill( map( i, 0, fft.avgSize(), 0, 0), map( i, 0, fft.avgSize(), 100, 255), map( i, 0, fft.avgSize(), 20, 255) );
    rect(i*w,(height/4)*3,i*w+w, (height/4)*3  - fft.getAvg(i)*20);
  }
  
 //console
  fill(0);
  rect(0, ((height/4)*3), 600,400 );
  //coloro il pulsante passaBasso a seconda del suo stato(premuto/non premuto)
  if(pb==1){
    pBasB.display(font, selColor);
   }else{pBasB.display(font, noSelColor);};
  //coloro il pulsante passaAlto a seconda del suo stato(premuto/non premuto)
  if(pa==1){
    pAltB.display(font,selColor);
  }else{pAltB.display(font,noSelColor);} 
  //coloro il pulsante passaBanda a seconda del suo stato(premuto/non premuto)
  if(pbb==1){
    pBandB.display(font,selColor);
  }else{pBandB.display(font,noSelColor);}  
}

void mousePressed(){
  //pulsante passaBasso premuto
  if(pBasB.isClickedT( mouseX, mouseY)) {
    song.clearEffects();
    if(pb==0){
      pb=1;
    }
    if(pa==1){
      pa=0;
    }
    if(pbb==1){
      pbb=0;
    }
   song.addEffect(lowpass);  
  }
  //pulsante passaAlto premuto
  if(pAltB.isClickedT( mouseX, mouseY)) {
    song.clearEffects();
    if(pa==0){
      pa=1;
    }
    if(pb==1){
      pb=0;
    }
    if(pbb==1){
      pbb=0;
    }
   song.addEffect(highpass);    
  }
//pulsante passaBanda premuto
  if (pBandB.isClickedT( mouseX, mouseY)) {
    song.clearEffects();
    if(pbb==0){
      pbb=1;
    } 
    if(pb==1){
      pb=0;
    }
    if(pa==1){
      pa=0;
    }
    song.addEffect(bandpass);    
  }

  if(((mouseX>=(width/2)-100)&&(mouseX<=(width/2)+100))&&((mouseY>=(height/2)-100)&&(mouseY<=(height/2)+100))){
    song.clearEffects();
    pb=0;
    pa=0;
    pbb=0;    
  }
}

void mouseDragged(){
  //gestisce lo spostamento sulla barra del filtro passa basso
  if(pb==1){
    if(((mouseX > 120)&&(mouseX < 420))&&((mouseY > 312)&&(mouseY < 332))){
      lowpass.setFreq(map(mouseX, 120, 420, 20 , 10000));
    }
  }
  //gestisce lo spostamento sulla barra del filtro passa alto
  if(pa==1){
    if(((mouseX > 120)&&(mouseX < 420))&&((mouseY > 342)&&(mouseY < 362))){
      highpass.setFreq( map(mouseX, 120, 420, 200, 20000) );
      }
  }
  //gestisce lo spostamento sulla barra del filtro passa banda
  if(pbb==1){
    if(((mouseX > 120)&&(mouseX < 420))&&((mouseY > 372)&&(mouseY < 382))){
        bandpass.setFreq( map(mouseX, 120, 420, 200, 44100));
    }
    if(((mouseX > 120)&&(mouseX < 420))&&((mouseY > 386)&&(mouseY < 396))){
        bandpass.setBandWidth(map(mouseX, 120, 420, 50, 500));
    }
  }

}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

