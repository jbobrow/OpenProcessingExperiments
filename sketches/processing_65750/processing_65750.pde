
// 1 rotation + 1 satellite en 2D

float angle = 0.0; // Valeur d'angle dont on se sert pour positionner l'objet final
float ampli = 200; // Amplitude du mouvement (Rayon)
float speed = 0.05; // Vitesse d'oscillation

void setup() {
size (800,800,P2D);
smooth();
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);

}

void draw() {

background(255);

// On déplace le crayon au centre de l'écran :
translate(400,400);

// Calculs par angle et rayon de la position de rotation de l'objet :
float x = cos(angle) * ampli;
float y = sin(angle) * ampli;

// On déplace le crayon en x et y en fonction des résultats trigonométriques :
translate(x,y);

// On dessine l'objet :
fill(255,0,0,90);
ellipse(0,0,150,150);

// Depuis cette position de rotation, on applique un nouveau déplacement du crayon
// pour mettre en rotation le second objet autour du 1er :
translate(cos(angle*3) * 200,sin(angle*3) * 200); // Un satellite tourne toujours plus vite que sa planête, d'où le facteur 3
fill(0,255,0,90);
ellipse(0,0,150,150);

// Additions sur la valeur d'angle pour la trigonométrie :
angle += speed ;

}

