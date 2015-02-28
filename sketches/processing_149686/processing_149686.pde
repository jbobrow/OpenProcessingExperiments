
float angle = 22.5; // angolo da cui parte il circolo
float offset = 380; //imposta il centro del circolo
float scalar = 405; //imposta il raggio del circolo
float speed = 0.002; // velocità con cui ruota l'elisse

void setup() {
  size(760, 400);
  noStroke();
}

void draw() {
   background(255, 213, 121);  // lo sfondo in draw imprime il colore a ogni frame
   fill(250, 171, 121); // il sole
   noStroke();
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse( x, y, 75, 75);
  angle += speed;
  
  
  fill(99, 131, 175); // il mare
  rect(-1, 120, 761, 401);
 
 
randomSeed(0); // funzione random, numero e misure a caso
  for(int i = -60; i < width + 10; i += 120) {
    float scalar = random(0.20, 1.8); // imposta la grandezza
    boat(i, 120, scalar);
  }
}

void boat(int x, int y, float s) {
  fill(191, 31, 90);
  pushMatrix(); // crea una matrice
  translate(x, y); // copia la matrice
  scale(s);  // imposta la misura
  stroke(0);
 beginShape(); //crea una nuova forma unendo più vertici
vertex(69, 40);
vertex(69, 100);
vertex(30, 100);
vertex(50, 130);
vertex(110, 130);
vertex(130, 100);
vertex(70, 100);
vertex(70, 80);
vertex(120, 80);
vertex(70, 10);
vertex(60, 40);
vertex(69, 40);
endShape();
  popMatrix();
}

