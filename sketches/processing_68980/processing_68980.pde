
// Variable Oeil
float centreX = 200;
float centreY = 200;
float dBlanc = 100;

// Variable pupille

float dPupille = 30;

// Variable sauvegarde du point cliqué
float cibleX;
float cibleY;

float vitesse = 6;

/////////////////////////////////////

void setup() {

  size(400, 400);

  noStroke();
  smooth();
}

////////////////////////////////////////

void draw() {
  background(0);

  //-- Assouplissement   
  centreX = ( cibleX - centreX ) *0.1 + centreX;
  centreY = ( cibleY - centreY ) *0.1 + centreY; 


  //-- Calculer les coordonnées entre le point cliqué et la position actuelle 
  float radians = atan2( cibleY-centreY, cibleX-centreX ); 
  float distance = dist( cibleX, cibleY, centreX, centreY );



  fill(255);
  ellipse(centreX, centreY, dBlanc, dBlanc);

  //-- Calculer les coordonnées entre la position actuel et la souris
  float radiansP = atan2( mouseY-centreY, mouseX-centreX ); 
  float distancePupille = dist( mouseX, mouseY, centreX, centreY );

  distancePupille = constrain(distancePupille, 0, dBlanc/2 - dPupille/2);

  float pupilleX = cos(radiansP) * distancePupille + centreX;
  float pupilleY = sin(radiansP) * distancePupille + centreY;




  fill(0);
  ellipse(pupilleX, pupilleY, dPupille, dPupille);
}

//////////////////////////////////////////

void mousePressed() {

  cibleX = mouseX;
  cibleY = mouseY;
}
