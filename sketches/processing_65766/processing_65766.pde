

// ENREGISTRER UNE CAPTATION SONORE

// Librairie
import ddf.minim.* ;

Minim son ;
AudioInput entree ;
AudioRecorder cassette ;

void setup() {
 
 size (500,200) ;
 background (0);
 fill (255) ;
 smooth() ;

 // Objets pour manipuler les données Audio
 son = new Minim(this) ;
 entree = son.getLineIn (Minim.STEREO, 2048) ;
 cassette = son.createRecorder (entree, "tube.wav", true) ; // (Source, nom du fochier à enregistrer, usage du tampon ou non)
  
}

void draw() {
 
 // Visualiser l'enregistrement
 if (cassette.isRecording()) {
  fill(255,0,0) ;
 }
 else {
  fill(100,255,0) ;
 }
 ellipse(250,100,100,100) ;
  
}

void keyPressed() {
 
 if (key == 'b') { cassette.beginRecord(); }
 if (key == 'e') { cassette.endRecord(); }
 if (key == 's') { cassette.save(); }
  
}

void stop() {
 
 entree.close() ;
 son.stop() ;
 super.stop() ;

}


