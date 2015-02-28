
// Dessiner des volumes et les manipuler avec la souris :

// Variables de rotation :
float rot_x = 0.0;
float rot_z = 0.0;

void setup() {
size(600,600,P3D);
smooth();
stroke(0);
}

void draw() {
background(255);

// On place le crayon :
translate (width/2,height/2);
// On applique une rotation à la feuille de papier :
rotateX(rot_x);
rotateZ(rot_z);
// Dessin :
fill(0,255,0,75);
box(200,200,200);

/*
// Avec une sphère, c'est possible aussi :
translate (width/2,height/2);
rotateX(rot_x);
rotateZ(rot_z);
fill(0,0,255,75);
sphere(200);
*/

}

void mouseDragged() {
float reduire = 0.01;
rot_x += (pmouseY-mouseY) * reduire; // En se déplaçant verticalement, la rotation s'effectue sur l'axe horizontale x.
rot_z += (mouseX-pmouseX) * reduire;
}

