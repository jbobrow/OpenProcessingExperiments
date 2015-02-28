
/*Erstelle einen Sketch mit RGB Farbe und einfachen Formen. 
 Verwende dafür die Funktionen setup() und draw(). Gestalte den 
 Sketch dynamisch, indem Du mit mouseX, mouseY die Position 
 und/oder die Farbe änderst.*/

void setup() {
  size(600, 600);
  smooth();
  background(255);
  colorMode(RGB, 255, 255, 255, 100);
}

void draw() {
  //erzeugt Transparenz der Fliege
  fill(255, 255, 255, 20); 
  rectMode(CORNER);
  rect(0, 0, 600, 600);

  //Hut
  noStroke();
  fill(88, 88, 87);
  ellipseMode(CENTER);
  ellipse(300, 210, 226, 45);
  fill(34, 34, 33);
  ellipse(293, 210, 212, 42);
  rectMode(CENTER);
  rect(300, 142, 152, 136);
  fill(88, 88, 87);
  ellipse(300, 74, 152, 26);
  fill(34, 34, 33);
  ellipse(294, 74, 140, 26);

  //Körper
  noStroke();
  fill(106, 114, 58);
  ellipse(300, 423, 320, 220);

  //linkes Bein
  translate (150, 456); //verschiebt das Koordinatensystem auf den Mittelpunkt des zu rotierenden Objektes
  rotate(radians(-45)); //dreht das Objekt um den angegebenen Winkel
  ellipse(0, 0, 117, 160);
  rotate(radians(+45)); //dreht das Objekt wieder auf seinem Ursprung
  translate(-150, -456); //verschiebt das Koordinatensystem auf seinem Ursprung

  //rechtes Bein
  translate (450, 456);
  rotate(radians(45));
  ellipse(0, 0, 117, 160);
  rotate(radians(-45));
  translate(-450, -456);

  noFill();
  strokeWeight(6);
  stroke(81, 92, 54);
  arc(139, 455, 50, 50, TWO_PI-PI/2, TWO_PI);
  arc(460, 455, 50, 50, PI, TWO_PI-PI/2);

  //Bauch
  noStroke();
  fill(81, 92, 54);
  ellipse(300, 435.5, 284, 195);
  fill(64, 72, 42);
  ellipse(300, 444, 258, 178);

  //Krawatte
  fill(222, 151, 76);
  quad(300, 412, 305, 424, 300, 436, 295, 424);
  quad(300, 425, 316, 461, 300, 497, 284, 461);

  //Füße
  fill(106, 114, 58);
  strokeWeight(4);
  stroke(81, 92, 54);
  ellipse(114, 518, 30, 30);
  ellipse(144, 518, 30, 30);
  ellipse(174, 518, 30, 30);
  ellipse(212, 524, 28, 28);
  ellipse(246, 524, 28, 28);
  ellipse(280, 524, 28, 28);
  ellipse(320, 524, 28, 28);
  ellipse(354, 524, 28, 28);
  ellipse(388, 524, 28, 28);
  ellipse(426, 518, 30, 30);
  ellipse(456, 518, 30, 30);
  ellipse(486, 518, 30, 30);

  //Kopf
  noStroke();
  fill(106, 114, 58);
  ellipse(300, 330, 300, 180);
  ellipse(208, 322, 136, 95);
  ellipse(392, 322, 136, 95);
  ellipse(244, 258, 148, 105);
  ellipse(356, 258, 148, 105);

  //Augen
  fill(255);
  ellipse(238, 256, 110, 74);
  ellipse(362, 256, 110, 74);
  fill(131, 76, 46);
  ellipse(238, 256, 64, 74);
  ellipse(362, 256, 64, 74);
  fill(238, 194, 42);
  ellipse(238, 256, 48, 74);
  ellipse(362, 256, 48, 74);
  fill(0);
  ellipse(238, 256, 15, 74);
  ellipse(362, 256, 15, 74);
  fill(106, 114, 58);
  ellipse(238, 220, 80, 22);
  ellipse(362, 220, 80, 22);

  //Maul
  fill(0);
  ellipse(300, 360, 180, 100);
  ellipse(258, 402, 14, 34);
  ellipse(262, 420, 7, 44);
  ellipse(277, 410, 7, 16);

  //Zähne
  fill(255); 
  triangle(252, 328, 268, 328, 260, 362);
  triangle(332, 328, 348, 328, 340, 362);

  fill(106, 114, 58); 
  ellipse(300, 320, 180, 40);

  //Nase
  fill(70, 79, 46);
  stroke(238, 194, 42);
  strokeWeight(1);
  ellipse(282, 308, 10, 16);
  ellipse(318, 308, 10, 16);

  //Warzen
  noStroke();
  fill(81, 92, 54);
  ellipse(157, 300, 26, 26);
  ellipse(90, 416, 20, 20);
  ellipse(362, 393, 20, 24);
  ellipse(428, 320, 24, 24);
  ellipse(502, 408, 32, 30);
  fill(106, 114, 58);
  ellipse(160, 300, 26, 26);
  ellipse(94, 416, 20, 20);
  ellipse(360, 395, 20, 24);
  ellipse(431, 320, 24, 24);
  ellipse(499, 410, 32, 30);
  fill(238, 194, 42, 20);
  ellipse(158, 300, 9, 7);
  ellipse(170, 308, 14, 16);
  ellipse(92, 416, 8, 14);
  ellipse(365, 394, 7, 9);
  ellipse(437, 312, 10, 16);
  ellipse(486, 404, 17, 18);
  ellipse(502, 410, 11, 8);

  //Fliege
  drawFliege();
}

//Fliege
void drawFliege() {  
  pushMatrix();
  translate (mouseX, mouseY);
  rotate(radians(-10)); 
  fill(mouseX, mouseY, mouseX, mouseY); //(191, 4, 89);
  ellipse(0, 0, 16, 24);
  fill(124, 185, 170, 20); //Flügel
  ellipse(0+18, 0+1, 32, 14); //(358, 380, 32 , 14);
  ellipse(0-18, 0+1, 32, 14); //(394, 380, 32, 14);
  stroke(255, 255, 255, 60);
  point(0+4, 0+1); //(372, 380);
  point(0-4, 0+1); //(380, 380);
  popMatrix();
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

