
//Julie Tellier TP3 simulation
//TP3 simulation de ce que tu veux bien t'imaginer
//Merci à Florence Labelle & Evelyne Dufrese pour leur aide
 
 
//tableau
Goutte[] gouttes = new Goutte[500] ;
 
 
 
void setup() {
size(400,400);  //taille écran

 
 
 
smooth();  //lissage
//boucle imbriquées
for (int i = 0; i < gouttes.length; i++) {
gouttes[i] = new Goutte(color(i*2),0,i*2,i/20.0);
}
}
 
void draw() {
  background(0);
  //boucles imbriquées
for (int i = 0; i < gouttes.length; i++) {
gouttes[i].move();
gouttes[i].display();

}
}
 
//déclaration variable
class Goutte {
color c;
float xpos;
float ypos;
float yspeed;
 
Goutte(color c_, float xpos_, float ypos_, float yspeed_) {
c = c_;
xpos = xpos_;
ypos = ypos_;         //vitesse défilement
yspeed = yspeed_;
}
//déplacement de haut en bas sur l'axe des y
 
void display() {
stroke(0);
fill(c);
ellipse(ypos,xpos,40,30);
 
 
}      //déplacement
void move() {
xpos = xpos + yspeed;
if (xpos > width) {
xpos = 0;
}
 
}
}


