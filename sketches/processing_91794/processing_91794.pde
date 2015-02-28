
// mes variables x et y = positionnement de la souris
int x,y;

// fond noir où viennent s'inscrire les triangles sans contours
void setup(){
size (800,800);
background (0);
noStroke ();}

void draw () {}

//Je cherche à poser des triangles (de même taille) là où je clic avec ma souris,
//afin de faciliter la crétion de formes plus complexes (cf: mes précédents sketchs)
// PB: création non désirée d'une forme identique à chaque fois.
void mousePressed () {
x= mouseX;
y= mouseY;
fill (255, 70);
triangle(x,y,250, 48, 350, 200);}



