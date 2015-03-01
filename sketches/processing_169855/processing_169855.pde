
// Dans ce programme on ajoute une nouvelle fonction en plus de setup et draw
// tout en bas on a un bloc de code comme ceci :
// void keyPressed(){
//
// }
// les lignes de code que l'on tape à l'intérieur seront executées si l'utilisateur appuis sur une touche




void setup() {  
  size(300, 300);
  background(255); // on dessine sur fond blanc  
  
}

void draw() { 
    stroke(0,25); // avec un contour noir transparent
    fill(random(255),random(255),random(255), 15); // remplissage niveau de rouge alÃ©atoire, niveau de vert alÃ©atoire,
                                                    // et niveau de bleur alÃ©atoire. Transparence importante.
    ellipse(mouseX,mouseY,random(5,50),random(5,50)) ; // on dessine un cercle aux positions de la souris avec un rayon alÃ©atoire.
}

void keyPressed(){
    background(random(255),random(255),random(255)); // si une touche est appuyée on change la couleur de fond ce qui va effacer le dessin
}
