
/// EXERCICE DE RATTRAPPAGE EDM4600 - BOUTONS ET BOUCLES \\\
/// GABRIELLE SIGMEN MERCIER \\\

int etatE; //ellipse
int etatR; //rectangle

//variables ellipse
float ellipseX = 100;
float ellipseY = 200;

//variables rectangle
float rectX = 250;
float rectY = 175;
float rectW = 80;
float rectH = 50;

//variable while
float i; //lignes

//variables vitesse
float v; //rect
float v2; //ellipse

///////////////////////////////////SETUP///////////////////////////////

void setup() {
  size(400, 400);
  smooth();  
  strokeWeight(4);
  stroke(255);

  etatE = 0;
  etatR = 0;
}

///////////////////////////////////DRAW////////////////////////////////

void draw() {
  background(200);

  // bouton rectangle
  if ( etatR == 1 ) {
    //boucle while
    i = 0;
    while ( i < v ) { 
      line(0, i, height, i); 
      i = i + 15;
    }
    v += 7;  
    v = constrain(v, 1, 400);

    fill(234, 5, 193); //etatR 1
  } 
  else {
    fill (242, 157, 227); // etatR 0
    if (v > 0 ) {
      v -= 7;
    }
    i = 0;
    while ( i < v ) { 
      line(0, i, height, i); 
      i = i + 15;
    }
  }  


  rect ( rectX, rectY, rectW, rectH );

  // bouton ellipse
  if ( etatE == 1 ) {
    //soleil
    float soleilX = 100;
    float soleilY = 200;
    int nombreDeRayons = 40;
    int longueurDesRayons = 50;

    float tranche = TWO_PI / nombreDeRayons;
    float rads = 0;
    float ratio = 0.75;

    while ( rads < v2 ) {
      float soleilX1 = soleilX+cos(rads) * longueurDesRayons * ratio;
      float soleilY1 = soleilY + sin(rads) * longueurDesRayons * ratio;
      float soleilX2 = soleilX+cos(rads) * longueurDesRayons;
      float soleilY2 = soleilY + sin(rads) * longueurDesRayons;
      line(soleilX1, soleilY1, soleilX2, soleilY2 );
      rads = rads + tranche;
    }
    v2 += 0.5;
    v2 = constrain(v2, 1, TWO_PI);

    fill(135, 11, 224); // etatR 1
  } 
  else {
    fill (206, 157, 242); //etatR 0
    float soleilX = 100;
    float soleilY = 200;
    int nombreDeRayons = 40;
    int longueurDesRayons = 50;

    float tranche = TWO_PI / nombreDeRayons;
    float rads = 0;
    float ratio = 0.75;
    while ( rads < v2 ) {
      float soleilX1 = soleilX+cos(rads) * longueurDesRayons * ratio;
      float soleilY1 = soleilY + sin(rads) * longueurDesRayons * ratio;
      float soleilX2 = soleilX+cos(rads) * longueurDesRayons;
      float soleilY2 = soleilY + sin(rads) * longueurDesRayons;
      line(soleilX1, soleilY1, soleilX2, soleilY2 );
      rads = rads + tranche;
    }
    v2 -= 0.5;
  }

  ellipse (ellipseX, ellipseY, 60, 60);
}

//////////////////////////////////SOURIS///////////////////////////////

void mousePressed() {

  // bouton ellipse on
  float distance = dist( mouseX, mouseY, ellipseX, ellipseY ) ;
  if (distance < 30 ) {

    if (etatE == 0) {
      etatE =  1;
    } 
    else {
      etatE = 0;
    }
  }

  // bouton rect on  
  if ( mouseX > rectX && mouseX < (rectX+rectW) && mouseY > rectY && mouseY < (rectY+rectH) ) {

    if (etatR == 0 ) {
      etatR = 1;
    } 
    else {
      etatR = 0;
    }
  }
  rect( rectX, rectY, rectW, rectH );
}

void mouseReleased() {

  //bouton rect off
  if ( mouseX > rectX && mouseX < (rectX+rectW) && mouseY > rectY && mouseY < (rectY+rectH) ) {
    etatR = 0;
  }
}
