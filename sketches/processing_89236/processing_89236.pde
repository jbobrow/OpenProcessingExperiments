
void setup() {
 size(300,500); 
 background(0); 
}


void draw() {
  //Les lignes partant d'en bas à droite
 line(275,475, random(0,200), random(0,50) ); 
 //Couleur des lignes
 stroke(random(25),random(255),random(255)); 
 
 //Les lignes partant d'en bas à gauche
  line(25,475, random(100,300), random(0,50) ); 
  //Couleur des lignes
 stroke(random(200),random(25),random(255)); 
}


