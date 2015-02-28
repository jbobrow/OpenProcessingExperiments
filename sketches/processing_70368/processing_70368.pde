
int click =0;
int click2 =0;
int monstreState = 0;
float[][] tabGris = new float[4][5];
float[][] pelouse = new float[300][4];


float posNuageVitesse = 1;
float posNuage=100;
float sizeNuageX = 150;
float sizeNuageY = 60;

float i=0;

float x = 200;
float y = 200;

float x1 =200;
float x2 =230;
float x3 =260;
float y1 =200;
float y2 =225;
float y3 =250;

float xEllipse = 140;
float yEllipse = -40;
int sizeEllipse = 25;

void setup() {
  size(400, 400);
  background(255, 255, 255);
  smooth();
  setTabgris();
  createPelouseStyle();
}






void draw() {

  /****************************
   GAZON + CIEL
   ****************************/

  noStroke();
  fill(2, 240, 31);
  rect(0, 175, 400, 275);

  int PELOUSE = 1;




  noStroke();
  fill(56, 222, 250);
  rect(0, 0, 400, 175);


  for (int i=0; i < 300; i++) { //herbe aleatoire


    stroke(0, pelouse[i][2], 0);
    line(pelouse[i][0], pelouse[i][1] +175, pelouse[i][0], pelouse[i][1] + 175 - pelouse[i][3]);
  }

  //NUAGE
  drawNuage();


  if (mousePressed) {
    float distance = dist( mouseX, mouseY, x + 20.0, y + 50.0);
    if ( distance < 105.0 ) {
      if (click2 == 0) { 
        click2 = 1;
      }
      if (click2 == 1) {
        y = y + sin(i) *6;
        y1 = y1 + sin(i+PI/2) *0.5;
        y2 = y2 + sin(i+PI) *2;
        y3 = y3 + sin(i+(3*PI/2)) *4;


        println(y);

        i += TWO_PI/30;
        if (i == TWO_PI) { 
          click2 = 0;
        }
      }
    }
  }
  drawChaine();
  buildChateau();


  if (click == 1) {
    setTabgris();
    buildChateau();
  }


  /****************************
   Poteau
   ****************************/


  stroke(0);
  fill(183, 102, 15);
  //rect(x-170, y-50, 30, 50);
  rect(30, 150, 30, 50);




  //Chaine


  /* while (i < 3) {
   fill(90);
   ellipse(x - xEllipse, y + yEllipse, sizeEllipse, sizeEllipse); 
   
   // xEllipse = pow(xEllipse, 0.8);
   // yEllipse =  pow(yEllipse, 0.8);
   // sizeEllipse += 10;
   // i++;
   
   xEllipse -= 30;
   yEllipse += 25;
   sizeEllipse += 10;
   i++;
   }
   
   */
  drawChaine();
  drawMonstre();


  /*****************************
   MONSTRE
   ************************/

  //drawMonstre();
}

void buildChateau() {
  //chateau
  int xBrique = 250;
  int yBrique = -10;

  for (int i=0; i<4; i++) {

    for (int j=0; j<5; j++) {


      stroke(0);

      fill(tabGris[i][j]);
      rect(xBrique, yBrique, 50, 40);

      for (int k=0; k < 30; k++) {

        float xPierre = random(xBrique +3, xBrique-3);
        float yPierre = random(yBrique +3, yBrique-5);
        float couleurPierre = random(75, 150);
        float longueurPierre = random(2);



        stroke(couleurPierre);
        line(xPierre, yPierre, xPierre, yPierre + longueurPierre);
      }

      yBrique += 40;
    }
    yBrique = -10;
    xBrique += 50;
  }
}

void setTabgris() {

  for (int i=0; i<4; i++) {

    for (int j=0; j<5; j++) {



      float gris = random(100, 160);
      tabGris[i][j] = gris;
    }
  }
}

//FONCTION DESSIN LA PELOUSE

void createPelouseStyle() {


  for (int i=0; i < 300; i++) {

    pelouse[i][0] = random(400);
    pelouse[i][1] = random(225);
    pelouse[i][2] = random(255);
    pelouse[i][3] = random(6);
  }
}

//FONCTION DESSINER LE MONSTRE

void drawMonstre() {
  stroke(0, 50);
  fill(0); //tete
  ellipse(x + 20, y + 50, 210, 210);

  fill(255); //yeux
  ellipse (x -35, y, 50, 45);
  ellipse (x +75, y, 50, 45);

  fill(0);
  ellipse (x -35, y, 25, 20);
  ellipse (x +75, y, 25, 20);

  fill(190, 0, 0); //bouche
  beginShape();
  /*curveVertex(148.0, 261.0);
   curveVertex(261.0, 310.0);
   curveVertex(320.0, 273.0);
   curveVertex(221.0, 243.0);
   curveVertex(119.0, 270.0);
   curveVertex(176.0, 308.0);
   curveVertex(319.0, 233.0);
   */
  curveVertex(x -52.0, y + 61.0);
  curveVertex(x + 61.0, y +110.0);
  curveVertex(x + 120.0, y +73.0);
  curveVertex(x +21.0, y +43.0);
  curveVertex(x -81.0, y +70.0);
  curveVertex(x - 24.0, y +108.0);
  curveVertex(x +119.0, y +33.0);
  endShape();

  /**********************
   DENTS
   ************************/

  fill(255);

  triangle(x-60, y + 100, x-40, y+110, x-45, y+80);

  triangle(x-40, y + 110, x-10, y+110, x-20, y+80);
  triangle(x-10, y + 110, x+20, y+110, x+5, y+80);
  triangle(x+20, y + 110, x+50, y+110, x+35, y+80);
  triangle(x+50, y + 110, x+80, y+110, x+65, y+80);

  triangle(x+80, y + 110, x+100, y+100, x+85, y+80);




  triangle(x-60, y + 57, x-40, y+49, x-45, y+80);

  triangle(x-40, y + 50, x-10, y+45, x-20, y+80);
  triangle(x-10, y + 45, x+20, y+43, x+5, y+80);
  triangle(x+20, y + 43, x+50, y+45, x+35, y+80);
  triangle(x+50, y + 45, x+80, y+50, x+65, y+80);

  triangle(x+80, y + 50, x+100, y+57, x+85, y+80);
}

void drawChaine() {
  fill(90);
  ellipse(x1 - xEllipse, y1 + yEllipse, sizeEllipse, sizeEllipse); 
  ellipse(x2 - xEllipse, y2 + yEllipse, sizeEllipse+10, sizeEllipse+10); 
  ellipse(x3 - xEllipse, y3 + yEllipse, sizeEllipse+20, sizeEllipse+20);
}



void mousePressed() {
  if (mouseX > 250 && mouseX < 400 && mouseY > 0 && mouseY < 200) { 
    click =1;
  }
}


void mouseReleased() {
  click = 0;
}

//passage nuage

void drawNuage() {
  fill(240);
  noStroke();
  ellipse(posNuage, 0, sizeNuageX, sizeNuageY);
  posNuage -= posNuageVitesse;
  if (posNuage < -100) {
    posNuage = 250;
    sizeNuageX= random(90, 170);
    sizeNuageY = random(30, 90);
    posNuageVitesse = random(0.3, 1);
  }
}


