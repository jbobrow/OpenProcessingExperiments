
float diametre;
float posX, posY;
float fade;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  diametre = 100; // J'assigne la valeur du diametre du cercle.
  posX = width*0.5; // position X du cercle.
  posY = height*0.5; // position Y du cercle.
  fade = 255;
}

void draw() {
  background(255);

  /* La distance entre la position actuelle du curseur
   et le centre du cercle. Updaté à chaque frame dû à la
   nature de draw() */
  float distance = dist(mouseX, mouseY, posX, posY);
  
  fill(0);
  text(distance, 5, 20);

  stroke(0);

  if(distance<diametre*0.5 && fade > 0){ // Si le curseur est dans le cercle et fade est > 0
    fade = fade - 20; // Enleve du vert et bleu (pour révéler plus de rouge)
  }
  if(distance>diametre*0.5 && fade < 255){ // Si le curseur est hors du cercle et fade < 255
    fade = fade + 20; // Ajoute du vert et du bleu (pour approcher vers le blanc)
  }
    
  fill(255,fade,fade);
  ellipse(posX, posY, diametre, diametre);
}
