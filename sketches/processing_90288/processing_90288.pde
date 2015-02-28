
Cercle[] mesCercles; // Je me cree un tableau qui contient des Cercle nommé mesCercles

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);
  
  noStroke();
  
  mesCercles = new Cercle[6]; // Je donne 6 cellules a mon tableau
  
  for(int i = 0; i < 6; i++){ // Pour traverser chaque cellule
    mesCercles[i] = new Cercle(width/2, 10*(i*7),80-(i*9),(1+i)*2,i,color(random(0,255),random(0,255),random(0,255))); // Je cree un cercle dans chaque cellule
  } 
}

void draw() {
  background(255);
  
  for(int i = 0; i < 6; i++){ // Je traverse les cellules
    mesCercles[i].afficher(); // J'execute la fonction afficher de chaque cercle de chaque cellule
    mesCercles[i].bouger(); // J'execute la fonction bouger idem ^
  }  
}

class Cercle {
  // proprietes
  float x;
  float y;
  float d; // diametre
  float v; // vitesse
  int t; // trajectoire
  color c;
  
  // constructeur
  Cercle(float posX, float posY, float diametre, float vitesse, int trajectoire, color couleur){
    x = posX;
    y = posY;
    d = diametre;
    v = vitesse;
    t = trajectoire;
    c = couleur;
  }
  
  // methodes
  void afficher(){
    fill(c);
    ellipse(x,y,d,d);
  }
  
  void bouger(){
    if(t == 0 || t == 2 || t == 4){ // Si c'est le premier, troisieme ou 5e cercle..
      x -= v; // on va vers la gauche
    }else{ // sinon
      x += v; // on va vers la droite
    }
    
    if(x >=width){
      x = 0;
    }
    if(x < 0){
      x = width;
    }
  }
}
