

// GRAVITÉ ET REBOND

// Valeur de gravité
float gravite = 0 ;

// Position de la balle
float x = 20 ;
float y = 20 ;

// Vitesses X et Y de la balle
float vx = 0 ;
float vy = 0 ;

// frottement
float frot = 0.9 ;

// Autre solution alternative
// Variable de force de rebond
// float r = -0.75 ;

void setup() {
size (800,500);
noStroke();
smooth();
fill(0,0,255,90);
}

void draw() {
  
  background (220) ;
  
  // Appliquer la gravité
  vy += gravite ;
  
  // Calcul des positions
  x += vx ;
  y += vy ;
  
  if (y > height-20) {
  // Remise à niveau du sol de l'objet :
  y = height-20 ;
  // Inversion du sens de la vitesse verticale
  vy = -vy ;
  // On applique le frottement à la vitesse verticale
  vy *= frot ;
  }
  
  // Dessin de la balle
  ellipse (x, y, 40, 40) ;
  
}

// L'impulsion est apportée par une action sur le clavier qui fournit une valeur à la vitesse x et à la gravité :
void keyPressed () {
if (key == '1') { vx = 1; gravite = 0.2; }
if (key == '2') { vx = 2; gravite = 0.2; }
if (key == '3') { vx = 3; gravite = 0.2; } 
}



