




//Christopher Nolan pendant son brainstorm d'Inception 



float x;
float y;
float rayon = 160;
float blend;
float vitOsc = 0.1;

float gauche = 0 ;
float droite = 400;
float haut = 100;
float bas = 170;

float courante;
float cible;
float vitesse;

float fade;
float c;
int timeStamp;
int interval;

int pomdroiteX = 135;
int pomdroiteY = 270;
int pomdroiteR = 15;

int pomgaucheX = 280;
int pomgaucheY = 270;
int pomgaucheR = 15;

int etat;

/////////////////////////////////////////////////////////////// Fonction qui n'est appelee qu'au demarrage.

void setup() {
  size(400, 400); // La taille de la fenetre.
  frameRate(30); // Le nombre d'images par seconde.
  smooth(); // Lisser les formes dessinees.
  background(0, 0, 0);
  x=width/2;
  y=height/2;
  courante = 0.1;
  vitesse = 2;

  c = color(random(256), random(256), random(256));
  interval = 100;
}

void draw() {  

  ///////////////////////////////////////////////////////////////////Mouse Over
  float distance = dist( mouseX, mouseY, width/2, height/2);
  if ( distance < rayon ) {
    fill(255, 185, 185);
  } 
  else {
    fill(210, 209, 211);
  }
  //////////////////////////////////////////////////////////////// // tête   

  ellipse( width/2, height/2, rayon * 2, rayon * 2);
  stroke(0, 0, 0); 

  ///////////////////////////////////////////////////////////////////////// etats
  if ( etat == 0 ) {
    interval= 3000;        // Interval qui change dépendant des états
    vitOsc = 0.1;         // vitesse d'oscillation qui change dépendant de l'état
    cible= 0.25;            // Vitesse d'oscillation visée 
  }
  else if ( etat == 1) {
    vitOsc = 5;
    interval=75;
    cible= 0.25;
  }
  else {

    vitOsc = 0.25;
    interval=2000;
    cible= 0.1;
  }
  ////////////////////////////////////////////////////////////////////////////////



  ///////////////////////////////////////////////////////////////////////////////// Changer la couleur lorsque la souris est dessus la barre.
  pushMatrix();
  if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
    // mouseOver
    fill(255);
  } 
  else {
    fill(0);
  }
  /////////////////////////////////////////////////////////////////////////////////////////// Changer la couleur a chaque intervalle
  if ( millis() - timeStamp >= interval ) {  //Minuterie pour l'effet cathodique
    timeStamp = timeStamp + interval;
    rect(0, 100, 400, 70);
    rect(0, 200, 400, 70);
    fill(255);
  }
  popMatrix();


  ///////////////////////////////////////////////////////////////////////////// Pomettes    

  fill(255, 100, 100);
  ellipse(280, 270, 50, 40);
  ellipse(135, 270, 50, 40);
  fill(255, 185, 185);
  ellipse( pomdroiteX, pomdroiteY, pomdroiteR *2, 20);
  fill(255, 185, 185);
  ellipse( pomgaucheX, pomgaucheY, pomgaucheR *2, 20);

  //////////////////////////////////////////////////////////////////////// //Oeil mouvement        
  float oscOffsetD = 0.75;                    // décentrement de l'oscillation
  float oscCounterD = vitOsc * frameCount;    // vitesse d'oscillation
  float oscCenterD =width/4 + 25;              // décentrement de l'oscillation
  float oscRadiusD =width/50;
  float value = cos( oscCounterD + oscOffsetD ) * oscRadiusD + oscCenterD;
  ///////////////////////////////////////////////////////////////////////////
  ellipse(value+150, height*0.333, 50, 50);  
  ////////////////////////////////////////////////////////////////////////////// ///assouplissement

  float distanceA = abs(cible - courante);
  if (courante < cible ) {
    courante = value+150 + min(distanceA, vitesse);
  } 
  else {
    courante = value+150 - min(distanceA, vitesse);
  }
  //////////////////////////////////////////////////////////////////////////// oeil droite deuxième
  fill(90, 90, 90);
  ellipse(value+150, height*0.333, 95, 220);
  ellipse(value+150, height*0.333, 95, 210);

  fill(201, 201, 201);
  ellipse(value+150, height*0.333, 85, 200);
  ellipse(value+150, height*0.333, 85, 180);
  ellipse(value+150, height*0.333, 70, 170);     
  ellipse(value+150, height*0.333, 70, 160);

  fill(210, 214, 117);
  ellipse(value+150, height*0.333, 60, 150);
  ellipse(value+150, height*0.333, 60, 140);

  fill(5, 5, 5);
  ellipse(value+150, height*0.333, 55, 130);
  ellipse(value+150, height*0.333, 55, 120);

  fill(210, 214, 117);
  ellipse(value+150, height*0.333, 40, 110);

  fill(211, 211, 211);     
  ellipse(value+150, height*0.333, 20, 100);

  ///////////////////////////////////////////////////////////Oeil gauche mouvement   
  fill(211, 211, 211);
  ellipse(value, height*.333, 50, 50);        
  ellipse(value, height*0.333, 95, 230);
  ellipse(value, height*0.333, 95, 220);

  fill(201, 201, 201);
  ellipse(value, height*0.333, 85, 210);
  ellipse(value, height*0.333, 85, 200);
  ellipse(value, height*0.333, 70, 190);     
  ellipse(value, height*0.333, 70, 180);

  fill(210, 214, 117);
  ellipse(value, height*0.333, 60, 170);
  ellipse(value, height*0.333, 60, 160);

  fill(5, 5, 5);
  ellipse(value, height*0.333, 55, 150);
  ellipse(value, height*0.333, 55, 140);

  fill(210, 214, 117);
  ellipse(value, height*0.333, 40, 130);

  fill(211, 211, 211);     
  ellipse(value, height*0.333, 20, 100);

  fill(250, 250, 255);
  ellipse(126, 135, 5, 20);
  ellipse(275, 135, 5, 20);

  ////////////////////////////////////////////////////////////Nez       
  fill(250, 250, 255);
  beginShape();
  curveVertex(2.0, 243.0);
  curveVertex(233.0, 281.0);
  curveVertex(183.0, 310.0);
  curveVertex(202.0, 132.0);
  curveVertex(234.0, 281.0);
  curveVertex(482.0, 99.0);
  endShape();
  strokeWeight(2);
  stroke(0, 0, 0);

  noFill();
  ///////////////////////////////////////////////////////////////Moustache
  pushMatrix();
  stroke(235, 87, 2);      
  float x =random(40, 50);                  // random des poils de moustache qui bougent
  float oscDecallageD = 20;
  float oscCompteD =0.1 * frameCount;
  float oscCentreD =width/2;
  float oscRadianD =width/300;
  float valeur = cos( oscCompteD + oscDecallageD ) * oscRadianD + oscCentreD;

  while ( x < 330) { 
    line(valeur, height*0.815, x*1.05, 360); 
    x = x + 5 ;
  }
  popMatrix();
}

////////////////////////////////////////////////////////////////////////Mouse Pressed
void mousePressed() {
  float distance = dist( mouseX, mouseY, width/2, height/2 );
  if ( distance < rayon  ) {
    // mouseOver
  } 
  else {
    fill(210, 209, 211);
  }
  ellipse( width/2, height/2, rayon * 2, rayon * 2); 

  float pomdroiteDistance = dist( mouseX, mouseY, pomdroiteX, pomdroiteY );
  float pomgaucheDistance = dist( mouseX, mouseY, pomgaucheX, pomgaucheY );
  if ( pomdroiteDistance < pomdroiteR ) {
    etat = 1;
  } 
  else if ( pomgaucheDistance < pomgaucheR ) {
    etat = 2;
  } 
  else {
    etat = 0;
  }
}

