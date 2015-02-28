
void setup() {
  size(640, 360); //x, y
}

void draw() {
  
  background (124, 188, 174);

  scale(1.9*0.5);

  noStroke();

  //Hase, Ohren, außen
  fill(36, 67, 88); //dunkelblau
  ellipse (535, 200, 30, 80);
  fill(198, 37, 43, 60); //rot
  ellipse (535, 200, 30, 80);

  fill(36, 67, 88); //dunkelblau
  ellipse (505, 200, 25, 75);
  fill(198, 37, 43, 60); //rot
  ellipse (505, 200, 25, 75);

  //Hase, Kopf
  fill(36, 67, 88); //dunkelblau
  ellipse (515, 250, 60, 60);
  fill(198, 37, 43, 60); //rot
  ellipse (515, 250, 60, 60);

  fill(36, 67, 88); //dunkelblau
  ellipse (505, 255, 60, 50);
  fill(198, 37, 43, 60); //rot
  ellipse (505, 255, 60, 50);

  //Hase, Ohren, innen
  fill (240, 212, 175); //beige
  ellipse (535, 215, 15, 40);
  fill(198, 37, 43, 60); //rot
  ellipse (535, 215, 15, 40);

  //Hase, Auge
  fill(240, 212, 175); //beige
  ellipse (510, 245, 30, 30);
  fill(36, 67, 88); //dunkelblau
  ellipse (505, 248, 20, 20);

  //Hase, Nase
  fill (240, 212, 175); //beige
  ellipse (475, 250, 8, 9);
  fill(198, 37, 43, 60); //rot
  ellipse (475, 250, 8, 9);

  //Hase, Körper
  fill(36, 67, 88); //dunkelblau
  ellipse (515, 380, 80, 220);
  fill(198, 37, 43, 60); //rot
  ellipse (515, 380, 80, 220);

  //Hase, Arm
  fill(36, 67, 88); //dunkelblau
  ellipse (460, 292, 100, 30);
  fill(198, 37, 43, 60); //rot
  ellipse (460, 292, 100, 30);

  //Boden
  fill (240, 212, 175); //r, g, b, alpha //beige
  ellipse (350, 400, 800, 150); //x, y, Breite, Höhe
  fill(74, 139, 135, 200); //mittelblau
  ellipse (350, 400, 800, 150); //x, y, Breite, Höhe

  //Nest
  fill(36, 67, 88); //dunkelblau
  ellipse (350, 325, 200, 80);
  fill(198, 37, 43, 50); //rot
  ellipse (350, 325, 200, 80);
  fill(240, 212, 175, 150); //beige
  ellipse (350, 325, 200, 80);

  //Huhn, Schnabel
  fill(240, 212, 175); //beige
  ellipse (255, 240, 40, 25);
  //ellipse (154, 258, 20, 10);
  fill(198, 37, 43, 180); //rot
  ellipse (255, 240, 40, 25);
  //ellipse (154, 258, 20, 10);

  //Huhn, Kamm
  fill(198, 37, 43); //rot
  ellipse (285, 160, 28, 60);
  ellipse (310, 150, 28, 70);
  ellipse (335, 160, 28, 40);

  //Huhn, Schwanzfedern
  fill(198, 37, 43); //rot
  ellipse (450, 150, 40, 80);
  ellipse (480, 160, 40, 50);
  ellipse (480, 190, 50, 30);

  //Huhn, Körper
  fill(240, 212, 175); //beige
  arc(340, 167, 260, 290, 0, HALF_PI); //x, y, weite, höhe, start, stop
  fill(198, 37, 43, 80); //rot
  arc(340, 167, 260, 290, 0, HALF_PI);

  //Huhn, Kopf
  fill(240, 212, 175); //beige
  ellipse (325, 240, 150, 150);
  fill(198, 37, 43, 40); //rot
  ellipse (325, 240, 150, 150);

  //Huhn, Auge, offen
  fill(240, 212, 175); //beige
  ellipse (310, 230, 80, 80);
  fill(36, 67, 88); //dunkelblau
  ellipse (298, 230, 30, 30);

  //Fuß
  fill(240, 212, 175); //beige
  rect (310, 310, 70, 10, 10); //x, y, weite, höhe, runde Ecken
  fill(198, 37, 43, 180); //rot
  rect (310, 310, 70, 10, 10); //x, y, weite, höhe, runde Ecken
  
  float QUARTER_PI = PI/4;
  //Huhn, Flügel
  fill(240, 212, 175); //beige
  arc(403, 220, 80, 110, 0, PI+QUARTER_PI); //x, y, weite, höhe, start, stop, mode
  fill(198, 37, 43, 125); //rot
  arc(403, 220, 80, 110, 0, PI+QUARTER_PI);
}

