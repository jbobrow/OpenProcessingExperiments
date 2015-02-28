
/* ----------------------------------- 
 Voici mon monstre
 Par: Anne Lagacé 
 --------------------------------------*/





//fenetre
size(400, 400);
smooth();
background(100, 227, 244);

//variables 


//variables dans size
float x = width/2-30;
float y = width/2;
float radians = 1.5;

//Soleil
float rads = 0;
int nombreDeRayonsSoleil = 25;
float tranche = TWO_PI /nombreDeRayonsSoleil;
int longueurDesRayonsSoleil = 40;

//Criniere
int nombreDeRayonsCriniere = 18;
int longueurDesRayonsCriniere = 90;
float trancheCriniere = TWO_PI / nombreDeRayonsCriniere;
float radsCriniere = 0;
float ratioCriniere = 0.75;

/*-------------------------------------------
 Paysage
 -------------------------------------------*/

// background

noStroke();
fill(10, 110, 10);
rect(0, 150, 400, 400);


// rayons de soleil

strokeWeight (5);
stroke (255, 175, 0);
while ( rads < TWO_PI ) 
{ line(x+120, y-125, x+120+cos(rads) * longueurDesRayonsSoleil, y-125 + sin(rads) * longueurDesRayonsSoleil);
  rads = rads + tranche; }

//soleil

fill(225, 175, 0);
ellipse(x+120, y-125, 75, 75);

/*-------------------------------------------
Gazon 
 -------------------------------------------*/

//Gazon (foncé)
strokeWeight(2);
stroke(20, 120, 20);
int gazon = 0;
while (gazon<1000) {
  float x3 = random (0, width);
  float y3 = random (148, height);
  line (x3, y3, x3, y3+4);
  gazon = gazon+1;
}
//Gazon (pale)
strokeWeight(1);
stroke(30, 145, 30);
int gazonPale = 0;
while (gazonPale<1000) {
  float x3 = random (0, width);
  float y3 = random (148, height);
  line (x3, y3, x3, y3+4);
  gazonPale = gazonPale+1;
}


//Gazon (mi)
strokeWeight(1);
stroke(30, 145, 30);
int gazonMi = 0;
while (gazonMi<1500) {
  float x3 = random (0, width);
  float y3 = random (250, 350);
  line (x3, y3, x3, y3+12);
  gazonMi = gazonMi+1;
}


//Gazon (arriere)
strokeWeight(1);
stroke(30, 145, 30);
int gazonArriere = 0;
while (gazonArriere<1500) {
  float x3 = random (0, width);
  float y3 = random (150, 250);
  line (x3, y3, x3, y3+8);
  gazonArriere = gazonArriere+1;
}

//Gazon (fond)
strokeWeight(1);
stroke(30, 145, 30);
int gazonFond = 0;
while (gazonFond<1000) {
  float x3 = random (0, width);
  float y3 = random (146, 200);
  line (x3, y3, x3, y3+6);
  gazonFond = gazonFond+1;
}

/*-------------------------------------------
 Body
 -------------------------------------------*/



//Queue
noFill();
strokeWeight(10);
stroke(200, 100, 0);

beginShape();
curveVertex(x+300, y+100 );
curveVertex(x, y+155);
curveVertex(x-125, y+50);
curveVertex(x-75, y-50);
curveVertex(x-125, y-100);
curveVertex(x-125, y-100);
endShape();

//Bout de la queue
fill(225, 175, 0);
noStroke();
beginShape();
curveVertex(x-150, y-112); //199 - 49, 199 - 87
curveVertex(x-140, y-112); //199 - 59, 199 - 87
curveVertex(x-119, y-107); //199 - 80, 199 - 92
curveVertex(x-119, y-94); //199 - 80, 199 - 105
curveVertex(x-131, y-92); //199 - 68, 199 - 107
curveVertex(x-140, y-112); //199 - 59, 199 - 87
curveVertex(x-141, y-120); //199 - 58, 199 - 79
endShape();

//Corps lion
fill(200, 100, 0);
ellipse(x, y+75, 175, 200);//corps foncé
fill(225, 175, 0);
ellipse(x, y+85, 150, 180);// corps pale
//Nombril
fill(125, 75, 10);
ellipse(x, 350, 5, 5);


// Crinière
noStroke();
fill(200, 150, 0);
while ( radsCriniere < TWO_PI ) {
  float x1 = x+cos(radsCriniere) * longueurDesRayonsCriniere * ratioCriniere;
  float y1 = y + sin(radsCriniere) * longueurDesRayonsCriniere * ratioCriniere;
  float x2 = x+cos(radsCriniere) * longueurDesRayonsCriniere;
  float y2 = y + sin(radsCriniere) * longueurDesRayonsCriniere;
  ellipse(x1, y1-75, 30, 30 );
  radsCriniere = radsCriniere + trancheCriniere;
}

//Tête lion
noStroke();
fill(200, 100, 0);
ellipse(x, y-75, 125, 115); // tete





/*-------------------------------------------
 Yeux
 -------------------------------------------*/

noStroke();

//oeil gauche
fill(255);
ellipse(x-40, y-81, 30, 55);//oeil
fill(0);
ellipse(x-42, 118, 10, 10);//pupille
fill(225, 175, 0);  
noStroke();
arc(x-40, y-86, 35, 60, PI, TWO_PI);//paupiere

//oeil droit
fill(255);
ellipse(x+40, y-81, 30, 55);//oeil
fill(0);
ellipse(x+42, 118, 10, 10);//pupille
fill(225, 175, 0);  
noStroke();
arc(x+40, y-86, 35, 60, PI, TWO_PI);//paupiere

//oeil centre
fill(255);
ellipse(x, y-84, 55, 80);//oeil
fill(0);
ellipse(x, 115, 10, 10);//pupille
fill(225, 175, 0);  
noStroke();
arc(x, y-89, 55, 80, PI, TWO_PI);//paupiere

/*-------------------------------------------
 Museau
 -------------------------------------------*/

/*
Le deuxième doit être pareil à l’avant dernier
 Le premier à l’avant avant dernier
 Le dernier au troisième
 */

// Nez 

fill(0);
beginShape();
curveVertex(x, y-35);
curveVertex(x+10, y-40);
curveVertex(x-10, y-40);
curveVertex(x, y-35);
curveVertex(x+10, y-40);
curveVertex(x-10, y-40);
endShape();


// Machoire
strokeWeight(2);
stroke(0);
noFill();
arc(x+7, y-35, 14, 12, 0, PI);
arc(x-7, y-35, 14, 12, 0, PI);

/*-------------------------------------------
Gazon devant
 -------------------------------------------*/

//Gazon (avant)
strokeWeight(1);
stroke(30, 145, 30);
int gazonAvant = 0;
while (gazonAvant<1000) {
  float x3 = random (0, width);
  float y3 = random (350, height);
  line (x3, y3, x3, y3+16);
  gazonAvant = gazonAvant+1;
}

