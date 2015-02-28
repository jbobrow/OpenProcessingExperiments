
float mouchex;
float mouchey;
float moucheAileX; 


float ciblex;
float cibley;
float vitesse;

float posLangueX; //Le bout de la langue
float posLangueY;
int etatAttaque;
float cibleAttaqueX;
float cibleAttaqueY;

//float distance;

int mouchePresente = 1;

void setup() {


  mouchex = 200;
  mouchey = 200;

  ciblex = random(400);
  cibley = random(400);

  etatAttaque=0;
  posLangueX = 195;  //Position de la bouche du millieu
  posLangueY = 70;


  vitesse = 1;

  //-------------------------------------------------------------------------------
  //backgorund
  size(400, 400);
  smooth();
}


void draw() {

  //-------------------------------------------------------------------------------
  //background 
  background(124);
  fill(178, 109, 19);
  noStroke();
  rect(0, 216, 400, 296);


  fill(200, 25, 25);
  noStroke();

  //-------------------------------------------------------------------------------
  //tetes
  smooth();

  noStroke();

  float d = width;
  float ratio = 0.9;

  while ( d > 5 ) {

    fill ( 255 - d / width * 250, 0, 0 );
    ellipse(200, 60, d*0.2, d*0.2);
    fill ( 255 - d / width * 250, 0, 0 );
    ellipse(100, 90, d*0.2, d*0.2);
    ellipse(300, 90, d*0.2, d*0.2);

    d = d * ratio;
  }

  //-------------------------------------------------------------------------------
  // yeux

  fill(0, 250, 0);
  ellipse(80, 80, 10, 10);
  ellipse(120, 80, 10, 10);
  ellipse(180, 40, 10, 10);
  ellipse(220, 40, 10, 10);
  ellipse(280, 80, 10, 10);
  ellipse(320, 80, 10, 10);
  //-------------------------------------------------------------------------------
  //pupille
  //stroke(250, 0, 0);
  point(180, 40);
  point(220, 40);
  point(280, 80);
  point(320, 80);
  point(80, 80);
  point(120, 80);
  //-------------------------------------------------------------------------------
  //bouche
  fill(100, 0, 0);
  rect(190, 60, 20, 20);
  rect(92, 95, 15, 15);
  rect(293, 95, 15, 15);
  fill(0, 250, 0);
  rect(296, 95, 8, 8);
  //-------------------------------------------------------------------------------
  //dents,tronc,épines
  noStroke();
  triangle(195, 70, 200, 60, 190, 60);
  triangle(205, 70, 200, 60, 210, 60);
  triangle(200, 70, 195, 80, 205, 80);
  triangle(260, 140, 280, 140, 255, 160);

  triangle(255, 175, 255, 155, 235, 175);
  triangle(220, 130, 200, 140, 200, 120);
  triangle(180, 150, 200, 160, 200, 140);
  triangle(220, 170, 200, 180, 200, 160);
  triangle(120, 160, 145, 155, 125, 135);





  fill(0, 250, 0);
  triangle(200, 200, 100, 280, 300, 280);
  //-------------------------------------------------------------------------------
  //tiges
  strokeWeight(5);
  stroke(0, 250, 0);
  line(200, 100, 200, 200);
  line(300, 120, 200, 200);
  line(100, 120, 200, 200);
  strokeWeight(10);
  stroke(0, 250, 0);
  line(200, 18, 200, 10);
  line(100, 60, 100, 40, 200, 20);

  //mouche
  noStroke();
  fill(0);
  if ( mouchePresente == 1 ) {
    ellipse(mouchex, mouchey, 20, 20);
    rect(mouchex-15, mouchey, 30, 20);
  }
  //deplacement mouche

  float radians = atan2( cibley-mouchey, ciblex-mouchex );
  float distance = dist( ciblex, cibley, mouchex, mouchey );
  mouchex = cos(radians) * min( vitesse, distance ) + mouchex;
  mouchey = sin(radians) * min( vitesse, distance ) + mouchey;
  moucheAileX = mouchex -15;


  if (mouchex == ciblex) {
    ciblex = random(400);  
    cibley = random(400);
  }


  //Assouplissement de l'attaque
  if (mousePressed == true) {  //Quand on clic, nouvelles cilbe d'attaque 
    cibleAttaqueX = mouseX;  
    cibleAttaqueY = mouseY;
  }

  if (etatAttaque == 1) {  //Quand une attaque en cours, on dessine langue
    float distanceAttaque = dist(posLangueX, posLangueY, cibleAttaqueX, cibleAttaqueY);
    
    if (distanceAttaque < 3) { //Si proche de cible attaque,
      etatAttaque=0;   
      posLangueX=195;  //Position Langue retourne a la bouche
      posLangueY=70;
    }
    else {
      posLangueX = (cibleAttaqueX - posLangueX) * 0.14 + posLangueX;
      posLangueY = (cibleAttaqueY - posLangueY) * 0.14 + posLangueY;
    }



    stroke(255, 0, 0);
    line(195, 70, posLangueX, posLangueY);
  }
}


void mousePressed() {
  float distance = dist( mouseX, mouseY, mouchex, mouchey ) ;
  if ( distance < 10 ) {  
    mouchePresente = 0;
  }

  //détection du carré noire (aile de la mouche)
  if (mouseX > moucheAileX &&
    mouseX < moucheAileX+30 && //plus 30 pour la largeur de laile 
  mouseY < mouchey+20 &&
    mouseY > mouchey) {

    mouchePresente=0;
  }


  if ( mouseButton == LEFT ) {
    stroke(250, 0, 0);
    //line(195, 70, mouseX, mouseY);
    float distanceAttaque = dist(posLangueX, posLangueY, cibleAttaqueX, cibleAttaqueY);
    float angleAttaque = atan2(cibleAttaqueY-posLangueY, cibleAttaqueX - posLangueX);
    posLangueX += cos(angleAttaque);
    posLangueY += sin(angleAttaque);
    etatAttaque = 1;
    posLangueX=195;
    posLangueY=70;

    line(195, 70, posLangueX, posLangueY);


    line(296, 95, mouseX, mouseY);
    line(98, 105, mouseX, mouseY);
  }
}
