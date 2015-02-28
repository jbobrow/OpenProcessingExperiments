
void setup() {
 size(300,500); 
 background(245); 
}


void draw() {
  //Les lignes partant d'en bas à droite
 line(275,475, random(0,200), random(25,25) ); 
 //Couleur des lignes
 stroke(random(155),random(149),random(224)); 
 
 //Les lignes partant d'en bas à gauche
  line(25,475, random(100,300), random(25,25) ); 
  //Couleur des lignes
 stroke(random(224),random(149),random(176)); 


 //Les lignes partant d'en bas à gauche
  line(150,475, random(100,200), random(25,25) ); 
  //Couleur des lignes
 stroke(random(206),random(232),random(207)); 
 }


