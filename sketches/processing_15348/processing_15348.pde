
// il faut dire à Processing qu'il doit ajouter les fonctions d'analyse audio
import krister.Ess.*;

// ces variables seront notre moyen accès à Ess
AudioInput entree_son;
FFT analyse_son;

//declare the object(s)
PImage photo;
float r = random(20,600);
float d = random(13,450);
float x = random(40,200);


void setup() {
  size(353,294);
  photo = loadImage("Car.jpg");
  
   // couleur
 noStroke();
 fill(150,100,130);

 // démarrer ess
 Ess.start(this);
 // créer un accès à l'entrer audio
 entree_son=new AudioInput();
 // démarrer l'analyseur audio (FFT)
 analyse_son=new FFT();
 // start your engines!
 entree_son.start();

}

void draw() {
  image(photo, random(-7,7), random(-7,7) );
  
  //declare the object(s)
  PImage photo;
  float r = random(20,600);
  float d = random(13,450);
   float x = random(40,200);

   // chercher le niveau d'entrée (le * 100 est juste pour être un peu plus visible)
 float niveau = analyse_son.getLevel(entree_son) * 100;

 // dessiner cinq rectangles au milieu de l'écran
 rect(100,200,niveau*10,niveau*10);
 rect(30,400,niveau*20,niveau*50);
 rect(200,50,niveau*10,niveau*80);
 rect(10,100,niveau*10,niveau*50);
 rect(50,400,niveau*50,niveau*20);
 rect(0,100,niveau*100,niveau*20);
 rect(100,100,niveau*70,niveau*10);
 rect(200,50,niveau*200,niveau*10);
 rect(50,100,niveau*100,niveau*10);
 rect(100,200,niveau*200,niveau*50);
 rect(30,200,niveau*400,niveau*200);
 rect(30,200,niveau*200,niveau*400);
 rect(400,50,niveau*200,niveau*10);
 rect(20,600,niveau*400,niveau*10);
 rect(13,450,niveau*300,niveau*20);
 rect(10,200,niveau*100,niveau*10);
 rect(100,200,niveau*20,niveau*60);
 rect(30,400,niveau*10,niveau*10);
 rect(200,50,niveau*200,niveau*100);
 rect(20,600,niveau*400,niveau*600);
 rect(600,200,niveau*600,niveau*200);
 rect(100,200,niveau*100,niveau*200);
}

  void keyPressed() {
  x = random(150,170);
  r = random(0,450);
  d = random(0,450);
  fill(random(255),random(255),random(255));
  noStroke();
  rect(r,d,x,x);
 }

/* Fermer correctement l'entrée audio à la fin (tirer la chasse d'eau pour le suivant) */
public void stop() {
 Ess.stop();
 super.stop();
}

