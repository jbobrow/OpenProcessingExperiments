
void setup() {
//taille de l'image
size(800,800);
//size(displayWidth, displayHeight);
// styling
smooth();
background(0);
// start in center
mouseX=width/2; mouseY=height/2;
}
void draw() {

float r = random(100);
//rayon du triangle aléatoire jusqu'à 100
fill(255,random(255),0,56);
stroke(random(148),0,255,90);
//couleur du contour
strokeWeight(3);
//épaisseur du contour
// draw ellipse
float x = mouseX;
float y = mouseY;
triangle(x, y, x+r/2, y+r, x+r, y);
//coordonnées des triangles
}


