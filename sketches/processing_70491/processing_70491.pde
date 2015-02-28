
import netscape.javascript.*;

/*
  
 UQAM - Hiver 2012
 
 TP1 ANTHONY PETTIGREW
 
 EDM4600 - Algorithmie de base et intéractivité
 
 
 ----------------------------------------------*/

// variable..

float hauteurBouche = 181;
float largeurBouche = 120;
int nbDonut = 40;

// setup


float x;
float y;
float xEye;
float yEye;
PImage img1, img2, img3;
float [] tableauX = new float[nbDonut];
float [] tableauY = new float[nbDonut];
int [] tableauImg = new int[nbDonut];
int [] tableauState = new int[nbDonut];  
int[] tableauDonutAte = new int[nbDonut]; 


//itérateur du movement haut bas du monstre
float itMouvement=0;

void setup() {

  size(400, 400);
  smooth();
  x = width/2;
  y = 105;
  yEye = hauteurBouche/4;
  xEye=x;
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  img1 = loadImage("donut1.png");
  img2 = loadImage("donut2.png");
  img3 = loadImage("background.png");
  for (int i = 0; i < nbDonut; i += 1) {

    tableauX[i] = random ( 0, 400 );
    tableauY[i] = random ( 300, 400);
    tableauImg[i] =  (int) random (0, 2);
  }
}



void draw() {
    image (img3,200,200);


  //BOUCHE rect rouge


  fill(#B40F2D);
  stroke(0, 0, 0);
  strokeWeight(2);
  strokeJoin(BEVEL);
  rect(x, y, largeurBouche, hauteurBouche);


  fill(#ffffff);

  //LES DENTS

  //les 2 dents haut (gauche)
  triangle(x-largeurBouche/2, y-20, x+30-largeurBouche/2, y-20, x+15-largeurBouche/2, y+50);
  triangle(x+30-largeurBouche/2, y, x+60-largeurBouche/2, y, x+45-largeurBouche/2, y+80);

  //les 2 dents haut droite
  triangle(x-60+largeurBouche/2, y, x-30+largeurBouche/2, y, x-45+largeurBouche/2, y+80);
  triangle(x-30+largeurBouche/2, y-20, x+largeurBouche/2, y-20, x-15+largeurBouche/2, y+50);


  //dents bas
  fill(#ffffff);
  triangle(x+10-largeurBouche/2, y+hauteurBouche/2, x+30-largeurBouche/2, y+hauteurBouche/2, x+20-largeurBouche/2, y-35+hauteurBouche/2);
  triangle(x-30+largeurBouche/2, y+hauteurBouche/2, x-10+largeurBouche/2, y+hauteurBouche/2, x-20+largeurBouche/2, y-35+hauteurBouche/2);


  //forme autour du fond noir oeil
  fill(0, 0, 0);
  stroke(#0CA573);
  strokeWeight(3);
  beginShape();
  vertex(x-largeurBouche/2, y-hauteurBouche/2);
  vertex(x+largeurBouche/2, y-hauteurBouche/2);
  vertex(x+largeurBouche/2, y-10);
  vertex(x, y+75);
  vertex(x-largeurBouche/2, y-10);
  endShape(CLOSE);

  //fond sous oeil kaky 
  noStroke();
  fill(#CEBB0A);
  beginShape();
  vertex(x+20-largeurBouche/2, y+20-hauteurBouche/2);
  vertex(x-20+largeurBouche/2, y+20-hauteurBouche/2);
  vertex(x-20+largeurBouche/2, y-10);
  vertex(x, y+55);
  vertex(x+20-largeurBouche/2, y-10);
  endShape(CLOSE);


  //rectangle en dessous oeil
  fill(#0CA573);
  stroke(0, 0, 0);
  strokeWeight(3);
  triangle(x-20, y-10, x+20, y-10, x, y+15);


  // oeil
  fill(#B30ACE);
  
  arc(x, y-hauteurBouche/4, 60, 23, -PI, 0);//ligne du haut
  arc(x, y-hauteurBouche/4, 60, 23, 0, PI);//ligne du bas
  fill(0, 0, 0);
  //Animation de l'oeil
  xEye = (x - xEye) * 0.25 + xEye;
  yEye = (y-hauteurBouche/4 - yEye) * 0.25 + yEye;
  if (mousePressed) {
    float radiansEye = atan2(mouseY-yEye, mouseX-xEye);
    float distanceEye = dist(mouseX, mouseY, xEye, yEye);

    float distanceW = constrain(distanceEye, 0, 5);
    float distanceH = constrain(distanceEye, 0, 1);

println(cos(distanceH));
    xEye = (cos(radiansEye)* distanceW) + xEye;
    yEye = (sin(radiansEye)* distanceH) + yEye;

  }

  ellipse(xEye, yEye, 9, 9);
  



  //bas tête
  stroke(#0CA573);
  strokeWeight(3);
  triangle(x-largeurBouche/2, y+hauteurBouche/2, x+largeurBouche/2, y+hauteurBouche/2, x, y+45+hauteurBouche/2);

  //boulle
  fill(#0CA573); 
  ellipse(x, 300, 30, 30); 

  //Animatin haut bas du monstre
  y+=sin(itMouvement);
  itMouvement += 0.05;

  // boucle qui dessine tous les beignes
  for (int i = 0; i < nbDonut; i += 1) {
    if ( tableauState[i]==1) {

      tableauX[i] = mouseX; 
      tableauY[i] = mouseY;
    } 


    if (tableauDonutAte[i] ==0) { //Si le donut est pas mange on affiche
      if (   tableauImg[i] == 1) { 
        image (img1, tableauX[i], tableauY[i] );
      } 
      else {
        image (img2, tableauX[i], tableauY[i] );
      }
    }
  }
}



void mousePressed() {


  for (int i = nbDonut-1; i >=0 ; i-=1) {

    float distance= dist(mouseX, mouseY, tableauX[i], tableauY[i]);
    //Code lorsque qu'on clique sur le beigne 
    if (distance < 20) {
      tableauState[i]=1;

      break;
    }
  }
}

void mouseReleased() {
  for (int i=0; i<nbDonut; i+=1) {
    if (tableauState[i] == 1) {


      float gauche = x - largeurBouche/2 ;
      float droite = x+largeurBouche/2;
      float haut = y;
      float bas = y+hauteurBouche/2;
      if ( tableauX[i] > gauche && tableauX[i] < droite && tableauY[i] > haut && tableauY[i] < bas ) {
        // le point est dans le rectangle
        tableauDonutAte[i] = 1;
      }
    }

    tableauState[i] = 0;
  }
}


