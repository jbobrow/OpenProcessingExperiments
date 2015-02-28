
//Petit hommage au célèbre film :

void setup() {
  size (500, 500);
  background(#FFFFFF);
  smooth();
  strokeWeight(0.5);
}


void draw() {
  
  //couleur définie aléatoiremment
  stroke(random(0, 100));
  
  /*Déclaration de variable, lorsqu'il y a un random dessus 
  cela permet d'utiliser la meme valeur aléatoire
  à deux endroits en meme temps. 
  (je peux ainsi le meme mouvement aux deux "ailes") */
  float px = random(mouseX-50, mouseX+10);
  float py = random(mouseY-10, mouseY+10);
 
  float a = random(py-10, py+10);
 
  if (mousePressed == true) { 

 line(px-10, a, px, py);
 line(px, py, px+10, a);
 

};

 /* là on capture ce qui est à l'écran et puis efface en remplissant avec du blanc. 
 Les captures sont dans le dossier du sketch.*/ 
 
  if (keyPressed == true) { 

  saveFrame();
  background(#FFFFFF); 
};
}

