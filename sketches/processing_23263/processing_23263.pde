
// Cliquer pour ajouter des explosions.
// Les explosions disparaissent apres une certain duree.
 
 
ArrayList explosions;
 
void setup() {
 
  size(300,300);
  smooth();
 
  // Un ArrayList est un objet
  explosions = new ArrayList();
 
  frameRate(20);
}
 
 
void draw() {
 
  background(100);
   
  // if ( mousePressed ) mousePressed();
   
  // On traverse l'ArrayList a l'envers
  // pour pouvoir enlever des elements
  for ( int i = explosions.size() -1 ; i >= 0 ; i-- ) {
    Explosion b = (Explosion) explosions.get(i);
    b.draw();
    if ( b.isAlive() == false ) {
      explosions.remove(i);
    }
  }
  
  int numberOfExplosions = explosions.size();
  text( numberOfExplosions , 10 , 20  );
}
 
void mousePressed() {
 
  int quantite = floor(random(4,16));
  for ( int i = 0; i < quantite; i++) {
    Explosion b = new Explosion(mouseX,mouseY);
    explosions.add(b);
  }
}
 
class Explosion {
 
 
  float x;
  float y;
  color c;
  float taille;
  int duree;
  private int debut;
  float direction;
  float vitesse;
  float rotation;
  float vitesseRotation;
 
  Explosion( float x, float y) {
 
    this.x = x;
    this.y = y;
    c = color(random(200,256),random(0,256),random(0,30));
    taille = random(5,20);
    duree = floor(random(200,1500));
    debut = millis();
    direction = random(TWO_PI);
    vitesse = random(2,6);
    rotation = random(TWO_PI);
    vitesseRotation = random(-0.5,0.5);
  }
 
 
  void draw() {
 
    
    
      x = x + cos(direction) * vitesse;
      y = y + sin(direction) * vitesse;
 
      noStroke();
      fill(c);
      pushMatrix();
      translate(x,y);
      rotation = rotation + vitesseRotation;
      rotate(rotation);
      rectMode(CENTER);
       
      // Changer la taille selon le debut restant
      int debutEcoule = millis() - debut;
      float tailleCourante =  map( debutEcoule , 0 , duree , taille , 0);
       
      rect( 0, 0, tailleCourante, tailleCourante );
      popMatrix();
    
  }
  
  boolean isAlive() {
    if ( millis() - debut > duree ) {
      return false;
    } 
   
   return true; 
  }
}
