
// Appliquer une oscillation à nos objets

// Voici une variable de vitesse pour appliquer des rotations dans un second temps :
float rythme = 0.0;

// En trigonométrie, on situe un point non pas à l'aide de
// coordonnées cartésiennes mais à l'aide d'un angle et d'un rayon
// relatifs à un point d'origine

float angle = 0.0; // Valeur d'angle dont on se sert pour positionner l'objet final
float pos = 200; // Décalage en y pour positionner le point d'origine
float ampli = 80; // Amplitude du mouvement (Rayon)
float speed = 0.05; // Vitesse d'oscillation

void setup() {
size (800,400,P3D);
smooth();
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);

}

void draw() {

background(255);

// Opérations trigonométriques sur les variables qui serviront
// à positionner en hauteur nos figures :
float y1 = pos + sin(angle) * ampli; 
float y2 = pos + sin(angle + 1) * ampli;
float y3 = pos + sin(angle + 2) * ampli;

// Dessin de 3 formes avec des formules quasi identiques mais en déplaçant le crayon à l'aide de la méthode translate :

translate(200,0); // On décale (additionne les décalages) sur l'axe x
pushMatrix(); // On enregistre la position du crayon.
translate(0,y1); // On déplace le crayon en hauteur en fonction des résultats trigonométriques
fill(255,0,0,90);
rotateX(rythme);
rect(0,0,150,150);
popMatrix(); // Retour à la position précédente et enregistrée du crayon.

translate(200,0);
pushMatrix();
translate(0,y2);
fill(0,255,0,90);
rotateY(rythme);
ellipse(0,0,150,150);
popMatrix();

translate(200,0);
pushMatrix();
translate(0,y3);
fill(0,0,255,90);
rotateZ(rythme);
rect(0,0,150,150);
popMatrix();

// Additions sur la valeur de rotation :
rythme += 0.02;
// Additions sur la valeur d'angle pour la trigonométrie :
angle += speed ;

}

