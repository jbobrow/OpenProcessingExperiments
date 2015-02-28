
float r;//rotation fonction cheveux

int x;//position référence du sketch.
int y;

int angle;//rotation fonction soleil
int angle2;


float courant;//assouplissement relatif à la couleur du corps et minuterie.
float cible;
float vitesseCouleur;
float tempsE;
float timeStamp;

float a;//rotation hello world
int etat;//etat helloworld,lié à la zone interactive rectangulaire du bras droit.

int etatOeil;//etat zone interactive circulaire de l'oeil.
color couleurOeil;
int[] laserX;//coordonées des lasers,
int[] laserY;

float tempsEcoule;//minuterie laser.
float timeStamp2;
int v; //variable permettant d'appeller des index de laserX[] et laserY[].
int interval;

float z;//paramètres salive.
float[] tabX;
float[] tabRayon;

float frameC;//mouvement broche
float frameC2;
int etatBouche;


void setup() {
  size(400, 400);
  background(255);
  frameRate(50);
  noStroke();
  smooth();

  etat=0;// lié aux zones interactives.
  etatOeil=0;
  etatBouche=0;

  angle2=0;//Rotation soleil.
  angle=0;

  x=200;//Position référence
  y=150;

  vitesseCouleur=4;//Assouplissement couleur.
  courant=0;
  cible=0;

  couleurOeil=color(247, 233, 224);// Destiné à la variation de couleur noir blanc lors du click.
  laserX=new int[1000];
  laserY=new int[1000];

  for (int i=0;i<399;i++) {// Assignation des coordonnées aléatoires des lasers.
    laserX[i]=int(random(0, 400));
    laserY[i]=int(random(0, 400));
  }
  tabX= new float [35];
  tabRayon= new float[35];

  for (int i=0;i<35;i++) {// Destiné à la variation de rayon pour l'effet de salive.
    tabX[i]=random(80);
    tabRayon[i]=random(15);
  }
}

void draw() {

  background(255);

  //Cheveux//

  pushMatrix();
  cheveux();
  popMatrix();

  //Tête///////////////////////////////////

  fill(courant, 170, 53);
  ellipse(x, y, 101, 101);

  //corps/////////////////////////////////

  fill(courant, 170, 53);
  rect(x-50.5, y-7, 101, 77);

  //Jambe droite/////////////////////////

  fill(courant, 170, 53);
  rect(x+16.5, y+50, 34, 88);

  //Jambe gauche/////////////////////////

  fill(courant, 170, 53);
  rect(x-51, y+50, 34, 88);

  //////hello world//////////////

  if (mouseX>x+50 && mouseX<x+150 && mouseY>y-50 && mouseY<y+150) {//affiche un curseur main au niveau de la zone interactive.
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }


  if (etat==1) {//Si click apparition d'un bras en mouvement.
    a+=0.1;
    pushMatrix();
    fill(courant, 170, 53);
    translate(x+25, y-20);
    rotate(sin(a)*PI*0.25);
    rect(0, 0, 95, 37);

    ellipse(97, 18, 37, 37);
    popMatrix();
  }
  else {// Si non apparition du bras classique à position fixe.

    // Bras droit, Main droite ///////////////////////

    fill(courant, 170, 53);
    pushMatrix();
    translate(x+35, y-20);
    rotate(PI*0.25);
    rect(0, 0, 95, 37);
    popMatrix();

    fill(courant, 170, 53);
    ellipse(x+89, y+60, 37, 37);
  }

  //Bras gauche//////////////////////////

  fill(courant, 170, 53);
  pushMatrix();
  translate(x-10, y+6);
  rotate(PI*3/4);
  rect(0, 0, 95, 37);
  popMatrix();

  // Main gauche ///////////////////////

  fill(courant, 170, 53);
  ellipse(x-89, y+59, 37, 37);

  //Pied droit /////////////////////////

  fill(courant, 170, 53);
  ellipse(x+33.5, y+138, 34, 34);


  //Pied gauche //////////////////////

  fill(courant, 170, 53);
  ellipse(x-34, y+139, 34, 34);


  //oeil/////////////////////////

  fill(courant, 141, 54);
  ellipse(x, y-11, 76, 48);
  fill(couleurOeil);
  ellipse(x, y-11, 71, 45);
  //fill(0, 141, 54);
  fill(48, 175, 127);
  ellipse(x, y-11, 31, 31);
  //fill(0, 102, 51);
  fill(56, 206, 150);
  ellipse(x, y-11, 23, 23);
  fill(18, 62, 45);
  ellipse(x, y-11, 19, 19);
  fill(255);
  ellipse(x+6, y-15, 4, 4);


  // Soleil oeil ///////////////

  pushMatrix();
  soleil();
  popMatrix();

  //Fond bouche//////////////////

  fill(courant, 141, 54);
  rect(x-40, y+22, 80, 30);
  fill(0);
  rect(x-38, y+24, 76, 26);

  //Langue//

  fill(231, 51, 42);
  rect(x-28, y+39, 60, 11);

  //Dents haut/////////////////////////////////////////////////



  pushMatrix();

  fill(247, 233, 224);
  triangle(x-39+frameC, y+24, x-24+frameC, y+24, x-31.5+frameC, y+36);
  triangle(x-24+frameC, y+24, x-9+frameC, y+24, x-16+frameC, y+36);
  triangle(x-9+frameC, y+24, x+6+frameC, y+24, x-1.5+frameC, y+36);
  triangle(x+6+frameC, y+24, x+21+frameC, y+24, x+11.5+frameC, y+36);
  triangle(x+21+frameC, y+24, x+36+frameC, y+24, x+28.5+frameC, y+36);


  //Dents bas //////////////////////////////////////////////////

 

  triangle(x-37+frameC2, y+50, x-22+frameC2, y+50, x-29.5+frameC2, y+38);
  triangle(x-22+frameC2, y+50, x-7+frameC2, y+50, x-14.5+frameC2, y+38);
  triangle(x-7+frameC2, y+50, x+8+frameC2, y+50, x+0.5+frameC2, y+38);
  triangle(x+8+frameC2, y+50, x+23+frameC2, y+50, x+15.5+frameC2, y+38);
  triangle(x+23+frameC2, y+50, x+38+frameC2, y+50, x+30.5+frameC2, y+38);


  //Bague Rect Haut//////////////////////////////////////////

  for (int i =0; i<=60; i +=15) {
    fill(120);
    rectMode(CENTER);
    rect(x-31.5+i+frameC, y+28, 3, 4);
  }
  rectMode(CORNER);

  //Bague Rect Bas ///////////////////////////////////////////

  for (int i=0; i<=60; i+=15) {
    fill(120);
    rectMode(CENTER);
    rect(x-29.5+i+frameC2, y+47, 3, 4);
  }
  rectMode(CORNER);

  //Bague Ligne /////////////////////////////////////////////

  stroke(120);
  line(x-45, y+28.5, x+42, y+28.5);
  noStroke();

  stroke(120);
  line(x-45, y+47, x+42, y+47);
  noStroke();

  popMatrix();


  ///Zone interactive bouche/////////////////////////////////
  
  if (mouseX>x-38 && mouseX<x+38 && mouseY>y+24 && mouseY<y+50) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }

  if (etatBouche==1) {//Si click tous les X des éléments composants la bouche sont varié par un %.

    frameC=frameCount%6;
    frameC2=2+frameCount%8;

    pushMatrix();
    salive();
    popMatrix();
  }
  else {//Si non, supression du % permettant le mouvement.
    frameC=0;
    frameC2=0;
  }
  // Boutons d'Acné ////////////////////////////////////////

  fill(courant, 104, 40, 80);
  //ellipse(mouseX,mouseY,10,10); placer une ellipse//

  if (random(100)<=20) {// Apparition aléatoire.
    ellipse(x+34, y+11, 10, 10);
  }
  if (random(100)<=60) {
    ellipse(x+44, y+17, 5, 5);
  }
  if (random(100)<=30) {
    ellipse(x+44, y+9, 5, 5);
  }
  if (random(100)<=40) {
    ellipse(x+24, y+12, 6, 6);
  }
  if (random(100)<=50) {
    ellipse(x+11, y+18, 5, 5);
  }
  if (random(100)<=30) {
    ellipse(x+40, y, 3, 3);
  }
  if (random(100)<=40) {
    ellipse(x+44, y+37, 3, 3);
  }
  if (random(100)<=60) {
    ellipse(x-14, y+16, 5, 5);
  }
  if (random(100)<=20) {
    ellipse(x-31, y+14, 10, 10);
  }
  if (random(100)<=30) {
    ellipse(x-39, y+5, 5, 5);
  }
  if (random(100)<=20) {
    ellipse(x-46, y+16, 5, 5);
  }
  if (random(100)<=40) {
    ellipse(x-3, y+17, 3, 3);
  }
  // zone interactive oeil////////

  if (dist(mouseX, mouseY, x, y-11)<=71/2) {//affiche un curseur main au niveau de la zone interactive.
    cursor(HAND);
  }

  tempsEcoule=millis()-timeStamp2;//Minuterie variable permettant une légère variation de la vitesse d'apparition des lasers.
  if (tempsEcoule>=interval) {
    timeStamp2=millis();
    v=int(random(400));
    interval=int(random(100, 150));
  }

  if (etatOeil==1) {//Si click dans l'oeil, creéation de lasers aux coordonées dépendant de deux tableaux.
    couleurOeil=color(random(255));


    int X=laserX[v];
    int Y=laserY[v];

    stroke(56, 206, 150, 50);
    strokeWeight(random(1, 30));
    line(x, y-11, X, Y+100);
    noStroke();
    stroke(56, 206, 150);
    strokeWeight(2);
    line(x, y-11, X, Y+100);
    noStroke();    
    stroke(56, 206, 150, 50);
    strokeWeight(random(1, 30));
    line(x, y-11, X+100, Y+100);
    noStroke();
    stroke(56, 206, 150);
    strokeWeight(2);
    line(x, y-11, X+100, Y+100);
    noStroke();
    strokeWeight(1);
  }
  else {
    couleurOeil=color(247, 233, 224);
  }

  //Couleur Variable////////////////////////////////////////
  tempsE=millis()-timeStamp;


  if (tempsE>=1000) {// à 1sec la couleur cible est désignée.
    cible=200;
  } 
  if (tempsE>=2400) {//à 2sec la couleur cible reprend sa valeur initiale.
    cible=0;
    timeStamp=millis();
  }
  float distance = abs(cible - courant);

  if ( courant < cible ) {
    courant = courant +min( vitesseCouleur, distance);
  } 
  else {
    courant = courant - min(vitesseCouleur, distance);
  }
}


void soleil() {

  noStroke();

  translate(x, y-11);

  fill(222, 255, 41, 80);
  ellipse(0, 0, 8, 8);//soleil//

  angle=0;
  rotate(radians(angle2));
  angle2=angle2+5;

  pushMatrix(); 

  for (int i=0; i<=8; i++) {//Création de 8 rayons disposés à radian (angle).
    rotate(radians(angle));
    stroke(222, 255, 41, 80);
    strokeWeight(1);
    line(10, 0, 5, 0);

    angle=angle+45;
    noStroke();
    strokeWeight(1);
  }
  popMatrix();
}





void mousePressed() {

  //heloWorld
  boolean helloWorld1=mouseX>x+50;//condition zone interactive rectangulaire du bras droit.
  boolean helloWorld2=mouseX<x+150;
  boolean helloWorld3=mouseY>y-50;
  boolean helloWorld4=mouseY<y+150;
  if (helloWorld1 && helloWorld2 && helloWorld3 && helloWorld4) {
    etat=1;
  }
  //laser oeil
  float rayonZone=71/2;//condition zone interactive circulaire de l'oeil.
  float Distance= dist(mouseX, mouseY, x, y-11);

  if (Distance<=rayonZone) {//etat oeil
    if (etatOeil==0) {
      etatOeil=1;
    }
    else {
      etatOeil=0;
    }
  }
  if (mouseX>x-38 && mouseX<x+38 && mouseY>y+24 && mouseY<y+50) {//etat bouche
    if (etatBouche==0) {
      etatBouche=1;
    }
    else {
      etatBouche=0;
    }
  }
}




void mouseReleased() {
  etat=0;
}







void cheveux() {//Cheuveux crée 3 mèches d'ellipse en mouvement

  translate(x, y-45);
  pushMatrix();
  for (int i=0;i<=9;i++) {
    fill(courant, 170, 53); 
    rotate(radians(cos(r)*7));
    ellipse(0, i*-7, 20-i*2, 20-i*2);
  }
  popMatrix();


  rotate(PI/6);
  pushMatrix();
  for (int j=0;j<=9;j++) {
    fill(courant, 170, 53);
    rotate(radians(cos(r)*7));
    ellipse(10, j*-7, 20-j*2, 20-j*2);
  }
  popMatrix();

  rotate(10*PI/6);
  pushMatrix();
  for (int k=0;k<=9;k++) {
    fill(courant, 170, 53);
    rotate(radians(cos(r)*7));
    ellipse(-10, k*-7, 20-k*2, 20-k*2);
  }
  popMatrix();

  r+=0.045;
}






void salive() {

  translate(x-40, y+37);

  for (int i=0;i<35;i++) {
    float r=tabRayon[i];
    fill(255);
    ellipse(tabX[i]+frameC, 0, r, r);
    tabRayon[i]++;

    if (tabRayon[i]>=15) {
      tabRayon[i]=1;
    }
  }
  for (int j=0;j<10;j++) {
    ellipse(tabX[j], z+j*2, tabRayon[j], tabRayon[j]);
    z+=0.3;
    if (z>=40) {
      z=0;
      tabX[j]=random(80);
    }
  }
}



