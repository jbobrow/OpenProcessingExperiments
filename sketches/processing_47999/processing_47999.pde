
import processing.opengl.*;
import processing.pdf.*;

import ruim.particles.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer audio;
FFT fft;

ParticleSystem particulas;
int angle = 0;
void setup() {
  
  size(720,576, OPENGL); 
  smooth();

  minim = new Minim (this);
  audio = minim.loadFile( "musica.mp3");
  audio.play();

  fft = new FFT (audio.bufferSize(), audio.sampleRate());

  particulas = new ParticleSystem (this);

  int numParticulas = audio.bufferSize()/64;

  particulas.createRandomParticles (numParticulas);
  int numBackground;
  
    
    frameRate(12);

background(255,255,255);

                  
}




void draw() {
  
/*  int numback = (int) random (3);
 if (numback == 1){
                    background(255,255,255,50);
                    println("entrei");
 }
  */                           
     

  fft.forward(audio.mix);

  int numBandas = fft.specSize();


  for(int i = 0; i<numBandas; i++) {


    float val = fft.getBand(i);
//    ellipse(i, height/4, i, height/4 - (val * 1 ) );
  }  

  int numParticulas = particulas.getNumParticles();
  for (int i=0; i <numParticulas;i++) {

    float val = fft.getBand(i);
    float forcaX = random (-val, val);
    float forcaY = random (-val, val);
    particulas.getParticle(i).applyForce(forcaX, forcaY);
    fill (random(0,255),random(0,200),random(0, 50));
   stroke (random(100),random(100),random(100), random(80,100));
    float x = particulas.getParticle(i).getX();
    float y = particulas.getParticle(i).getY();
    float raio = val;
    //ellipse(x,y,random(50,100), random(50,100));
     textSize(20);
    fill(random(255), random(255), random(255), random(50,100));

    stroke (random(100),random(100),random(100), random(50,100));
 /*  
  String[] fontList = PFont.list();
  
  int fonte = (int) random (200);

  println( fontList[fonte]);
  PFont fonte1;
  fonte1 = loadFont(fontList[fonte]+".vlw");

    textFont(fonte1); 

*/  text("C  A  R  L  O  S       S  O  A  R  E  S", x,y);
    for (int j = i+1; j<numParticulas; j++) {
      float distancia = particulas.getParticle(i).getDistance(particulas.getParticle(j));

      if(distancia < 300) {
        float outraX = particulas.getParticle(j).getX();
        float outraY = particulas.getParticle(j).getY();
        stroke (random(255),random(255),random(255),random(100));
        line(x,y,outraX,outraY);
        
        
        angle += 10;
    float val1 = cos(radians(angle)) * 6.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(random(255),random(255),random(255), random(100));
     ellipse(x + xoff, y + yoff, val1+40, val1+40);
    }
    fill(random(255), random(255), random(255), random(100));
   ellipse(x, y, 22, 22);
      }
    }
  }





  particulas.update();
  
  saveFrame();
  saveFrame();
}


/*void mousePressed() {
  
  beginRecord(PDF, "Lines.pdf");
  background(255);
}

void mouseReleased(){
  endRecord();
  background(255);
}
*/

