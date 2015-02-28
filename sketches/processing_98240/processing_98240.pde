
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



PImage portada;//foto de portada
PImage shooting;//django disparant
 Minim minim;
AudioPlayer daSound;
AudioOutput out;

void setup(){
  noCursor();
  size(900,900);
 minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("song.mp3");//cançó de django
    daSound.cue(0);
    daSound.play();//

  
 
    shooting = loadImage("shooting.jpg");

    portada = loadImage("portada.jpg");
 
}

void draw () {
  background(0);

  image(portada,mouseX-256,mouseY-157);//al mitg de la imatge
   if(mousePressed==true){//quan premi que surti el següent
     background(0);
  image(shooting,26,150);
   daSound = minim.loadFile("shot.mp3");//so de la pistola
      daSound.cue(0);
      daSound.play();
  }
}


