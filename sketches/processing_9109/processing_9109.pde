
//import processing.pdf.*;
//créer un pDF avec plusieurs pages
//initialisation du programme

//Dessin executé avec run
void setup()
{
//  PFont font
  size(400,400);
  //contours lisses
  smooth();
  //détermine combien d'images par secondes
  //paramétrer nombre images par seconde, fréquence d'execution
  //fonction et mot clé à la fois
  frameRate(50);
  //début d'enregistrement
  //beginRecord(PDF,"essai.pdf");

}

//Dessin executé avec un métronome par défaut 30 images par seconde
void draw()
{
//création d'une variable, case mémoire, type de donnée float 
//(nombre à virgule) rempi d'un nombre au hasard entre 0 et 50
  float rayon = random(200);
//transparence (entre 0 et 255) ex : 125,5 = 50 %
//fill(209,0,0,120);
fill(random(10),random(255),random(0),random(255));
  noStroke();
 //position en x de la souris et en y, variable selon le programme,le temps
 //ellipse(mouseX,mouseY,rayon,rayon);
 //pour un décalage/position souris
ellipse(mouseX,mouseY,rayon,rayon);
ellipse(400-mouseX,400-mouseY,rayon,rayon); 
ellipse(mouseX,400-mouseY,rayon,rayon); 
ellipse(400-mouseX,mouseY,rayon,rayon);
}
//capter les éléments utilisateurs
//fonction événementiel qd on appuie sur souris
void mousePressed()
{
//de la souris
  println("souris ! ");
//les dièses sont numéros, numérotation auto
 saveFrame("souris-####");

}

void exit()
{

//fin d'enregistrement en PDF
//endRecord();
//ferme la fenetre pour enregistrer
//super.exit(); 
}

