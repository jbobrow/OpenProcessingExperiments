
float rads = 0.0; // angle de l'oscillation
float rayon = 100; // longueur du cable du pendule

void setup() {
  size(200,200);
  smooth();
  frameRate(30);
}


void draw() {
  background(255);
  
  rads += 0.075; // incrémenter l'angle de l'oscillation
  
  float oscillation = cos(rads) * (PI/4) + (PI/2); // calculer l'oscillation (toujours entre -1 et 1)
  
  
  // convertir les coordonnées polaires en coordonnées cartésiennes
  // et déplacer le point de référence au point 0,width/2
  float y = sin(oscillation) * rayon;
  float x = cos(oscillation) * rayon + width/2; 
  
  fill(0);
  stroke(0);
  line(width/2,0,x,y);
  ellipse(x,y,16,16);
}

