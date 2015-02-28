
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PFont font;

Minim minim;
AudioPlayer song;

FFT fft;
BeatDetect beat; //beatDetect per i Beat Snare, Kick e Hat
BeatDetect beat2; //beatDetect per i Beat OnSet
BeatListener bl;

//pulsanti
KickButton KickB;
SnareButton snareB;
HatButton hatB;
OnSetButton onSetB;
AllButton allB;
ResetButton resetB;

//cerchi che rappresentano le diverse tipologiedi Beat
OnSetEllipse onSetEl, onSetEl2;
KickEllipse kickEl, kickEl2;
SnareEllipse snareEl,snareEl2;
HatEllipse hatEl,hatEl2;

//oggeto timer per cambiare i colori da caldi a freddi
Timer timer;

//elissi Beat
float kickSize, snareSize, hatSize,kickSize2, snareSize2, hatSize2, eRadius,eRadius2; //raggi per gli elissi
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

int kb=0;
int hb=0;
int osb=0;
int sb=0;

//dati per le particelle
int num = 100;
Particle[] p = new Particle[num];


void setup()
{
  size(600, 400);
  noStroke();
  smooth();
  
  
  textMode(SCREEN);

  minim = new Minim(this);
  song = minim.loadFile("Scary Monsters and Nice Sprites.mp3", 1024);
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
  kickSize2 = snareSize2 = hatSize2 = eRadius2 = 20;
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
  
  
  //istanzio un oggetto timer per calcolare il tempo trascorso attraverso i metodi della classe Timer   
  timer = new Timer(10000);
  timer.start();//faccio partire il timer
  
   //istanzio un vettore di particelle con massa pari a 100 e raggio 0.5
  for (int i = 0; i < p.length; i++) {
    float velx = random(-1,1);
    float vely = random(-1,1);
    p[i] = new Particle(int(random(width)), int(random(height)), velx, vely, 100.0, 0.5);
  }
 
  //console di controllo animazione
  KickB = new KickButton(35, 333,100,25);
  snareB = new SnareButton(35, 363,100,25);
  hatB = new HatButton(35, 393,100,25);
  onSetB = new OnSetButton(485,333,100,25);
  allB = new AllButton(485,363,100,25);
  resetB=new ResetButton(485,393,100,25);
  
  //istanzio cerchi grandi per rappresentare i Beat
  onSetEl=new OnSetEllipse(onSetX,onSetY,eRadius);
  kickEl=new KickEllipse(kickX,kickY,kickSize);
  snareEl=new SnareEllipse(snareX,snareY,snareSize);
  hatEl=new HatEllipse(hatX,hatY,hatSize);
  //istanzio cerchi piccoli per rappresentare i Beat
  onSetEl2=new OnSetEllipse(onSetX,onSetY,eRadius2);  
  kickEl2=new KickEllipse(kickX,kickY,kickSize2);
  snareEl2=new SnareEllipse(snareX,snareY,snareSize2);
  hatEl2=new HatEllipse(hatX,hatY,hatSize2);

  font = loadFont("AndaleMono-24.vlw");
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
  
  //controllo se un tot di tempo è trascorso
  if (timer.isFinished()) {
    mode=mode*(-1);//cambio il flag mode=> cambio la combinazione di colori
    timer.start();
  }
  
  //disegno i cerchi per i beat
  beat2.detect(song.mix);
 
  //cerchio centrale con cerchio piccolo al centro per l'onSeat Beat
  if ( beat2.isOnset() ) {eRadius = 200; eRadius2 = 100; }
  onSetEl.display(eRadius, mode); 
  eRadius *= 0.95; 
  if (eRadius < 20 ) {eRadius = 20;}
  if(onSetEl.x==width/2){
    onSetEl2.display(eRadius2, mode*(-1));
    eRadius2 *= 0.95;
    if (eRadius2 < 10) eRadius2 = 10;
  }
          
  //cerchio per il beat Kick
  if ( beat.isKick() ){ kickSize = 100; kickSize2 = 50;}
  kickEl.display(kickSize, mode);
  kickSize *= 0.95;
  if ( kickSize < 20 ) kickSize = 20;
  if(kickEl.x==width/2){
    kickEl2.display(kickSize2, mode*(-1));
    kickSize2 *= 0.95;
    if ( kickSize2 < 10 ) kickSize2 = 10;
  }
  
  //cerchio per il beat Snare
  if ( beat.isSnare() ) {snareSize = 120; snareSize2 = 60;}
  snareEl.display(snareSize, mode);
  snareSize *= 0.95;
  if ( snareSize < 20 ) snareSize = 20;
  if(snareEl.x==width/2){
    snareEl2.display(snareSize2, mode*(-1));
    snareSize2 *= 0.95;
    if ( snareSize2 < 10 ) snareSize2 = 10;
  }
  
  //cerchio per il beat Hat
  if ( beat.isHat() ) {hatSize = 140; hatSize2 = 70;}
  hatEl.display(hatSize, mode);
  hatSize *= 0.95;
  if ( hatSize < 20 ) hatSize = 20;
  if(hatEl.x==width/2){
    hatEl2.display(hatSize2, mode*(-1));
    hatSize2 *= 0.95;
    if ( hatSize2 < 10 ) hatSize2 = 10;
  }
 
 
 //disegno le frequenze con suddivisione lineare
  rectMode(CORNERS);
  noStroke();
  // esegue trasformata di Fourier sul buffer mix
  fft.forward(song.mix);
  w = int(width/fft.avgSize());
  //in base al mode selezionato cambia le combinazione di colori
 for (int i = 0; i < fft.avgSize(); i++)
  {
    if(mode==1){
      fill( map( i, 0, fft.avgSize(), 30, 255), map( i, 0, fft.avgSize(), 0, 125), map( i, 0, fft.avgSize(), 0, 0) );
    }else{
      fill( map( i, 0, fft.avgSize(), 20, 0), map( i, 0, fft.avgSize(), 0, 0), map( i, 0, fft.avgSize(), 0, 255) );
    }
    rect(i*w,(height/4)*3,i*w+w, (height/4)*3  - fft.getAvg(i)*20);
  }
  
//console
  stroke(255);
  strokeWeight(2);
  fill(0);
  rect(0, ((height/4)*3), 599,399 );
    
  KickB.display(font);
  snareB.display(font);
  hatB.display(font);
  onSetB.display(font);
  allB.display(font);
  resetB.display(font);
  
  if(kb==1){KickB.displayL(35,333,95,333,mode);}
  if(sb==1){snareB.displayL(35,363,110,363,mode);}
  if(hb==1){hatB.displayL(35,393,80,393,mode);}
  if(osb==1){onSetB.displayL(485,333,560,333,mode);}
  
  //Barra e minuti di avanzamento traccia sonora
  int time = song.position()/1000;
  int sec= time%60;
  int minuti=time/60;
  fill(255);
  String m =(minuti)+":"+(sec);
  text(m,(width/2)-25, 350);
  strokeWeight(6);
  if(mode==1){
    stroke(255,125,0);
  }else{
    stroke(0,125,255);
  }
  line(125, 365,465, 365);
  strokeWeight(6);
  stroke(255);
  line(125, 365, (((float)song.position() / song.length())*340)+125, 365);
}

void mousePressed(){
//premere pulsante kick 
  if (KickB.isClickedT( mouseX, mouseY)){
    kb=1;
    sb=osb=hb=0;
    if(onSetEl.x==width/2){  
    kickEl.swap(onSetEl, kickEl);
    kickEl2.swap(onSetEl2, kickEl2);
    }else{
      if(hatEl.x==width/2){
        kickEl.swap(hatEl, kickEl);
        kickEl2.swap(hatEl2, kickEl2);
      }else{
        kickEl.swap(snareEl, kickEl);
        kickEl2.swap(snareEl2, kickEl2);
      }
    }
  }
  
//premere pulsante snare     
  if (snareB.isClickedT( mouseX, mouseY)){
    sb=1;
    osb=kb=hb=0;
    if(onSetEl.x==width/2){  
      snareEl.swap(onSetEl, snareEl);
      snareEl2.swap(onSetEl2, snareEl2);
    }else{
      if(hatEl.x==width/2){
        snareEl.swap(hatEl, snareEl);
        snareEl2.swap(hatEl2, snareEl2);
      }else{
        snareEl.swap(kickEl, snareEl);
        snareEl2.swap(kickEl2, snareEl2);
       }
    }
 }
 
 //premere pulsante hat   
 if (hatB.isClickedT( mouseX, mouseY)){
    hb=1;
    sb=osb=kb=0;
   if(onSetEl.x==width/2){  
     hatEl.swap(onSetEl, hatEl);
     hatEl2.swap(onSetEl2, hatEl2);
   }else{
     if(kickEl.x==width/2){
       hatEl.swap(kickEl, hatEl);
       hatEl2.swap(kickEl2, hatEl2);
     }else{
       hatEl.swap(snareEl, hatEl);
       hatEl2.swap(snareEl2, hatEl2);
     }
   }
 }
 
 //premere pulsante onSet   
 if (onSetB.isClickedT( mouseX, mouseY)){
    osb=1;
    sb=kb=hb=0;
   if(kickEl.x==width/2){  
     onSetEl.swap(kickEl, onSetEl);
     onSetEl2.swap(kickEl2, onSetEl2);
   }else{
     if(hatEl.x==width/2){
       onSetEl.swap(hatEl, onSetEl);
       onSetEl2.swap(hatEl2, onSetEl2);
     }else{
       if(snareEl.x==width/2){
         onSetEl.swap(snareEl, onSetEl);
         onSetEl2.swap(snareEl2, onSetEl2);
       }
     }
   }
 }
 
 //premere pulsante all   
 if (allB.isClickedT( mouseX, mouseY)){
     hb=sb=osb=kb=0;
     onSetEl.all(kickEl, onSetEl, hatEl, snareEl);
     onSetEl2.all(kickEl2, onSetEl2, hatEl2, snareEl2);
 }
 //premere il pulsante reset
 if (resetB.isClickedT( mouseX, mouseY)){
   hb=sb=osb=kb=0;
   onSetEl.modify(onSetX,onSetY, eRadius);
   kickEl.modify(kickX, kickY, kickSize);
   snareEl.modify(snareX, snareY,snareSize);
   hatEl.modify(hatX,hatY,hatSize);
 }
   
    
}

void keyPressed(){
  //nel momento in cui si preme il pulsante "s" la traccia sonora va in pausa
  if ((key == 115)||(key==83)) {
    song.pause();
  }else{
    //nel momento in cui si preme il pulsante "p" la traccia sonora va in play
    if((key==112)||(key==80)){
      song.play();
    }else{
      if((key==114)||(key==82)){
        //nel momento in cui si preme il pulsante "r" la traccia sonora torna all'inizio
        song.rewind();
      }
    }
  }
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

