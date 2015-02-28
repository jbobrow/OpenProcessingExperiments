


void setup() {
  size(640, 360); //x, y
}

void draw() {

  background (124, 188, 174); //hellblau

  scale(1.9*0.5);

  noStroke();

  //Hase, Ohren, außen
  fill(36, 67, 88); //dunkelblau
  ellipse (580, 280, 30, 80);
  fill(198, 37, 43, 60); //rot
  ellipse (580, 280, 30, 80);

  fill(36, 67, 88); //dunkelblau
  ellipse (550, 280, 25, 75);
  fill(198, 37, 43, 60); //rot
  ellipse (550, 280, 25, 75);

  //Hase, Kopf
  fill(36, 67, 88); //dunkelblau
  ellipse (560, 330, 60, 60);
  fill(198, 37, 43, 60); //rot
  ellipse (560, 330, 60, 60);

  fill(36, 67, 88); //dunkelblau
  ellipse (550, 335, 60, 50);
  fill(198, 37, 43, 60); //rot
  ellipse (550, 335, 60, 50);

  //Hase, Ohren, innen
  fill (240, 212, 175); //beige
  ellipse (580, 295, 15, 40);
  fill(198, 37, 43, 60); //rot
  ellipse (580, 295, 15, 40);

  //Hase, Auge
  fill(240, 212, 175); //beige
  ellipse (555, 325, 30, 30);
  fill(36, 67, 88); //dunkelblau
  ellipse (550, 323, 20, 20);

  fill(36, 67, 88); //dunkelblau
  ellipse (555, 345, 30, 30);
  fill(198, 37, 43, 60); //rot
  ellipse (555, 345, 30, 30);

  //Hase, Nase
  fill (240, 212, 175); //beige
  ellipse (520, 330, 8, 9);
  fill(198, 37, 43, 60); //rot
  ellipse (520, 330, 8, 9);


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

  //Ei
  fill(240, 212, 175); //beige
  ellipse (350, 290, 40, 50);

  //Ei, Bemalung

  fill(198, 37, 43, 150); //rot
  ellipse(350, 267, 4, 3);

  fill(36, 67, 88); //dunkelblau
  ellipse(361, 272, 4, 4);
  ellipse(355, 270, 4, 4);
  ellipse(350, 272, 4, 4);
  ellipse(345, 270, 4, 4);
  ellipse(339, 272, 4, 4);
  fill(198, 37, 43, 150); //rot
  ellipse(361, 272, 4, 4);
  ellipse(355, 270, 4, 4);
  ellipse(350, 272, 4, 4);
  ellipse(345, 270, 4, 4);
  ellipse(339, 272, 4, 4);

  fill(36, 67, 88); //dunkelblau
  ellipse(365, 276, 2, 2);
  ellipse(360, 276, 2, 2);
  ellipse(355, 276, 2, 2);
  ellipse(350, 276, 2, 2);
  ellipse(345, 276, 2, 2);
  ellipse(340, 276, 2, 2);
  ellipse(335, 276, 2, 2);

  fill(74, 139, 135, 200); //mittelblau
  ellipse(366, 281, 3, 3);
  ellipse(361, 281, 4, 4);
  ellipse(356, 281, 3, 3);
  ellipse(351, 281, 4, 4);
  ellipse(346, 281, 3, 3);
  ellipse(341, 281, 4, 4);
  ellipse(336, 281, 3, 3);

  fill(198, 37, 43); //rot
  ellipse(366, 286, 7, 4);
  ellipse(358, 288, 7, 4);
  ellipse(350, 286, 7, 4);
  ellipse(342, 288, 7, 4);
  ellipse(334, 286, 7, 4);

  fill(198, 37, 43, 180); //rot
  ellipse(366, 294, 3, 8);
  ellipse(358, 295, 3, 8);
  ellipse(350, 295, 3, 8);
  ellipse(342, 295, 3, 8);
  ellipse(334, 294, 3, 8);
  fill(124, 188, 174, 180); //hellblau
  ellipse(366, 294, 3, 8);
  ellipse(358, 295, 3, 8);
  ellipse(350, 295, 3, 8);
  ellipse(342, 295, 3, 8);
  ellipse(334, 294, 3, 8);
  fill(198, 37, 43, 50); //rot
  ellipse(362, 294, 3, 8);
  ellipse(354, 295, 3, 8);
  ellipse(346, 295, 3, 8);
  ellipse(338, 294, 3, 8);
  fill(36, 67, 88, 50); //dunkelblau
  ellipse(362, 294, 3, 8);
  ellipse(354, 295, 3, 8);
  ellipse(346, 295, 3, 8);
  ellipse(338, 294, 3, 8);

  fill(36, 67, 88); //dunkelblau
  ellipse(365, 302, 3, 3);
  ellipse(359, 302, 3, 3);
  ellipse(353, 302, 3, 3);
  ellipse(347, 302, 3, 3);
  ellipse(341, 302, 3, 3);
  ellipse(335, 302, 3, 3);
  fill(240, 212, 175, 60); //beige
  ellipse(365, 302, 3, 3);
  ellipse(359, 302, 3, 3);
  ellipse(353, 302, 3, 3);
  ellipse(347, 302, 3, 3);
  ellipse(341, 302, 3, 3);
  ellipse(335, 302, 3, 3);

  fill(198, 37, 43); //rot
  ellipse(361, 307, 5, 5);
  ellipse(354, 307, 5, 5);
  ellipse(347, 307, 5, 5);
  ellipse(340, 307, 5, 5);
  fill(240, 212, 175, 150); //beige
  ellipse(361, 307, 5, 5);
  ellipse(354, 307, 5, 5);
  ellipse(347, 307, 5, 5);
  ellipse(340, 307, 5, 5);

  fill(36, 67, 88); //dunkelblau
  ellipse(356, 312, 3, 3);
  ellipse(351, 312, 3, 3);
  ellipse(346, 312, 3, 3);

  //Huhn, Schnabel
  fill(240, 212, 175); //beige
  ellipse (255, 180, 40, 25);
  ellipse (254, 200, 20, 10);
  fill(198, 37, 43, 180); //rot
  ellipse (255, 180, 40, 25);
  ellipse (254, 200, 20, 10);

  //Huhn, Kamm
  fill(198, 37, 43); //rot
  ellipse (285, 100, 28, 60);
  ellipse (310, 90, 28, 70);
  ellipse (335, 100, 28, 40);

  //Huhn, Schwanzfedern
  fill(198, 37, 43); //rot
  ellipse (450, 90, 40, 80);
  ellipse (480, 100, 40, 50);
  ellipse (480, 130, 50, 30);

  //Huhn, Beine
  strokeWeight(8);
  stroke(240, 212, 175); //beige
  line(295, 310, 350, 200); //x1, y1, x2, y1
  line(350, 200, 410, 310);
  strokeWeight(8);
  stroke(198, 37, 43, 180); //rot
  line(295, 310, 350, 200);
  line(350, 200, 410, 310);

  //Huhn, Körper
  noStroke();
  fill(240, 212, 175); //beige
  arc(340, 107, 260, 290, 0, HALF_PI); //x, y, weite, höhe, start, stop
  fill(198, 37, 43, 80); //rot
  arc(340, 107, 260, 290, 0, HALF_PI);

  //Huhn, Kopf
  fill(240, 212, 175); //beige
  ellipse (325, 180, 150, 150);
  fill(198, 37, 43, 40); //rot
  ellipse (325, 180, 150, 150);

  //Huhn, Auge, offen
  fill(240, 212, 175); //beige
  ellipse (310, 170, 80, 80);
  fill(36, 67, 88); //dunkelblau
  ellipse (310, 185, 45, 45);

  //Huhn, Füße
  fill(240, 212, 175); //beige
  rect (270, 310, 50, 10, 10); //x, y, weite, höhe, runde Ecken
  fill(198, 37, 43, 180); //rot
  rect (270, 310, 50, 10, 10); //x, y, weite, höhe, runde Ecken

  fill(240, 212, 175); //beige
  rect (384, 310, 50, 10, 10); //x, y, weite, höhe, runde Ecken
  fill(198, 37, 43, 180); //rot
  rect (384, 310, 50, 10, 10); //x, y, weite, höhe, runde Ecken
  
  float QUARTER_PI = PI/4;
  
  //Huhn, Flügel
  fill(240, 212, 175); //beige
  arc(403, 160, 80, 110, 0, PI+QUARTER_PI); //x, y, weite, höhe, start, stop, mode
  fill(198, 37, 43, 125); //rot
  arc(403, 160, 80, 110, 0, PI+QUARTER_PI);
}

