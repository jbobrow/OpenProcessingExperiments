
/*/////////////////////
FLORENCE LABELLE
EDM4600 -50
TP3 -SIMULATION
////////////////////*/

////////////////////DÉCLARATION DES VARIABLES///////////////////////
PImage charmer;  //image charmeur+serpent
PImage c;  //image nuage
Pupilles pupille1;
Pupilles pupille2;
int savedTime;
Notes [] notes = new Notes [5];
Cloud[] clouds;



void setup() {
   
  size(400,400);
  smooth();
  savedTime = millis();
  charmer = loadImage("charmer.jpg");  //va chercher image charmeur + serpent
  c = loadImage("cloud.png");
  
  clouds = new Cloud[4];  //ArrayList pour les nuages
     for ( int i = 0 ; i < clouds.length ; i++ ) {
      clouds[i] = new Cloud( width/2 , height/2);
  }
  
  for ( int i = 0 ; i < notes.length; i++ ) { //  boucle de notes de musique
    notes[i] = new Notes(color(random(255),random(255),random(255)), width/2, height/3, 1);
 
 //Nouveaux objets: pupilles
  pupille1 = new Pupilles( width/1.35 , height/2.1 , color(0) );
  pupille2 = new Pupilles( width/1.28 , height/2.15, color(0) );
}
}


void draw() {
 background(charmer);
 
 
 //////////Dessin chapeau
  fill(0);
  stroke(255);
   ellipse(150,360,60,40);
   ellipse(150,350,80,20);
   ellipse(150,350,60,10);
   
 //////////Appel de la classe Pupilles
 pupille1.draw();
 pupille2.draw();
 
 //////////Appel de la classe Cloud
for ( int i = 0 ; i < clouds.length ; i++ ) {
     clouds[i] .draw();
   }
 
  fill(255,230,5,255);  //Couleur des pièces de monnaie
     int y2 = 348;  //pos pièces de monnaie
     int elapsed = millis() - savedTime;
    
    // quatre pieces de monnaie
    if ( elapsed > 100 ) {  //Après 0,10 sec, dessiner pièce#1
       ellipse (165,y2,12,12);
    }
    if ( elapsed > 1500 ) { //Après 1,5 sec, dessiner pièce#3
       ellipse (145,y2,12,12);
    }
    if ( elapsed > 600 ) {  //Après 0,6 sec, dessiner pièce#2
       ellipse (128,y2-1,12,12);
    }
    if ( elapsed > 2200 ) {  //Après 2,2 sec, dessiner pièce#4
       ellipse (155,y2,12,12);
    }


 // Relancer l'animation lorsqu'elle dépasse 3 secondes
if ( elapsed > 3000 ) {
         savedTime = millis();
    }


 ////////////////Appel de la classe Notes
  for (int i = 0; i<notes.length; i++) {
    notes[i].move();
    notes[i].display();
 }
 }
 
 
///////////////////////////PUPILLES SERPENT/////////////////////////////////////
class Pupilles {
  //Attributs de la classe
  float x;
  float y;
  color c;
 
  //Constructeur
  Pupilles( float x , float y , color c ) {
   this.x = x;
   this.y = y;
   this.c = c;  
  }
   
   
  void draw() {  //Fonction pupilles
  // blancs de yeux       
    stroke(0);
    fill(255);
    ellipse(297,134,10,8);
    ellipse(314,137,9,13);
    fill(0);
  // limites pupilles
    int x1 = constrain(mouseX,295,300);
    int y1 = constrain(mouseY,132,136);
    int x2 = constrain(mouseX,312,316);
    int y2 = constrain(mouseY,132,141);
    ellipse(x1,y1,2,2); // pupille gauche
    ellipse(x2,y2,2,2); // pupille droite
  }
}


///////////////////////////NOTES DE MUSIQUE/////////////////////////////////////
class Notes {
  //Attributs de la classe
  float xpos;
  float ypos;
  float xspeed;
  color c;
  
   //Constructeur
   Notes(color c_, float xpos_, float ypos_, float xspeed_) {
     c = c_;
     xpos = xpos_;
     ypos = ypos_;
     xspeed = xspeed_;
  }   
   
  void display() {  //Fonction notes
 
    ellipseMode(CENTER);
    stroke(0);
    fill(c);
    rect(xpos+5, ypos-35, 5, 30); 
    ellipse( xpos, ypos, 20 , 20 ); 
  }
  
  void move(){  //Fonction notes
    ypos= ypos + random (-4,0);
    xpos= xpos +random (-3, 5);
    if(xpos>width){
      xpos = 200;
      ypos = 185;
      }
  }
  }
  ////////////////////////////////NUAGES/////////////////////////
class Cloud {
  //Attributs de la classe
  float x;
  float y;
  float rads = 0.0; // angle de l'oscillation
  float rayon = 10; // longueur du cable du pendule
 
  //Constructeur
  Cloud( float x , float y) {
    
   c = loadImage("cloud.png"); //Image de nuages
   this.x = x;
   this.y = y;   
  }
    
   
  void draw() {  //Fonction nuages
     
      rads += 0.075; // incrémenter l'angle de l'oscillation
  float oscillation = cos(rads) * (PI/4) + (PI/2); // calculer l'oscillation (toujours entre -1 et 1)
   
  // convertir les coordonnées polaires en coordonnées cartésiennes
  // et déplacer le point de référence au point 0,width/3
  float y = sin(oscillation) * rayon;
  float x = cos(oscillation) * rayon + width/3;
   
  image(c, x-40,y-20);
  image(c, x+120,y-35);
  image(c, x+40,y-10);
  image(c, x+200,y);
      
  }    
    
}

