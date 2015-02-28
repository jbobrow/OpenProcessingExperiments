
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer audio;
BeatDetect beat;

PlayPulsante playImg;
PausePulsante pauseImg;
RewindPulsante rewindImg;

//Ellissi animazione
float dim=0;
float kickSize, hatSize;

void setup(){
  size(800, 500); 
  minim = new Minim(this);
  audio = minim.loadFile("CUT.mp3");
 //Creo i pulsanti 
  playImg = new PlayPulsante(width/2-25, height-50);
  rewindImg = new RewindPulsante(width/2-75, height-50);
  pauseImg = new PausePulsante(width/2+25, height-50);
  
  beat = new BeatDetect(audio.bufferSize(), audio.sampleRate());
  beat.setSensitivity(200); 
}

void draw(){
  smooth();
  background(0);
  noStroke();
  
  //Ellissi e quadrati effetti audio
  //Espandendosi, devono scomparire sotto la barra dei controlli
  fill(157,190,227, 250);
  ellipse (3*width/4,height/2-27,dim+kickSize,dim+kickSize);  
  ellipse (width/4,height/2-27,dim+hatSize,dim+hatSize);  
  for(int i=0; i<=10; i++){
    fill(0, random(255), random(255),200);
    rect (random(width),random(height),dim+hatSize/20,dim+hatSize/20);
  }    
  fill(42,180,49,150);
  ellipse (width/2,random(height),dim+kickSize/4,dim+kickSize/4);
  ellipse (width/2,random(height),dim+kickSize,dim+kickSize);
    
  //Barra dei controlli  
  fill(157,190,227);           //Colore sfondo
  rect(0,height-50,width,50);  //Posizione e dimensione
  textAlign(RIGHT);
  text("Dall'Opera Popolare NOTRE DAME DE PARIS",width-5,15);
  textAlign(LEFT);
  fill(0);
  text("Clicca PLAY per l'avvio",5,height - 20);
  
  //Mostro i tasti
  rewindImg.display();      
  playImg.display();
  pauseImg.display();
  
  //Creo barra per visionare a che punto del brano mi trovo. 
  //NO interazione diretta con barra.
  fill(255,255,255);
  rect(0,height-52,width,3);
  float x = map(audio.position(), 0, audio.length(), 0, width);
  fill(0);
  rect(x, height - 52, 3,3);  
  
  //Effetti ellissi
  beat.detect(audio.mix);
  kickSize=0;
  hatSize=0;    
  if(beat.isKick()){ kickSize=kickSize+500;}    
  if(beat.isHat()){ hatSize=hatSize+500;}    
  
  //Istruzioni di controllo
  if ((mousePressed==true)&&(playImg.click(mouseX, mouseY)))     //Avvio la musica
    audio.play();
  if ((mousePressed==true)&&(pauseImg.click( mouseX, mouseY)))   //Metto in pausa
    audio.pause();
  if ((mousePressed==true)&&(rewindImg.click( mouseX, mouseY)) ) //Torno al principio
    audio.rewind();        
  if ((keyPressed==true)&&(key=='d'||key=='D'))    //Vado avanti di 100 millisecondi
    audio.skip(100);
  if ((keyPressed==true)&&(key=='s'||key=='S'))    //Torno indietro di 100 millisecondi
    audio.skip(-100); 
}


void stop(){
  audio.close();
  minim.stop();
  super.stop();
}

