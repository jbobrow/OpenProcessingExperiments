

// CRÉER UN MINI-MOOG

// Librairie
import ddf.minim.*;

// Objet de classe
Minim son ;

// Création d'objets AudioSnippet (plus adaptés à des sons courts)
AudioSample note1 ;
AudioSample note2 ;
AudioSample note3 ;
AudioSample note4 ;
AudioSample note5 ;
AudioSample note6 ;

void setup() {
 
 // Constructeur
 son = new Minim(this) ;
 
 // Chargement des notes dans les objets
 note1 = son.loadSample("note-1.mp3") ;
 note2 = son.loadSample("note-2.mp3") ;
 note3 = son.loadSample("note-3.mp3") ;
 note4 = son.loadSample("note-4.mp3") ;
 note5 = son.loadSample("note-5.mp3") ;
  
}

void draw() { background(0) ; }

void keyPressed() {
  
  if (key == 'a') { note1.trigger() ; }
  if (key == 'z') { note2.trigger() ; }
  if (key == 'e') { note3.trigger() ; }
  if (key == 'o') { note4.trigger() ; }
  if (key == 'p') { note5.trigger() ; }
  
}

void stop() {
 
 note1.close();
 note2.close(); 
 note3.close(); 
 note4.close(); 
 note5.close();
 son.stop();
 super.stop();
  
}

