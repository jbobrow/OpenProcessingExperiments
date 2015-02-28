
//Déclaration de la variable du nombre de boules
int nbDeBoules = 18; 
//Déclaration des variables pour les positions initiales
float positionXInitiale; 
float positionYInitiale;
float xoff;
float noiseScale = 0.2;

PImage title;
//Déclaration des tableaux relatifs aux boules
float[] tailleDesBoules;
float[] posXBoules;
float[] posYBoules;
float[] opaciteBoules;

void setup() {
title = loadImage("title.png");
  colorMode(RGB);
  size(800, 800);

  noStroke();
  frameRate(30);
  smooth();


  tailleDesBoules = new float[nbDeBoules];
  posXBoules = new float[nbDeBoules];
  posYBoules = new float[nbDeBoules];
  opaciteBoules = new float[nbDeBoules];

  positionXInitiale = width/6;


  positionYInitiale = height;

  posYBoules[0] = positionYInitiale;
}

void draw() {


posXBoules[0] = positionXInitiale;


  if (frameCount%1 == 0) {
    background(0);
    for (int i=1; i<nbDeBoules; i++) {
      float opaciteInitiale = 255;
      fill(175,255,116,opaciteInitiale-i*5);
      //fill(175, 255, 116,255);
      xoff = xoff + .01;
      noiseDetail(1, 1);
      float n = (noise(xoff*noiseScale) * 50)-12.5;
      println(n);
      tailleDesBoules[0]= 80;

      tailleDesBoules[i] =tailleDesBoules[i-1]-5;
      //tailleDesBoules[i] = random(1,70);
      posXBoules[i] = posXBoules[i-1]+n;
      posYBoules[i] = posYBoules[i-1] - tailleDesBoules[i-1]/2 - tailleDesBoules[i]/2;
      //if (posXBoules[i]-tailleDesBoules[i]/2<0) {
      //ellipse(4+tailleDesBoules[i]/2, posYBoules[i], tailleDesBoules[i], tailleDesBoules[i]);
      //}
      //else {
      ellipse(posXBoules[i], posYBoules[i], tailleDesBoules[i], tailleDesBoules[i]);
      //}
    }


    for (int i=1; i<nbDeBoules-2; i++) {
      float opaciteInitiale = 220;
      fill(175,255,116,opaciteInitiale-i*5);
      xoff = xoff + .01;
      noiseDetail(1, 0.5);
      float n = (noise(xoff*noiseScale) * 50)-6;

      tailleDesBoules[0]= 70;

      tailleDesBoules[i] =tailleDesBoules[i-1]-5;
      posXBoules[i] = posXBoules[i-1]+n;
      posYBoules[i] = posYBoules[i-1] - tailleDesBoules[(i-1)]/2 - tailleDesBoules[i]/2;
      
      ellipse(posXBoules[i], posYBoules[i], tailleDesBoules[i], tailleDesBoules[i]);
    }

    for (int i=1; i<nbDeBoules; i++) {
      float opaciteInitiale = 200;
      fill(175,255,116,opaciteInitiale-i*5);    
      xoff = xoff + .003;
      noiseDetail(1, 1);
      float n = (noise(xoff*noiseScale) * 50)-20;
      tailleDesBoules[0]= 75;
       tailleDesBoules[i] =tailleDesBoules[i-1]-5;
      posXBoules[i] = posXBoules[i-1]+n;
      posYBoules[i] = posYBoules[i-1] - tailleDesBoules[(i-1)]/2 - tailleDesBoules[i]/2;
      ellipse(posXBoules[i], posYBoules[i], tailleDesBoules[i], tailleDesBoules[i]);
    }

    //petites algues
    for (int i=1; i<nbDeBoules-6; i++) {
      float opaciteInitiale = 75;
      fill(175,255,116,opaciteInitiale-i*5);    
      xoff = xoff + .007;
      noiseDetail(1, 1);
      float n = (noise(xoff*noiseScale) * 50)-25;
      tailleDesBoules[0]= 65;

      tailleDesBoules[i] = tailleDesBoules[i-1]-5;
      posXBoules[i] = posXBoules[i-1]+n;
      posYBoules[i] = posYBoules[i-1] - tailleDesBoules[i-1]/2 - tailleDesBoules[i]/2;

      ellipse(posXBoules[i], posYBoules[i], tailleDesBoules[i], tailleDesBoules[i]);
    }
  }



  for (int i=1; i<nbDeBoules-5; i++) {
    float opaciteInitiale = 110;
    fill(175,255,116,opaciteInitiale-i*5);    
    xoff = xoff + .007;
    noiseDetail(1, 1);
    float n = (noise(xoff*noiseScale) * 50)+10;

    
    tailleDesBoules[i] = tailleDesBoules[i-1]-5;
    posXBoules[i] = posXBoules[i-1]+n;
    posYBoules[i] = posYBoules[i-1] - tailleDesBoules[i-1]/2 - tailleDesBoules[i]/2;
    ellipse(posXBoules[i], posYBoules[i], tailleDesBoules[i], tailleDesBoules[i]);
  }
  image(title, 300,500);
  text("Sketch par Félix Descôteaux", 545,575);
}


