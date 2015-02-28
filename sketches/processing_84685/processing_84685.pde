
// sample code
void setup() {
// set window size
size(800,800);
//size(displayWidth, displayHeight);//taille du sketch
// styling
smooth();
background(#A3B2BC);
// start in center
mouseX=width/2; mouseY=height/2;
}
void draw() {
// random radius
float r = random(100);//les cercles vont avoir un rayon aléatoire jusqu'à 100
// random color
//fill(random(255),random(255),random(255));
fill(5,random(255),180,56);
stroke(255,99);
strokeWeight(5);//épaisseur de la ligne
// draw ellipse
ellipse(mouseX, mouseY, r, r);
}



