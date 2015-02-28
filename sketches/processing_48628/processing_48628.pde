
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
//Deux cercles se déplacent dans l'espace, 
//l'orsque je click sur ces cercles, ils grossissent, un contour s'ajoute
// et un 3eme cercles apparait l'orsque la souris ne click plus les cercles 
// redeviennent comme avant

int deplacementX, deplacementY; // je définis le déplacement des variables
int x, y; // mes variables

void setup() {

 size(400,400); // taille du document
 smooth(); // contour atténuer
 x = 0; // valeur de x et y
 y = 0;
 
 deplacementX = 5; // déplacement des x et Y
 deplacementY = -3; 
 noStroke(); // pas de contour
 fill(19,211,206); // remplissage
}


void draw() {

 nettoyer(); // apres le passage du cercle l'ecran efface le passage d'avant
 bouger(); // les cercles bougent de part et d'autre de l'écran
 rebondir(); // lorque les cercles touche les bords de l'ecran les cercles 
 //sont renvoyés
 dessiner();// pour déssiner les cercles

}


void nettoyer() {  
 background(255); // effacement des cercles précédent
}


void rebondir() {
 
 if (x > width) {
   deplacementX = -5;
 }
 
 if (x < 0) {
   deplacementX = 5;
 }
 
 if (y > width) { 
   deplacementY = -3;
 }
 
 if (y < 0) {
   deplacementY = 3;
 }

}


void bouger() {
 x = x + deplacementX;
 y = y + deplacementY;
}


void dessiner() {
ellipse ( x,y,30,30); // taille et point de départ des cercles
ellipse ( y,x,50,50);
  if (mousePressed == true){ // si la souris click 
for (int i=0; i<200; i++){ // alors
stroke(7,103,11); // un coutour s'ajoute
smooth();
ellipse ( x,y,60,60); // grossissement des cercles
ellipse ( y,x,100,100);
ellipse ( y/2,x/2,150,150);

}
}
else {
noStroke(); // si la souris ne click plus, les cercles redeviennent normal

}
}


                
                
