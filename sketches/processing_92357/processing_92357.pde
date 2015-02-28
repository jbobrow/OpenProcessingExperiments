
int costard;
int timeStamp;
float x, y;
float largeurTete;
float hauteurTete;
float etat;
float rayures;
float yTete;
float diametre;
float rCourante, gCourante, bCourante;
float rCible, gCible, bCible;
float rVitesse, gVitesse, bVitesse;
float k, d;

////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(400, 400); 
  smooth();
  frameRate(30);
  rectMode(CENTER);
  ellipseMode(CENTER);
  timeStamp = millis();
  k = 0.5;
  d = 0.2;
  rayures = 0;
  diametre = 14;
  largeurTete = 200;
  hauteurTete = 100;
  x = width/2;
  y = height/5;
  yTete = y-10;
  costard = 0;
  etat = 0;
  rCible = 250;
  gCible = 250;
  bCible = 30;
  textSize(20);
}

////////////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  background(127);

  boolean sourisGaucheDeDroite = mouseX < x + largeurTete*0.5;
  boolean sourisDroiteDeGauche = mouseX > x - largeurTete*0.5;
  boolean sourisEnHautDuBas = mouseY > yTete - hauteurTete*0.5;
  boolean sourisEnBasDuHaut = mouseY < yTete + hauteurTete*0.5;

  ////////////////////////////////////////////////////////////////////////////////////////////////

  float distance = dist(mouseX, mouseY+70, width*0.5, height*0.5);


  if ((sourisGaucheDeDroite 
    && sourisDroiteDeGauche 
    && sourisEnBasDuHaut 
    && sourisEnHautDuBas) || (distance < diametre * 0.5)) {

    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////

  if (sourisGaucheDeDroite 
    && sourisDroiteDeGauche 
    && sourisEnBasDuHaut 
    && sourisEnHautDuBas) { 

    rVitesse = d * (rVitesse + k * (rCible - rCourante));
    rCourante = rCourante + rVitesse;
    gVitesse = d * (gVitesse + k * (gCible - gCourante));
    gCourante = gCourante + gVitesse;
    bVitesse = d * (bVitesse + k * (bCible - bCourante));
    bCourante = bCourante + bVitesse;
  }
  else {
    rCourante = 23;
    gCourante = 127;
    bCourante = 90;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////


  //Bras
  noStroke();
  fill(costard);
  beginShape();
  curveVertex(x-5, y);
  curveVertex(x-20, y+30);
  curveVertex(x-35, y+50);
  curveVertex(x-85, y+60);
  curveVertex(x-110, y+100);
  curveVertex(x-120, y+165);
  curveVertex(x-120, y+250);
  curveVertex(x-100, y+250);
  curveVertex(x-90, y+150);
  curveVertex(x-80, y+100);
  curveVertex(x-70, y+85);
  curveVertex(x-30, y+100);
  curveVertex(x, y+100);
  curveVertex(x+30, y+100);
  curveVertex(x+70, y+85);
  curveVertex(x+80, y+100);
  curveVertex(x+90, y+150);
  curveVertex(x+100, y+250);
  curveVertex(x+120, y+250);
  curveVertex(x+120, y+165);
  curveVertex(x+110, y+100);
  curveVertex(x+85, y+60);
  curveVertex(x+35, y+50);
  curveVertex(x+20, y+30);
  curveVertex(x+5, y);
  endShape();

  //Costard
  fill(costard);
  rect(x, y+185, 150, 200);

  //Ceinture
  fill(70, 36, 0);
  rect(x, y+250, 150, 20);

  //Boucle de Ceinture
  strokeWeight(2);
  stroke(155);
  fill(150, 85);
  rect(x, y+250, 18, 18);
  line(x, y+250, x+8, y+250);

  //Chemise
  fill(255);
  strokeWeight(3);
  stroke(70, 36, 0);
  beginShape();
  curveVertex(x-30, y+20);
  curveVertex(x-42, y+52);
  curveVertex(x, y+235);
  curveVertex(x+42, y+52);
  curveVertex(x+30, y+20);
  endShape();

  //col
  fill(255);
  noStroke();
  beginShape();
  curveVertex(x-5, y);
  curveVertex(x-20, y+30);
  curveVertex(x-35, y+50);
  curveVertex(x-0, y+60);
  curveVertex(x+35, y+50);
  curveVertex(x+20, y+30);
  curveVertex(x+5, y);
  endShape();

  //Cravate
  noStroke();
  fill(0);
  beginShape();
  vertex(x-2, y+55);
  vertex(x-15, y+190);
  vertex(x, y+200);
  vertex(x+15, y+190);
  vertex(x+2, y+55);
  endShape();

  //////////////////////ACTION LORSQUE CLIC NOEUD CRAVATE//////////////////////

  if (rayures == 0) {
    fill(160, 0, 0);
  }
  else { 
    if ( rayures == 1) {
      fill(random(50, 200), random(50, 200), random(50, 200));
    }
  }

  int tempsEcoule = millis() - timeStamp;

  if (tempsEcoule >=5000) {
    timeStamp = millis();
    rayures = 0;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////

  //RayuresCravate
  beginShape();
  vertex(x-3.5, y+70);
  vertex(x-4.5, y+80);
  vertex(x+4.5, y+80);
  vertex(x+3.5, y+70);
  endShape(CLOSE);

  beginShape();
  vertex(x-5.5, y+90);
  vertex(x-6.5, y+100);
  vertex(x+6.5, y+100);
  vertex(x+5.5, y+90);
  endShape(CLOSE);

  beginShape();
  vertex(x-7, y+110);
  vertex(x-8.5, y+120);
  vertex(x+8.5, y+120);
  vertex(x+7, y+110);
  endShape(CLOSE);

  beginShape();
  vertex(x-9, y+130);
  vertex(x-10.5, y+140);
  vertex(x+10.5, y+140);
  vertex(x+9, y+130);
  endShape(CLOSE);

  beginShape();
  vertex(x-11, y+150);
  vertex(x-12.5, y+160);
  vertex(x+12.5, y+160);
  vertex(x+11, y+150);
  endShape(CLOSE);

  beginShape();
  vertex(x-13, y+170);
  vertex(x-14.5, y+180);
  vertex(x+14.5, y+180);
  vertex(x+13, y+170);
  endShape(CLOSE);

  beginShape();
  vertex(x-15, y+190);
  vertex(x, y+200);
  vertex(x+15, y+190);
  endShape(CLOSE);

  //napkins
  stroke(0);
  triangle(x+45, y+90, x+55, y+75, x+55, y+90);
  triangle(x+50, y+90, x+65, y+70, x+65, y+100);

  //PocheCostard
  noStroke();
  fill(150);
  rect(x+55, y+100, 25, 25);
  ellipse(x+55, y+110, 25, 15);

  //NoeudCravate
  fill(150);
  ellipse(x, y+50, diametre, diametre);

  //tête
  fill(33, 177, 100);
  strokeWeight(3);
  stroke(20, 153, 75);
  rect(x, yTete, largeurTete, hauteurTete);

  ////////////////////////////////////////////////////////////////////////////////////////////////

  // Signes $ statiques

  if (etat == 0) {
    for (int i=3; i<=190; i+=15) {
      fill(23, 127, 90, i*1.2);

      for (int j = 0; j<100; j+=40) {
        text("$", (x-98)+i, y+38-j);
      }
    }

    for (int i=3; i<=190; i+=15) {
      fill(23, 127, 90, i*1.2);

      for (int j = 0; j<80; j+=40) {
        text("$", (x+88)-i, y+18-j);
      }
    }
  } 
  else { 

    if (etat == 1) {

      // Signes $ qui flashent
      for (int i=3; i<=190; i+=15) {
        fill(250, 250, 30, sin(frameCount*0.1+i*0.1)*100+100);

        for (int j = 0; j<100; j+=40) {
          text("$", (x-98)+i, y+38-j);
        }
      }

      for (int i=3; i<=190; i+=15) {
        fill(250, 250, 30, sin(frameCount*0.1+i*0.1)*100+100);

        for (int j = 0; j<80; j+=40) {
          text("$", (x+88)-i, y+18-j);
        }
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////

  // Signes $ qui deviennent jaunes en mouseover
  if (etat == 0) {
    if (sourisGaucheDeDroite 
      && sourisDroiteDeGauche 
      && sourisEnBasDuHaut 
      && sourisEnHautDuBas) {

      for (int i=3; i<=190; i+=15) {
        fill(rCourante, gCourante, bCourante, i*1.2);

        for (int j = 0; j<100; j+=40) {
          text("$", (x-98)+i, y+38-j);
        }
      }

      for (int i=3; i<=190; i+=15) {
        fill(rCourante, gCourante, bCourante, i*1.2);

        for (int j = 0; j<80; j+=40) {
          text("$", (x+88)-i, y+18-j);
        }
      }
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

void mousePressed() {

  //Signes $ qui bougent lorsque clic dans la tête  
  boolean sourisGaucheDeDroite = mouseX < x + largeurTete*0.5;
  boolean sourisDroiteDeGauche = mouseX > x - largeurTete*0.5;
  boolean sourisEnHautDuBas = mouseY > yTete - hauteurTete*0.5;
  boolean sourisEnBasDuHaut = mouseY < yTete + hauteurTete*0.5;

  float distance = dist(mouseX, mouseY+70, width*0.5, height*0.5);

  if (sourisGaucheDeDroite 
    && sourisDroiteDeGauche 
    && sourisEnBasDuHaut 
    && sourisEnHautDuBas) {

    if ( etat == 0) {
      etat = 1;
    } 
    else {
      if (etat == 1) {
        etat = 0;
      }
    }
  }

  if ( rayures == 0 && distance < diametre * 0.5) {
    rayures = 1;
  } 
  else {
    if (rayures == 1 && distance < diametre * 0.5) {
      rayures = 0;
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
