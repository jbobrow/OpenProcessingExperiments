
float x; //variable pour la largeur
float y; //varialbe de la hauter
int i; //variable pour 


// Fonction qui n'est appelee qu'au demarrage.
void setup() {
  size(400, 400); // La taille de la fenetre.
  frameRate(30); // Le nombre d'images par seconde.
  smooth(); // Lisser les formes dessinees.

  x = width/2;
  y = height/2;
}


// Fonction qui est appelee a chaque nouvelle image.
void draw() {
  background(127); // Remplir l'arriere-plan d'une teinte de gris.

  translate(x, y);

  //------------------------------- ÉPINE

  pushMatrix();
  translate(0, -30);
  for (int i = 0; i < 19; i++) {
    line(60, 0, 100, 0);
    stroke(0, 0, 0);
    rotate(radians(-10));
  }
  popMatrix();
  //------------------------------- FIN ÉPINE


  //--------------------------------- L'OEIL
  pushMatrix();
  stroke(10); // Orbite
  translate(0, -30);
  fill(55, 139, 22);
  ellipseMode(CENTER);
  ellipse(0, 0, 132, 134); // fin orbite
  popMatrix();

  pushMatrix();
  stroke(10); // arrière de l'oeil globe
  translate(0, -30);
  fill(55, 24, 237);
  ellipseMode(CENTER);
  ellipse(0, 0, 112, 114); // fin arrière de l'oeil
  popMatrix();

  pushMatrix();
  translate(0, -30);
  noStroke(); //début Iris
  for (int i=0;i<39;i=i+3) {
    fill(24+i, 237+i, 25+i);
    ellipse(0, 0, 39-i, 114-i);
  }//fin Iris
  popMatrix();

  pushMatrix();
  stroke(10); //début pupile
  fill(0, 0, 0);
  ellipseMode(CENTER);
  translate(0, -30);
  ellipse(0, 0, 5, 114); // fin pupile
  popMatrix();

  pushMatrix();
  noFill();// détail 1
  stroke(10); 
  ellipseMode(CENTER);
  translate(5, -3);
  ellipse(0, 0, 4, 5); //fin détail 1
  popMatrix();

  pushMatrix();
  noFill();//détail 2
  stroke(10); 
  ellipseMode(CENTER);
  translate(3, 0);
  ellipse(0, 0, 3, 3); //fin détail 2
  popMatrix();

  pushMatrix();
  noStroke(); //Début paupière
  fill(55, 139, 22);
  translate(0, -31);
  arc(0, 0, 120, 120, radians(200), radians(340)); //fin paupière sensé avoir CHORD
  popMatrix();

  //CIl 1
  pushMatrix();
  translate(-70, -115);
  noFill();
  stroke(10);
  beginShape();
  curveVertex(57.0, 84.0);
  curveVertex(46.0, 77.0);
  curveVertex(42.0, 66.0);
  curveVertex(44.0, 54.0);
  curveVertex(56.0, 46.0);
  endShape();
  popMatrix();

  //Cile 2
  pushMatrix();
  translate(-85, -120);
  noFill();
  stroke(10);
  beginShape();
  curveVertex(57.0, 84.0);
  curveVertex(46.0, 77.0);
  curveVertex(42.0, 66.0);
  curveVertex(44.0, 54.0);
  curveVertex(56.0, 46.0);
  endShape();
  popMatrix();

  //Cile 3
  pushMatrix();
  translate(-55, -110);
  noFill();
  stroke(10);
  beginShape();
  curveVertex(57.0, 84.0);
  curveVertex(46.0, 77.0);
  curveVertex(42.0, 66.0);
  curveVertex(44.0, 54.0);
  curveVertex(56.0, 46.0);
  endShape();
  popMatrix();

  //CILE 4
  pushMatrix();
  noFill();
  stroke(10);
  translate(-50, -103);
  beginShape();
  curveVertex(47, 34);
  curveVertex(58, 45);
  curveVertex(63, 57);
  curveVertex(60, 68);
  curveVertex(50, 78);
  endShape();
  popMatrix();

  //CILE 5
  pushMatrix();
  noFill();
  stroke(10);
  translate(-35, -107);
  beginShape();
  curveVertex(47, 34);
  curveVertex(58, 45);
  curveVertex(63, 57);
  curveVertex(60, 68);
  curveVertex(50, 78);
  endShape();
  popMatrix();


  //------------------ FIN DE L'OEIL 


  //------------------ DÉBUT CORP
  pushMatrix();
  fill(55, 139, 22); // Body 2
  stroke(10);
  translate(50, 22);
  ellipse(0, 0, 121, 29); //Fin body 2 
  popMatrix();

  pushMatrix();
  fill(55, 139, 22); // Body 1
  translate(-40, +35);
  ellipse(0, 0, 87, 66); //Fin body 1
  popMatrix();

  pushMatrix();
  fill(55, 139, 22); //corps 3
  translate(59, -49);
  ellipse(0, 0, 53, 53);//fin corps 3
  popMatrix();
  //-------------------- FIN CORP


  //---------------------- DÉBUT TENTACULE

  pushMatrix();
  fill(55, 139, 22);
  translate(-200, -200);
  beginShape();
  curveVertex(74.0, 108.0);
  curveVertex(119.0, 210.0);
  curveVertex(32.0, 331.0);
  curveVertex(178.0, 346.0);
  curveVertex(225.0, 331.0);
  curveVertex(52.0, 324.0);
  curveVertex(122.0, 237.0);
  curveVertex(158.0, 72.0);
  endShape();
  popMatrix();


  pushMatrix();
  translate(0, 0);
  beginShape(); //tentacul 2
  curveVertex(51.0, -44.0);
  curveVertex(79.0, 20.0);
  curveVertex(102.0, 48.0);
  curveVertex(81.0, 110.0);
  curveVertex(24.0, 127.0);
  curveVertex(32.0, 140.0);
  curveVertex(95.0, 111.0);
  curveVertex(109.0, 87.0);
  curveVertex(120.0, 46.0);
  curveVertex(105.0, 22.0);
  curveVertex(126.35443, 13.90503);
  endShape(); //Fin tentacul 2
  popMatrix();

  pushMatrix();
  translate(0, 0);
  beginShape(); // tentacul3
  curveVertex(51.0, 53.0);
  curveVertex(-64, 7.0);
  curveVertex(-95.0, -52.0);
  curveVertex(-111.0, -102.0);
  curveVertex(-155.0, -111.0);
  curveVertex(-118.0, -98.0);
  curveVertex(-111.0, -76.0);
  curveVertex(-99.0, -26.0);
  curveVertex(-84.0, 30.0);
  curveVertex(-46.0, 97.0);
  endShape(); //fintentacul
  popMatrix();

  //-----------------------------FIN TENTACULE


  //------------------- POT
  pushMatrix();
  fill(222, 96, 11); //Bordure
  stroke(10);
  translate(0, 0);
  quad(-69, 23, 71, 23, 71, 38, -69, 38); //Fin Bordure
  popMatrix();

  pushMatrix();
  fill(222, 96, 11); //pot
  stroke(10);
  translate(0, 0);
  quad(-62, 38, 64, 38, 34, 118, -32, 118); //Fin pot
  popMatrix();

  pushMatrix();
  translate(0, 0);
  beginShape(); //Début bouche
  stroke(10);
  fill(0, 0, 0);
  vertex(-28, 60);
  vertex(5, 70);
  vertex(33, 67);
  vertex(45, 65);
  vertex(19, 103);
  vertex(-22, 99);
  endShape(); //fin bouche
  popMatrix();

  pushMatrix();
  translate(0, 0);
  stroke(10); //Crake
  line(-28, 60, -38, 50); 
  line(-31, 58, -25, 48);
  line(-25, 48, -14, 54);//fin crack
  popMatrix();

  //---------------------- FIN POT


  //---------------------- BOUCHE


  pushMatrix();
  stroke(10); //dent haut 1
  fill(255, 255, 255);
  translate(-12, 85);
  rotate(radians(-90));
  arc(0, 0, 15, 15, radians(0), radians(180));
  popMatrix();

  pushMatrix();
  stroke(10); // dent haut 2
  fill(255, 255, 255);
  translate(5, 75);
  arc(0, 0, 15, 15, radians(0), radians(180)); 
  popMatrix();

  pushMatrix();
  stroke(10); // dent haut 3 
  fill(255, 255, 255);
  translate(22, 85);
  rotate(radians(90));
  arc(0, 0, 15, 15, radians(0), radians(180)); 
  popMatrix();

  pushMatrix();
  stroke(10); //dent bas 1
  fill(255, 255, 255);
  translate(5, 97);
  arc(0, 0, 15, 15, radians(-180), radians(0)); 
  //Fin dent bas 1
  popMatrix();

  //---------------------------FIN BOUCHE

  // ---------------------------FLEUR

  pushMatrix(); //p/tLE 1
  translate(45, -100);
  fill(245, 27, 147);
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix();//PETAL 2
  translate(100, -100);
  fill(245, 27, 147);
  rotate(radians(60));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); //petal 3
  translate(125, -55);
  fill(245, 27, 147);
  rotate(radians(120));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); // petale 4
  translate(100, -10);
  fill(245, 27, 147);
  rotate(radians(180));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); // petale 5
  translate(45, -10);
  fill(245, 27, 147);
  rotate(radians(240));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); // petale 5
  translate(20, -55);
  fill(245, 27, 147);
  rotate(radians(300));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  //coeur
  noStroke();
  translate(72, -55);
  for (int i=0;i<20;i=i+2) {
    fill(244-i, 245-i, 27-i);
    ellipse(0, 0, 20-i, 20-i );
  }
  //-------------------- FIN FLEUR
}
