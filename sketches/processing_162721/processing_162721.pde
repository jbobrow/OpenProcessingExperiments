
// By Tifaine, Aurelie et Lucille

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer marvin;

FFT fft;

void setup(){
  size(600,600);
  smooth();
  
  minim = new Minim(this);
  marvin = minim.loadFile("marvin.mp3");
  marvin.play();
  
  fft = new FFT(marvin.bufferSize(), marvin.sampleRate());
  
}

void draw() {
  
 background(0);
  fill(255,0,0);
  noStroke();
  
  fft.forward(marvin.mix);
  
  translate(width/2,4*height/5); //placement du coeur
  
  // boucle pour dÃ©finir la forme du coeur
  for (int i=0; i<61; i+=6) {
    float x = 0.25 * (-pow(i,2) + 40*i + 1200)*sin((PI*i)/180);
    float y = -0.25 * (-pow(i,2) + 40*i + 1200)*cos((PI*i)/180);
    
    
    
    // formes formant le coeur
    for(int j = 0; j < marvin.left.size() - 1; j++)
  {
   
   ellipse(x,y,marvin.left.get(j)*30,marvin.left.get(j+1)*30); 
   ellipse(-x,y,marvin.right.get(j)*30, marvin.right.get(j+1)*30);
   
  }
  }
}

// Correction
// Le sketch fonctionne-t-il bien ? ***/4
// Copyright ? */1
// Le code est-il correctement commente ? ***/4
// Disposition et lisibilite du code ? ****/4
// Le son produit-il un effet visible ? ****/4
// Y a t-il de l'interactivite ? /4
// Effet graphique elabore, importance de l'intervention ? ***/4
