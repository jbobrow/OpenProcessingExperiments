
ParticleSystem ps;
float angle;


void setup() {
  size(500, 500);
  colorMode(RGB,100); // Les valeurs varient entre 0 et 100 au lieu de 0 et 255
  background(255);
  noStroke();
  ps = new ParticleSystem ( new PVector (width/2, height/2), 100 );
  smooth();
  noFill();
}

void draw() {
  int espacey=(height-20)/10;// Détermine l'espace entre les lignes
  int espacex=(width-20)/10; // Détermine l'espace entre les lignes
  angle +=0.01; // vitesse de rotation

  //lignes horizontales
  for (int i=0;i<=11;i++) {
    stroke(255, 0, 0);
    line(10, 10+i*espacey, width-10, 10+i*espacey);
  }

  // lignes verticales
  for (int i=0;i<=11;i++) {
    stroke(0, 0, 255);
    line(10+i*espacex, 10, 10+i*espacex, height-10);
  }
  fill(0, 2);
  rect(0, 0, width, height);

  ps.update();
  
  pushMatrix(); // Début de la transformation des rectangles
  translate(width/2, height/2); // Déplacer au centre
  // Rotation carré jaune
  for (int i = 1 ; i<10 ; i++) {
    rotate(angle); 
    fill(#FCE000);
    rect(0, 0, 100, 100); // rectangle jaune
    fill(#82F03A);
    rect(0, 0, 80, 80); // rectangle vert
  }
  popMatrix(); // Fin de la transformation des rectangles
}


void mousePressed() {
  ps = new ParticleSystem ( new PVector (mouseX, mouseY), 100); 
}


