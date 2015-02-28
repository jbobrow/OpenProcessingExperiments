
// 1 spirale

float angle = 0.0; // Valeur d'angle dont on se sert pour positionner l'objet final
float ampli = 0; // Amplitude du mouvement (Rayon)
float speed = 0.05; // Vitesse d'oscillation

// CHANGEMENT :
int spirale = 1 ; // Décalage progressif créant un mouvement spiralée

void setup() {
size (800,800,P2D);
smooth();
noFill(); // CHANGEMENT
rectMode(CENTER);
ellipseMode(CENTER);

// On déplace le background dans setup
background(0) ;

}

void draw() {

// On déplace le crayon au centre de l'écran :
translate(400,400);

// Calculs par angle et rayon de la position de rotation de l'objet :
float x = cos(angle) * ampli;
float y = sin(angle) * ampli;

// On déplace le crayon en x et y en fonction des résultats trigonométriques :
translate(x,y);

// On dessine l'objet :
stroke(255,0,0,90); // CHANGEMENT
ellipse(0,0,150,150);

// Depuis cette position de rotation, on applique un nouveau déplacement du crayon
// pour mettre en rotation le second objet autour du 1er :
translate(cos(angle*3) * 200,sin(angle*3) * 200); // Un satellite tourne toujours plus vite que sa planête, d'où le facteur 3
stroke(0,255,0,90); // CHANGEMENT
ellipse(0,0,150,150);

// Additions sur la valeur d'angle pour la trigonométrie :
angle += speed ;

// CHANGEMENT :
// Le rayon augmente petit à petit et décale l'objet du centre :
ampli += spirale ;

}

