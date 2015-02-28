
//je donne une taille à mon sketch et un fond blanc
void setup (){
  size(200,200);
  background(255);
  smooth();
}

//je créé une ellipse dont l'animation se répète 10 fois, de façon aléatoire et suivant la position de la souris
void draw (){
  frameRate(10);
  ellipse(random(mouseX),random(mouseY),20,20);
}


