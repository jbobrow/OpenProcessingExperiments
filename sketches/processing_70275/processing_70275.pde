
/*
-----------------------
Hugo Lachance
Travail du monstre interactif
Algorithmie de base - UQAM 2012
-----------------------
*/

import netscape.javascript.*;
float x=180;
float y=180; 

float xDolphin = 200;
float yDolphin = 300;
float xDolphinCible;
float yDolphinCible;
float speedDolphinX;
float speedDolphinY;
float radDolphin;
float radDolphinj;


float yBoutonG = 210;
float yBoutonD = 210;

int nbEtoile = 50;
float[] xEtoile = new float[nbEtoile];
float[] yEtoile = new float[nbEtoile];
float[] tailleEtoile = new float[nbEtoile];
color[] couleurEtoile = new color[nbEtoile];
float[] vitesseEtoile = new float[nbEtoile];

float speed = 0;
float vitesse =0;

float inc=0;
float ancienXengr=50;

float pntX=0;
float pntY=0;
float pntX2=0;
float pntY2=0;
float angle=0;
float  ancienX=80;
float  ancienY=90;
float angleInc=0;

float angleBicep=0;
float angleAvantB=0;
float longeurBicep=40;
float longeurAvantB=40;

float headMove =0;

PImage img;
void setup()
{
  size(400, 400);
  smooth();
  background(5, 0, 5);
  strokeWeight(2);
  imageMode(CENTER);

  for (int i=0; i<nbEtoile; i++) {
    xEtoile[i] = random(400);
    yEtoile[i] = random(300);
    couleurEtoile[i] = color(random(30, 255), random(22, 255), random(150, 255));
    tailleEtoile[i] = random(6);
    //Vitesse d'l'étoile, pourcentage qui diminue velocité
    vitesseEtoile[i] = random(30, 100)/100;
  }

  img = loadImage("dolphin.png");
  cursor(img,9,9);
}

void mouseReleased()
{
  angleInc=0;
}



void draw()
{
  background(0);

  //*****************************************
  //  BACKGROUND 
  //*****************************************
  noStroke();

  fill(156, 123, 39);
  rectMode(CORNER);
  rect(0, 310, 400, 90);
  curve(0, 400, 0, 310, 400, 310, 400, 400);

  //*****************************************
  //  ÉTOILE 
  //*****************************************  
  for (int i=0; i<nbEtoile; i++) {
    if (xEtoile[i] < 0) {
      xEtoile[i]=400;
    } 
    else if (xEtoile[i] > 400) {
      xEtoile[i]=0;
    }
    //Fait bouger les étoiles
    xEtoile[i] -= (speed - (speed/2)) * vitesseEtoile[i];


    fill(couleurEtoile[i]);    
    ellipse(xEtoile[i], yEtoile[i], tailleEtoile[i], tailleEtoile[i]);
    stroke(couleurEtoile[i]-30);
    strokeWeight(1);
  }





  //*****************************************
  //  CORPS 
  //*****************************************
  fill(60, 140, 96);
  stroke(6, 64, 9);
  int sizeB=110;     //size body

  beginShape();                                     //Corps
  curveVertex(x+5, y);        
  curveVertex(x+5, y); 

  curveVertex(x+6, y+135);    //coin droit
  curveVertex(x-120, y+135);   //Début Queue
  curveVertex(x-60, y+70);

  curveVertex(x-22, y-15);        
  curveVertex(x-22, y-15);        
  endShape();


  //*****************************************
  //  EFFET 
  //*****************************************
  /*arc(x-25,y+170,74,16, PI/6, 3*PI/4);      //Courbe de gras
   arc(x-115,y+180,34,9, PI/4, 3*PI/4);
   arc(x-135,y+200,114,10, PI/6, 3*PI/4);     
   arc(x-27,y+204,75,10, PI/4, 3*PI/4);     
   arc(x-97,y+140,35,10, PI/6, 3*PI/4);     
   arc(x-37,y+116,35,10, PI/4, 3*PI/4);  */





  //*****************************************
  //  TÊTE 
  //*****************************************
  int heightT = 49;    //Hauteur tête
  int widthT = 60;    //Largeur tête

  float teteY = y + sin(headMove)*3;
  headMove+=0.05;
  fill(60, 140, 96);
  stroke(6, 64, 9);

  ellipse(x, teteY, widthT, heightT);                //forme de base
  arc(x-20, teteY+12, 34, 27, PI/7, 4*PI/3);          //pomette gauche
  arc(x+20, teteY+12, 34, 27, -PI/3.5, 5*PI/6);      //pomette droite

  fill(20, 25, 0);
  ellipse(x-12, teteY-12, 17, 13);                  //yeux
  ellipse(x+12, teteY-12, 17, 13);  

  noStroke();
  for (int iC=0; iC<16; iC++)
  {
    fill(20+(iC*165/17), 25+(iC*165/17), 0);
    ellipse(x+12, teteY-12, 15-iC, 11-iC);
    ellipse(x-12, teteY-12, 15-iC, 11-iC);
  }

  fill(6, 64, 9);                                       //nez
  ellipse(x-3, teteY, 4, 3);                        
  ellipse(x+3, teteY, 4, 3);  
  noFill();
  curve(x-8, teteY+50, x-8, teteY+35, x+8, teteY+35, x+8, teteY+50);      //menton


  //*****************************************
  //      LEVRE
  //***************************************** 
  float xB=x; 
  float yB=teteY+6;
  fill(200, 145, 10);
  stroke(70, 40, 0);
  int sizeM = 4;    //Size Mouth

  beginShape();                                     //LEVRE HAUT
  curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));        //EXTR. gauche
  curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));
  curveVertex(xB-(1.5*sizeM), yB);
  curveVertex(xB, yB+0);                            //Millieu
  curveVertex(xB+(1.5*sizeM), yB);
  curveVertex(xB+(3*sizeM), yB+(2.5*sizeM));        //EXTR. droite
  curveVertex(xB+(2*sizeM), yB+(1.5*sizeM));
  curveVertex(xB+(1*sizeM), yB+(1*sizeM));          //lower
  curveVertex(xB, yB+(1*sizeM)+1);                  //Milieu 2
  curveVertex(xB-(1*sizeM), yB+(1*sizeM));
  curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
  curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));
  curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));
  endShape();

  beginShape();                                    //LEVRE BAS
  curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
  curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
  curveVertex(xB-(1*sizeM), yB+(1*sizeM));
  curveVertex(xB, yB+(1*sizeM));                  //millieu
  curveVertex(xB+(1*sizeM), yB+(1*sizeM));
  curveVertex(xB+(2*sizeM), yB+(1.5*sizeM));
  curveVertex(xB, yB+(2*sizeM));
  curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
  curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
  endShape();


  fill(22, 200, 12);
  //*****************************************
  //  BRAS 
  //*****************************************

  float epauleX=x-30;
  float epauleY=y+50; 

  stroke(6, 64, 9);                  //Épaule
  fill(49, 109, 79);
  ellipse(epauleX, epauleY, 15, 15);

  strokeWeight(10);                //Bicep
  stroke(49, 109, 79);
  angleBicep = atan2(mouseY-epauleY, mouseX-epauleX);
  angleBicep = constrain(angleBicep, -PI/2.2, PI/2.2);
  angleBicep = PI/4;
  float posCoudeX=epauleX+cos(angleBicep)*longeurBicep;
  float posCoudeY=epauleY+sin(angleBicep)*longeurBicep;
  line(epauleX, epauleY, posCoudeX, posCoudeY);

  strokeWeight(2);                 //Coude
  fill(49, 109, 79);
  stroke(6, 64, 9);
  ellipse(posCoudeX, posCoudeY, 10, 10);

  angleAvantB = atan2(mouseY-posCoudeY, mouseX-posCoudeX);
  angleAvantB = constrain(angleAvantB, -PI/2.2, angleBicep);  

  //angleAvantB = -PI/4;
  float posMainX = posCoudeX + cos(angleAvantB)*longeurAvantB;
  float posMainY = posCoudeY + sin(angleAvantB)*longeurAvantB;
  rectMode(CENTER);


  strokeWeight(10);                //Avant-bras
  stroke(49, 109, 79);
  //line(armX+20, armY+60, armX+90, armY+70);
  line(posCoudeX, posCoudeY, posMainX, posMainY);  
  strokeWeight(2);                //Main
  fill(49, 109, 79);
  stroke(6, 64, 9);                  
  rect(posMainX, posMainY, 20, 14);


  //*****************************************
  //      ÉPÉE LASER
  //***************************************** 
  if (mousePressed == true)
    angleInc+=0.3;
  angle = atan2(pntY2-pntY, pntX2-pntX);
  pushMatrix();
  translate(posMainX, posMainY);

  rotate(constrain(angleInc, 0, PI/2));
  int i=0;
  int larEpee;
  int tailleEpee = 136;
  int epeeDecal = 15;
  stroke(230, 230, 255);
  int xE=0;
  int yE=0-40;

  noStroke();
  i=50;
  while (i>0)
  {
    larEpee=i;
    fill(0, 207-i*10, 255-i*10, 255-i*10);
    rect(xE, yE-tailleEpee/2, larEpee, tailleEpee);
    ellipse(xE, yE-tailleEpee, larEpee, larEpee);
    ellipse(xE, yE, larEpee, larEpee);

    i--;
  }

  i=0;
  while (i<4)
  {
    larEpee=i;
    fill(230, 230, 255);
    rect(xE, yE-tailleEpee/2, larEpee, tailleEpee);
    ellipse(xE, yE-tailleEpee, larEpee, larEpee);
    ellipse(xE, yE, larEpee, larEpee);  
    i++;
  }

  strokeWeight(3);
  stroke(100);
  fill(180);
  rect(xE, yE+40, 8, 40);
  popMatrix();
  strokeWeight(2);

  //*****************************************
  //  HEXAPODE 
  //*****************************************
if (keyPressed)
  {
    if (keyCode == LEFT || key == 'a') {
      if (speed > -5) {
        speed -= 0.019 - speed/100;
      }
    } 
    else if (keyCode == RIGHT || key == 'd') {
      if (speed < 7) {
        speed += 0.016 + speed/100;
        //Bouge X jedi
      }
    }
  }
  else {
    speed /= 1.01;
  }



  ancienXengr = x;
  vitesse+=speed;
  inc = vitesse/24;
  float hexaX =x-115 ;
  float hexaY =y+160;

  int[] noTrou = {
    0, 3, 1, 4, 5, 2
  };
  int sizeEngre = 25;  

  fill(40); 
  rectMode(CORNER);
  rect(hexaX-sizeEngre, hexaY-14, 7*sizeEngre, sizeEngre); //La base
  for (int nbEngrenage=0; nbEngrenage<6; nbEngrenage++)
  {

    //PREMIÈRE ENGRENAGE
    float engrenageX = hexaX + (sizeEngre*nbEngrenage);
    float engrenageY = hexaY ;
    stroke(90); 
    strokeWeight(4);
    line(engrenageX, engrenageY, engrenageX, engrenageY-35);

    fill(220); 
    noStroke();  
    ellipse(engrenageX, engrenageY, sizeEngre, sizeEngre);


    fill(20);
    for (int e=0; e<6; e++)
    {
      float rad = (e+inc) * TWO_PI / 6;
      float trouX = engrenageX + cos(rad)* (sizeEngre*0.3);
      float trouY = engrenageY + sin(rad)* (sizeEngre*0.3);
      ellipse(trouX, trouY, sizeEngre*0.2, sizeEngre*0.2);

      //DESSINE PATES
      if (e==noTrou[nbEngrenage])
      {
        float hautY = trouY - sqrt(pow(sizeEngre, 2) - pow(trouX-engrenageX, 2) );
        float pente = atan2(trouY-hautY, trouX-engrenageX);

        strokeWeight(5);
        stroke(137);
        line(engrenageX, hautY, engrenageX+cos(pente)*(sizeEngre*2.3), hautY+sin(pente)*(sizeEngre*2.3));
        stroke(22);
        ellipse(engrenageX+cos(pente)*(sizeEngre*0.15), hautY+sin(pente)*(sizeEngre*0.15), 2, 2);
        noStroke();
        strokeWeight(2);
      }
    }
  }  


  //*****
  //CODE des boutons
  float xBoutonG = 40-25;
  if (dist(mouseX, mouseY, 360, yBoutonD) < 50) {
    yBoutonD = constrain(mouseY, 25, 400-25);  
    if (speed < 7) {
      speed += 0.019 + speed/100;
      //Bouge X jedi
    }
  } 
  else if(mouseX > xBoutonG &&     //rect(x-100, y+15, 20,70); rectangle de l'avant bras
         mouseX < xBoutonG+50 &&
         mouseY > yBoutonG-25 &&
         mouseY < yBoutonG+25)  {
    yBoutonG = constrain(mouseY, 25, 400-25);  
    if (speed > -5) {
      speed -= 0.019 - speed/100;
      //Bouge X jedi
    }
  }  
  
  //Dessine fleche pour reculer
  fill(200, 200, 200, 45);
  stroke(0, 0, 0);

  rect(xBoutonG, yBoutonG-25, 50, 50); 
  line(xBoutonG+5, yBoutonG, 50, yBoutonG);
  line(xBoutonG+5, yBoutonG, 30, yBoutonG+15);
  line(xBoutonG+5, yBoutonG, 30, yBoutonG-15);  

  //Dessine fleche pour avancer
  ellipse(360, yBoutonD, 50, 50); 
  line(340, yBoutonD, 380, yBoutonD);
  line(380, yBoutonD, 370, yBoutonD+15);
  line(380, yBoutonD, 370, yBoutonD-15);


  radDolphinj+= 0.25;
  xDolphinCible = mouseX + cos(radDolphinj)*random(5,10);
  yDolphinCible =  mouseY + sin(radDolphinj)*5;
  speedDolphinX += (xDolphinCible+45 - xDolphin) * 0.0385;
  speedDolphinY += (yDolphinCible+45- yDolphin) *0.04671;
  xDolphin += (xDolphinCible+45 - xDolphin) * 0.079 + speedDolphinX;
  yDolphin += (yDolphinCible+45 - yDolphin) * 0.079 + speedDolphinY;


  //DESSINE LE DOLPHIN
  image(img, xDolphin, yDolphin);
  radDolphin += TWO_PI/340;
  xDolphin += (cos(radDolphin)*5 )+ (xDolphinCible+45-xDolphin) * 0.074 ;
  yDolphin += (sin(radDolphin)*5) + (yDolphinCible+45-yDolphin) * 0.074  ;
  
}


