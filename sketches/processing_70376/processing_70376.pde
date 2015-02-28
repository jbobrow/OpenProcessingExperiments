
// Monstre interactif
// Par Gabrielle Sigmen Mercier
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

// Variables

PImage imageLabo;
PImage imageErlen;

float x = 200;
float y = 200;

//couleur corps
float rCourante, gCourante, bCourante; 
float rCiblee, gCiblee, bCiblee;
float rVitesse, gVitesse, bVitesse;

//zone rect. du clic couleur corps
float rectXc = 100; 
float rectYc = 120;
float rectHc = 85;
float rectWc = 200;

// tableau des yeux
int yeux = 160; 
float[] yeuxX; 
float [] yeuxY;

// tableau araignées
int araignees = 15; 
float[] ax;
float[] ay;
color[] ac;
float[] av;

// dessin bouche
float rectX = x-40;
float rectY = y-21;
float rectW = 82;
float rectH = 12;
float gauche = rectX ;
float droite = rectX+rectW;
float haut = rectY;
float bas = rectY+rectH;

//bulles de texte sur bouche, variable random
int r;
int montrerBulle; //état


  ////////////////////////////////////SETUP//////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////

  void setup () {

    //scene
    size(400, 400);
    smooth();
    ellipseMode(CENTER);

    imageLabo = loadImage("labo.png"); 
    imageErlen = loadImage("erlenmeyer2.png");

    //tableau des yeux
    yeuxX = new float[yeux]; 
    yeuxY = new float[yeux]; 

    //tableau araignées 
    ax = new float[araignees];
    ay = new float[araignees];
    ac = new color[araignees];
    av = new float[araignees];

    ///////////////////////////////////////////////////////////////////////////////////

    for ( int i =0; i < araignees; i++ ) {
      ax[i] = random(width);
      ay[i] = random(230, 410);
      ac[i] = color( random(256), random(256), random(256) );
      av[i] = random(1, 2);
    }
  }


  ///////////////////////////////////DRAW////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////

  void draw () {

    // Arriere plan
    background(0);
    image(imageLabo, 0, 0, 400, 400);
    //  fill(106, 89, 62);
    //  strokeWeight(0);
    //  rect(0, 175, 400, 225);

    // mouvement tableau araignées
    for ( int i = 0; i < araignees; i=i+1 ) { 
      ax[i] = ax[i] + av[i];
      if ( ax[i] > width+15 ) { 
        ax[i] = -20;
        ay[i] = random(250, 410);
      }
      araignees(ax[i], ay[i], ac[i]);
    }

    //Affichage Erlenmeyer
    tint(255, 180);
    image(imageErlen, 250, 0);

    tint(255, 255);

    pattes();

    anthennes();

    corps();

    oeilHaut1();
    oeilHaut2();
    oeilHaut3();    

    yeux();

    bouche();

    // Affichage bulles texte
    // Probabilité


      if (montrerBulle == 1) {
      switch(r) {
      case 0:
        bulle1();
        break;
      case 1:
        bulle2();
        break;
      case 2:
        bulle3();
        break;
      } 
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////

  void mousePressed() {

    r = (int) random(3); 
    if ( mouseX > gauche && mouseX < droite-10 && mouseY > haut && mouseY < bas ) {
      montrerBulle = 1;
    } else {
      montrerBulle = 0;
    }

    // Changement de couleur et assouplissement du corps
    if ( mouseX > rectXc && mouseX < rectXc + rectWc && mouseY > rectYc && mouseY < rectYc + rectHc ) {
      rCiblee = random(255);
      gCiblee = random(255);
      bCiblee = random(255);
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  void mouseReleased() {
    if (montrerBulle == 1) {
      montrerBulle = 0;
    }
  }

  ////////////////////////////////DESSINS////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////

  void pattes() {

    fill(0);
    strokeWeight(3);

    float arrivey = y+190;

    //gauche
    float departx = x-55;
    float departy = y-5;

    line(departx, departy, x-160, y-125);
    line(departx, departy, x-132, y-75);
    line(departx, departy, x-107, y-38);
    line(departx, departy, x-95, y-17);
    line(x-160, y-125, x-110, arrivey);
    line(x-132, y-76, x-107, arrivey);
    line(x-107, y-38, x-104, arrivey);
    line(x-95, y-17, x-79, y+76);

    //droite

    float startx = x+85;
    float starty = y-17;

    line(startx, starty, x+175, y-125);
    line(startx, starty, x+148, y-75);
    line(startx, starty, x+130, y-38);
    line(startx, starty, x+118, y-20);
    line(x+175, y-125, x+101, arrivey);
    line(x+148, y-75, x+98, arrivey);
    line(x+130, y-38, x+95, arrivey);
    line(x+118, y-20, x+86, y+76);
  }

  ///////////////////////////////////////////////////////////////////////////////////

  void anthennes() {
    noFill();
    strokeWeight(3);

    arc(x+58, y-27, 90, 165, PI, PI+HALF_PI);
    arc(x+27, y-83, 75, 170, PI, PI+HALF_PI);
    arc(x-60, y-46, 80, 160, PI+HALF_PI, TWO_PI);
  }

  ///////////////////////////////////////////////////////////////////////////////////

  void corps() {
    //Corps________________________________________

    float k = 0.5; //couleur corps, assouplissement
    float d = 0.90;//couleur corps, assouplissement

    rVitesse = d * (rVitesse + k * (rCiblee - rCourante));
    rCourante = rCourante + rVitesse;
    gVitesse = d * (gVitesse + k * (gCiblee - gCourante));
    gCourante = gCourante + gVitesse;
    bVitesse = d * (bVitesse + k * (bCiblee - bCourante));
    bCourante = bCourante + bVitesse;

    fill(rCourante, gCourante, bCourante );
    strokeWeight (2);

    beginShape();
    curveVertex(x-19, y-93); 
    curveVertex(x+11, y-85);
    curveVertex(x+32, y-68); 
    curveVertex(x+57, y-67); 
    curveVertex(x+77, y-65);
    curveVertex(x+96, y-57); 
    curveVertex(x+107, y-28);
    curveVertex(x+93, y-2);
    curveVertex(x+64, y-2);
    curveVertex(x+48, y+2);
    curveVertex(x+27, y);
    curveVertex(x-14, y+8);
    curveVertex(x-36, y+10); 
    curveVertex(x-68, y+3); 
    curveVertex(x-90, y-30); 
    curveVertex(x-84, y-61); 
    curveVertex(x-70, y-66);
    curveVertex(x-58, y-70); 
    curveVertex(x-40, y-80);
    curveVertex(x-19, y-93);
    curveVertex(x+11, y-85);
    endShape(CLOSE);
  }

  ///////////////////////////////////////////////////////////////////////////////////

  // oeilHaut1-2-3

  void oeilHaut1() {
    //oeil haut 1
    if (mousePressed && mouseX > 120 && mouseX < 145 && mouseY > 60 && mouseY < 85 ) { //fermer l'oeil
      fill (0);
      ellipse(x-70, y-126, 25, 25);
    } 
    else {
      strokeWeight(2);
      fill (255);
      ellipse(x-70, y-126, 25, 25);
    }  
    pupilleHaut1();
  }

  void oeilHaut2() {
    //oeil haut 2
    if (mousePressed && mouseX > 222 && mouseX < 248 && mouseY > 23 && mouseY < 49 ) { //fermer l'oeil
      fill (0);
      ellipse(x+35, y-164, 25, 25);
    } 
    else {
      strokeWeight(2);
      fill (255);
      ellipse(x+35, y-164, 25, 25);
    }
    pupilleHaut2();
  }

  void oeilHaut3() {
    //oeil haut 3
    if (mousePressed && mouseX > 255 && mouseX < 281 && mouseY > 79 && mouseY < 105 ) { //fermer l'oeil
      fill (0);
      ellipse(x+68, y-108, 25, 25);
    } 
    else {    
      strokeWeight(2);
      fill (255);
      ellipse(x+68, y-108, 25, 25);
    }
    pupilleHaut3();
  }

  ///////////////////////////////////////////////////////////////////////////////////

  void yeux() {
    if (mousePressed && mouseX > 120 && mouseX < 290 && mouseY > 145 && mouseY < 165 ) {
      for (int i = 0; i < yeux ; i = i+25) {
        if (yeux > i) {
          yeuxX[i] = i + 130;
          yeuxY[i] = 155;
          fill(0);
          yeuxFermes(yeuxX[i], yeuxY[i]);
        }
      }
    } 
    else {

      strokeWeight(1);
      fill (255);
      // dessin yeux
      for (int i = 0; i < yeux ; i = i+25) {
        if (yeux > i) {
          yeuxX[i] = i + 130;
          yeuxY[i] = 155;
          fill (255);
          dessinYeux(yeuxX[i], yeuxY[i]);
        }
      }
      // dessin pupilles  
      for (int i = 0; i < yeux ; i = i+25) {
        if (yeux > i) {
          yeuxX[i] = i + 130;
          yeuxY[i] = 155;
          fill(255);
          strokeWeight(1);
          pupilles(yeuxX[i], yeuxY[i]);
        }
      }
    }
  }

  /////////////
  void dessinYeux(float yeuxX, float yeuxY) {

    ellipse ( yeuxX, yeuxY, 20, 20);
  }
  ////////////
  void yeuxFermes(float yeuxX, float yeuxY) {
    line ((yeuxX-7), (yeuxY), (yeuxX+7), (yeuxY));
  }

  ///////////////////////////////////////////////////////////////////////////////////
  // pupilleHaut1-2-3

  void pupilleHaut1() {
    //mouvement suivre souris
    float radians = atan2(mouseY-(y-126), mouseX-(x-70));
    float distance = dist(mouseX, mouseY, (x-70), (y-126));
    distance = constrain(distance, 0, 25/2 - 4);
    // variables pupille 
    float pupilleX = cos(radians)* distance + (x-70);
    float pupilleY = sin(radians)* distance + (y-126);

    fill(0);
    strokeWeight(3);
    point(pupilleX, pupilleY);
  }

  void pupilleHaut2() {
    //mouvement suivre souris
    float radians = atan2(mouseY-(y-164), mouseX-(x+35));
    float distance = dist(mouseX, mouseY, (x+35), (y-164));
    distance = constrain(distance, 0, 25/2 - 4);
    // variables pupille  
    float pupilleX = cos(radians)* distance + (x+35);
    float pupilleY = sin(radians)* distance + (y-164);

    fill(0);
    strokeWeight(3);
    point(pupilleX, pupilleY);
  }
  void pupilleHaut3() {
    //mouvement suivre souris
    float radians = atan2(mouseY-(y-108), mouseX-(x+68));
    float distance = dist(mouseX, mouseY, (x+68), (y-108));
    distance = constrain(distance, 0, 25/2 - 4);
    // variables pupille 
    float pupilleX = cos(radians)* distance + (x+68);
    float pupilleY = sin(radians)* distance + (y-108);
    //  float pupilleX4 = cos(radians)* distance3 + (x-70);
    //  float pupilleY4 = sin(radians)* distance3 + (y-42);
    //dessin 
    fill(0);
    strokeWeight(3);
    point(pupilleX, pupilleY);
  }

  void pupilles(float yeuxX, float yeuxY) {

    //mouvement suivre souris
    float radians = atan2(mouseY-yeuxY, mouseX-yeuxX);
    float distance = dist(mouseX, mouseY, yeuxX, yeuxY);
    distance = constrain(distance, 0, 25/2 - 5);
    // variables pupille 
    float pupilleX = cos(radians)* distance + (yeuxX);
    float pupilleY = sin(radians)* distance + (yeuxY);
    //dessin 
    fill(0);
    strokeWeight(3);
    point(pupilleX, pupilleY);
  }


  ///////////////////////////////////////////////////////////////////////////////////

  void bouche() {

    if ( mouseX > gauche && mouseX < droite-10 && mouseY > haut && mouseY < bas ) { // mouseOver
      fill(255);
      strokeWeight(10);
      stroke(255);
      strokeJoin(ROUND);
      rect(rectX, rectY, rectW, rectH);

      stroke(0);
      strokeWeight(1);

      line(x-44, y-15, mouseX, y-15);
      line(mouseX, y-15, mouseX+8, y-7);
      line(mouseX+8, y-7, mouseX+12, y-19);
      line(mouseX+12, y-19, mouseX+15, y-15);
      line(mouseX+15, y-15, x+46, y-15);
    } 
    else { // bouche normale
      fill(255);
      strokeWeight(10);
      stroke(255);
      strokeJoin(ROUND);
      rect(rectX, rectY, rectW, rectH);

      stroke(0);
      strokeWeight(1);

      line(x-44, y-15, x+20, y-15);
      line(x+20, y-15, x+28, y-7);
      line(x+28, y-7, x+32, y-19);
      line(x+32, y-19, x+35, y-15);
      line(x+35, y-15, x+46, y-15);
    }
  }


  ///////////////////////////////////////////////////////////////////////////////////

  void araignees(float ax, float ay, color ac) {

    float rayon = 15;

    //pattes 
    strokeWeight(1);
    fill(0);
    //droite
    line(ax, ay, ax+18, ay-7);
    line(ax, ay, ax+15, ay-2);
    line(ax, ay, ax+13, ay+3);

    line(ax+18, ay-7, ax+12, ay+10);
    line(ax+15, ay-2, ax+10, ay+10);
    line(ax+13, ay+3, ax+8, ay+10);

    //gauche
    line(ax, ay, ax-18, ay-7);
    line(ax, ay, ax-15, ay-2);
    line(ax, ay, ax-13, ay+3);

    line(ax-18, ay-7, ax-12, ay+10);
    line(ax-15, ay-2, ax-10, ay+10);
    line(ax-13, ay+3, ax-8, ay+10);

    // Corps
    fill(ac);
    ellipse(ax, ay, rayon+5, rayon);
  }


  void bulle1() {
    fill(255);
    strokeWeight(2);
    stroke(0);
    ellipse (80, 100, 100, 40);
    ellipse (140, 115, 20, 10);
    fill (0);
    textAlign (CENTER,CENTER);
    text("BLLLEAA!!", 80, 100);
  }

  void bulle2() {
    fill(255);
    strokeWeight(2);
    stroke(0);
    ellipse (340, 80, 110, 60);
    ellipse (290, 110, 20, 10);
    ellipse (270, 120, 10, 7);
    fill (0);
    textAlign (CENTER,CENTER);
    text("OMG.. it's not\nFUNNNYY!", 340, 80);
  }

  void bulle3() {
    fill(255);
    strokeWeight(2);
    stroke(0);
    ellipse (130, 250, 90, 60);
    ellipse (140, 215, 20, 10);
    fill (0);
    textAlign (CENTER,CENTER);
    text("OOOOOH!!\nOH!!", 130, 250);
  }


