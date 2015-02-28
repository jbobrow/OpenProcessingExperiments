
/** 
Auteur: Hugo Lachance
Date: 07/09/2012
Projet: Programmer des boutons avec deux états et une animation

**/


int etatRond1 =0;
float rads=0;
float nbLigne1=0;
float nbLigne=0;
float incrementation1 = TWO_PI/60;

int etatRect =0;


void setup() {
  size(400, 400);
  smooth();
}

void mousePressed() {
  if (dist(mouseX, mouseY, 150, 200) < 30) {

    //SWITCH LES ETATS DU RONDS
    if (etatRond1 ==0) {
      etatRond1 =1;
    }
    else {
      etatRond1 =0;
    }
  }

  //SWITCH ETAT RECTANGLE
  if (mouseX > 300-30 && mouseX < 300+30 &&
    mouseY < 200+30 && mouseY > 200-30 ) {
    etatRect =1;   
    println(0);
  }
}

void mouseReleased() {
  etatRect =0;
}

void draw() {
  background(0);


  //DESSINE LIGNE RECT
  float curLigne=0;
  while (curLigne < nbLigne) {
    stroke(222, 199, 212);
    line(0, curLigne, 400, curLigne);


    curLigne +=15;
  } 

  //CHANGE ÉTAT DU RECT
  if (etatRect == 0) {
    fill(20, 200, 0);
    if (nbLigne >0)
      nbLigne -= 10;
  }
  else {
    fill(20, 200, 200);
    if (nbLigne < 400 )
      nbLigne += 10;
  }  
  rectMode(CENTER);
  noStroke();
  rect(300, 200, 60, 60);



  //CHANGE ÉTAT DU ROND
  if (etatRond1 == 0) {
    fill(20, 200, 0);
    if (nbLigne1 > 0)
      nbLigne1 -= 0.1;
  }
  else {
    fill(20, 200, 200);
    if (nbLigne1 < TWO_PI)
      nbLigne1 += 0.1;
  }
  //DESSINE LE ROND
  noStroke();
  ellipse(150, 200, 60, 60);


  //DESSINE LES RAYONS
  rads=0;
  while (rads < nbLigne1) {
    float pointX1, pointY1, pointX2, pointY2;

    stroke(200, 200, 140);
    strokeWeight(2);

    pointX1 = 150 + cos(rads) * 45;
    pointY1 = 200 + sin(rads) * 45;
    pointX2 = 150 + cos(rads) * 75;
    pointY2 = 200 + sin(rads) * 75;    
    line(pointX1, pointY1, pointX2, pointY2);
    rads += incrementation1;
  }
}
