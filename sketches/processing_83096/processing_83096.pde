
Carre[] monTableauDecarre = new Carre [1600];
int espace = 15;
float t= 0;
void setup() {
size(600, 600);
rectMode(CENTER);
translate(5, 5);
background(#FFFFFF);
int id = 0;
for (int i=0; i<width/espace; i++) {
for (int j=0; j<height/espace; j++) {
monTableauDecarre[id] = new Carre(espace/2 + i * espace, espace/2 + j*espace);
id++;
}
}
}
void draw() {
for (int i=0; i<monTableauDecarre.length; i++) { 
monTableauDecarre[i].afficher();
}
}
class Carre {
//propriété de la class
float X, Y, taille=5, tailleMax=15;
float tailleCrayon; 
float R, V, B;
float radius;
Carre(float _X, float _Y) {
background(0);
tailleCrayon = random(2);
R=0;
V=random(10,200);
B=random(100,200);
X=_X;
Y=_Y;
radius=0;
}
void afficher () {
pushMatrix();
fill(R,V,B);
taille= taille+0.1;
translate(X, Y);
float _taille=random(taille);
rect(0, 0, _taille, _taille,radius);
strokeWeight(random(tailleCrayon));
scale(random(taille/100));
popMatrix();
if (taille>tailleMax) {
taille=-taille;
}

if (mousePressed){
radius=10; 
}
}
// void transformer ( float _contour, float _echelle) { // dans la fonction le carré change de taille
// fill(#FFFFFF);
// stroke(random(10));
// strokeWeight(_contour);
// scale(_echelle);
// translate(x * 50, y *50);
// }
}


