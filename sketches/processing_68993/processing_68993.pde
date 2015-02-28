
/*TRAVAIL DE RATRAPPAGE
  LES BOUTONS
  PAR GABRIELLE DEMERS*/


int ellipseX;
int ellipseY;
int rayon;
int etat1;

int rectX;
int rectY;
int rectW;
int rectH;
int etat2;

int y ;
float C = 0;

float R = 0;

float anneauX;
float anneauY;
int nombreDeRayons;
int longueurDesRayons;




void setup() { 

  size (400, 400);
  smooth();


  // bouton round 
  ellipseX = 100;
  ellipseY = 200;
  rayon = 60;
  etat1 = 0;


  // bouton carré

  rectX = 275;
  rectY = 170;
  rectW = 60;
  rectH = 60;
  etat2 = 0;
}

int pos = 0;
void draw() {

  background(100); 

float tranche;
float rads;
float ratio;
  // Anneaux 
  anneauX= 100;
  anneauY= 200;
  nombreDeRayons= 20;
  longueurDesRayons = 60; 
  tranche = TWO_PI / nombreDeRayons;
  rads = 0;
  ratio = 0.75; 


  //bouton carré

  //fill(50);

  if (etat2 == 1) {

    //apparition des lignes
    y=0; //initialisation

    while ( y < C ) { // condition
      strokeWeight(5);
      stroke(0);
      line(0, y, width, y); // bloc de code
      y = y + 15;
    }
    if (C<400) {
      C = C + 5; // incrementation
    }

    fill(250, 18, 208);
  } 
  else { 
    fill(10, 250, 8);
   y=0; 

    while ( y < C ) { // condition
      strokeWeight(5);
      stroke(0);
      line(0, y, width, y); // bloc de code
      y = y + 15;
    }
    if (C>0) {
      C = C - 5; // incrementation
    }
  }
  noStroke();
  rect(rectX, rectY, rectW, rectH);

  //bouton round
   strokeWeight(5);
    stroke(0);
    while (rads < R) {
      
      float anneauX1 = anneauX+cos(rads) * longueurDesRayons * ratio;
      float anneauY1 = anneauY + sin(rads) * longueurDesRayons * ratio;
      float anneauX2 = anneauX+cos(rads) * longueurDesRayons; 
      float anneauY2 = anneauY+sin(rads) * longueurDesRayons;
      line(anneauX1, anneauY1, anneauX2, anneauY2);
      rads = rads +tranche;
    }

  if (etat1 == 1) {
    
    // apparition des anneaux
    
    
     if (R<TWO_PI){
      println(R);
    
      R = R + 0.3;
     }
     
     
      
    fill(250, 18, 208);
  }
  else { 
   
    if (R>0){
      println(R);
    
      R = R - 0.3;
     }
    
    fill(10, 250, 8);
    
   
    
    
  }
  noStroke();
  ellipse(ellipseX, ellipseY, rayon, rayon);
}


void mousePressed() {

  //bouton rond couleur mauve

  float distance = dist(mouseX, mouseY, ellipseX, ellipseY);

  if ( distance < rayon) {
    if (etat1 == 0) {
      etat1 = 1;
    } 
    else {
      etat1 = 0;
    }
  }

  //bouton carré couleur mauve 

  if ( mouseX>rectX && mouseX<rectX+rectW && mouseY>rectY && mouseY<rectY+rectH ) {
    if ( etat2 == 0 ) {
      etat2 = 1;
    } 
    else {
      etat2 = 0;
    }
  }
}


void mouseReleased() {
  etat2 = 0;
}
