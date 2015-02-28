
int deplacementX, deplacementY; //variable de placement de la balle

int x, y; //axe du terrain

int w, z; //coordonnées de la raquette de gauche

int s, t; // coordonnées de la raquette de droite
 
void setup() // définition de l'environnement initiale
{
 size(500,500); // largueur et hauteur du terrain
 background(#F5DEB3); // couleur du terrain
 x = 250; //départs intiale de la balle sur l'axe des abscisses
 y = 250; // départs initiale de la balle sur l'axe des ordonnées
 deplacementX = 7; // vitesse de la balle 
 deplacementY = 7; // vitesse de la balle
 w = 2; // coordonnées de la raquette de gauche sur l'axe des abscisses
 z = 60; //coordonnées de la raquette de gauche sur l'axe des ordonnées
 s = 486; // coordonnées de la raquette de droite sur l'axe des abscisses
 t = 448; //coordonnées de la raquette de droite sur l'axe des ordonnées
}
void draw() // définition variable
{
 nettoyer();
 bouger();
 dessiner();
 }

void nettoyer() 
{  
background(); // fond du terrain
}
 
void dessiner() 
{
  fill(#F5DEB3);// couleur du cercle
  arc(250, 255, 130, 130, 0, 2*PI); // coordonnées de l'arc de cercle
  //smooth();
  fill(38,164,248); // couleur de la raquette
  rect(w,z,10,90); // coordonnées de la raquette à droite
  fill(#FF0000); // couleur de la raquette2
  rect(s,t,10,90); // coordonnées de la raquette à gauche
  fill(#008080);// couleur balle
  ellipse(x,y,10,10);
  line(250,0,250,500);// coordonnée de la ligne

}
void bouger() 
{
 x = x + deplacementX;
 y = y + deplacementY;
  
 z = (mouseY); // raquette= souris
 if (z>500-85) { // la raquette 1 ne sort pas du terrain
     z=500-85;
 }
if (keyPressed == true) { // joueur 2 joue avec le clavier
    if (key == 'z') {
        t=t-10;// vitesse de la raquette vers le bas
    }
    if (key == 'a') {
        t=t+10; //vitesse de la raquette vers le haut
    }
}
if (t>500-85) { // la raquette2 ne sort du terrain en bas
     t=500-85;
 }
if (t<2-2) { // la raquette2 ne sort pas du terrain en haut
     t=2+1;
 }
if (x > width) { // verifier rebondissement à gauche
   deplacementX = -5;
 }
  if (y > width) {      // verifier rebondissement en bas
   deplacementY = -3;
 }
  if (y < 0) {          // verifier rebondissement en haut
   deplacementY = 3;
 }
 if (x<w+20 && y>z && y<z+85) // collision balle/raquette souris
  {
   deplacementX = -deplacementX;
 }
 if (x>s-7 && y>t && y<t+85) // collision balle/raquette2 souris
  {
   deplacementX = -deplacementX;
 }
  if (x < 10) 
 {
  noLoop();
  println("t'es nul!!!!!!!!!");   
 }
 if (x > 490) 
 {
  noLoop();
  println("Au suivant");   
 }
 if (x > 490)
 {
 noLoop();
 println("1-0");
 }
 if (x < 10)
 {
 noLoop();
 println("0-1");
 }
}
