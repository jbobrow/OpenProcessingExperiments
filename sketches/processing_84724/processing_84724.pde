
void setup(){
// styling
smooth();
background(#190421);
size(800,800);
//taille du sketch
// start in center
mouseX=width/2; mouseY=height/2;
}
void draw() {
// rayon aléatoire
float r = random(100);
// couleur aléatoire

fill(250,random(61),23,70);
//couleur aléatoire
stroke(32,random(154),252);
//contour aléatoire
strokeWeight(2);
// épaisseur du contour aléatoire
float x = mouseX;
float y = mouseY;
float z = r/2;
//les triangles partent du centre.
//triangle(x-z,y-z,x,y+z,x+z,y-z);
triangle(x-z,y+z,x,y-z,x+z,y+z);
}






