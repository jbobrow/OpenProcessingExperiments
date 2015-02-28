
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;

//l'objet minim est utilisé pour contrôler la librairie

Minim minim;
AudioOutput out;
SineWave sine;
AudioPlayer player;

//la transformé de fourrier va découper le son en bande de fréquence

FFT fftOut;
FFT fftPlayer;

// cette valeur divise le sketch par le nombre de fréquence
int w;
boolean isPlayer=false; //true

//bouton
PImage a; // bouton de base;
PImage b;// bouton en lecture
PImage c;// bouton en roll


// effet ghost sur la représentation graphique
PImage fade;
// variable couleur
int hVal;
// variable effet 3D
float rWidth, rHeight;
PFont fontA;

void setup()
{
  size(800, 600, P3D); // le fait d'utiliser le P3D évite la distortion dans le rendu graphique.
   
  a = loadImage("base.png");
  b = loadImage("on.png");
  c = loadImage("roll.png");

  
  background(0);
   //initialise l'objet minim
  minim = new Minim (this);

  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
   sine = new SineWave(440, 0.3, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(300);
  // add the oscillator to the line out
   out.addSignal(sine);


  player = minim.loadFile("dimension.mp3");
  player.setGain (-1);
  

  


  //initialise les objets fft
  fftOut = new FFT(out.bufferSize(), out.sampleRate());
  fftPlayer = new FFT(player.bufferSize(), player.sampleRate());

  // echelle logarythmique utile au bon affichage des fréquences
  fftOut.logAverages(60, 7);
  fftPlayer.logAverages(60, 7);
  stroke(255);
  // la hauteur des lignes sera égale à la largeur des bandes de fréquences
  //w = width/fft.avgSize(); 
  //strokeWeight(w/1.1);


  
  fade = get(0, 0, width, height);

  rWidth = width*0.99;
  rHeight = height*0.99;
  hVal = 0;
  // For vector fonts, use the createFont() function. 
  fontA = loadFont("DimboItalic-48.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 23);
}

void draw(){
  
  background(0);
  
  
  
  
  //println(distance(mouseX,mouseY,735,435));
  
  DrawFFT ();
  drawWaveForm();
  
  
  
  if (isPlayer) {   //joue mp3
   
   image(b,700,400,70,70);
   
  }else {
    
    image(a,700,400,70,70);
    if (distance(mouseX,mouseY,735,435)<27) {
    
    image(c,700,400,70,70);
 }
    
  }

  
  
  displayInfos ();
  
  
  
}

void drawWaveForm(){
   stroke(0, 255, 50, 100);
    strokeWeight(2);
    
    if(isPlayer) {
      for (int i = 0; i < player.bufferSize() - 1; i++){
        float x1 = map(i, 0, player.bufferSize(), 0, width);
        float x2 = map(i+1, 0, player.bufferSize(), 0, width);
        line(x1, 50 + player.left.get(i)*70, x2, 50 + player.left.get(i+1)*70);
        line(x1, 150 + player.right.get(i)*70, x2, 150 + player.right.get(i+1)*70);
      }
    } else {
      for (int i = 0; i < out.bufferSize() - 1; i++){
        float x1 = map(i, 0, out.bufferSize(), 0, width);
        float x2 = map(i+1, 0, out.bufferSize(), 0, width);
        line(x1, 50 + out.left.get(i)*70, x2, 50 + out.left.get(i+1)*70);
        line(x1, 150 + out.right.get(i)*70, x2, 150 + out.right.get(i+1)*70);
      }
    }
}

void DrawFFT () {
  tint(255, 255, 255, 255);                                                      // la dernière valeur agit sur la vitesse du fade
  image(fade, (width - rWidth)/2, (height - rHeight)/2, rWidth, rHeight);       //ghostFX
  noTint();                                                                      // 


  //affiche la fft sur le mix stéréo
  fftOut.forward(out.mix);
  fftPlayer.forward(player.mix);


  colorMode(HSB);
  stroke(hVal, 255, 100);
  w = (isPlayer) ? width/fftPlayer.avgSize() : width/fftOut.avgSize(); 
  // defini le contour du spectre
  strokeWeight(w/1.1);
  colorMode(RGB);


  if (isPlayer) {
  // à chaque fois que cette boucle est utilisé on ajoute 1 à i, et cela continu jusqu'au bon nombre de bande de fréquence de la fft
    for (int i = 0; i<fftPlayer.avgSize(); i++) {
      line((i*w) + (w/2), 550, (i*w) + (w/2), 550 -fftPlayer.getAvg(i)*2); //le* sert a augmenter la taille du spectre
    }
  
    fade = get(0, 0, width, height);
    stroke(255);
    for (int i = 0; i<fftPlayer.avgSize(); i++) {  
      line((i*w) + (w/2), 550, (i*w) + (w/2), 550 -fftPlayer.getAvg(i)*3);
    }
  } else {
    for (int i = 0; i<fftOut.avgSize(); i++) {
      line((i*w) + (w/2), 550, (i*w) + (w/2), 550 -fftOut.getAvg(i));
    }
  
    fade = get(0, 0, width, height);
    stroke(255);
    for (int i = 0; i<fftOut.avgSize(); i++) {  
      line((i*w) + (w/2), 550, (i*w) + (w/2), 550 -fftOut.getAvg(i));
    }
    
  }

  hVal +=2;
  if (hVal>255)  hVal = 0;
  
}

void mouseMoved() {
  if(!isPlayer) {
    // with portamento on the frequency will change smoothly
    float freq = map(mouseY, 0, height, 2000, 60);
    sine.setFreq(freq);
    // pan always changes smoothly to avoid crackles getting into the signal
    // note that we could call setPan on out, instead of on sine
    // this would sound the same, but the waveforms in out would not reflect the panning
    float pan = map(mouseX, 0, width, -1, 1);
    sine.setPan(pan);
  }
}

void mousePressed() {
  if (distance(mouseX,mouseY,735,435)<27) {   // valeur de la zone de clic depuis le centre du bouton
    
    
    if (!isPlayer) {
      
      out.clearSignals();
      player.play();
      isPlayer=true;
      
    } else {
       player.pause();
      out.clearSignals();
      out.addSignal(sine);
      isPlayer=false;
      
    }
  } 
}

void displayInfos () {
  fill(100,100,100);
  
  
  if (!isPlayer) {
    text("Déplace ta souris de bas en haut\n" +
    "pour changer la fréquence du signal\n"+
  "et de gauche à droite pour la stéréo !\n", 10, 250);
  text("Ecouter un \n" + "extrait audio !", 685, 360);
  } else {
  text("Retour à \n" + "la sinusoïde !", 685, 360);
  
  }
    

  fill(255);
  translate(-100, 160);
  //text("100", width / 10, 2 * height / 3 + height / 30);
  text("125", width / 6, 2 * height / 3 + height / 30);
  text("250", width / 5 + width / 12, 2 * height / 3 + height / 30);
  text("500", width / 2 - width / 12, 2 * height / 3 + height / 30);
  text("1000", width / 2 + width / 36, 2 * height / 3 + height / 30);
  text("2000", 2 * width / 3 - width / 100, 2 * height / 3 + height / 30);
  text("4000", 4 * width / 5 - width / 50, 2 * height / 3 + height / 30);
  text("8000  Hz", width - width / 10, 2 * height / 3 + height / 30);
}

float distance (float xa,float ya, float xb, float yb){
  return sqrt(((xb-xa)*(xb-xa))+((yb-ya)*(yb-ya)));
}


void stop() {
  out.close();
  minim.stop();
  super.stop();
}


