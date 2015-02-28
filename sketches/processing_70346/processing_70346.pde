
/* *******************************************************************************************************************************
 Monstre intéractif de Kim Guilbault
 TP3 dans le cours EDM4600  
 
  Animations
  - On peut lui voler son chapeau.
  - On peut lui "poker" l'oeil gauche ou l'oeil droit
  - Des mouches volent autour des déchets
  - Les yeux suivent la souris
  
  Sources
  Je me suis inspiré de http://www.openprocessing.org/sketch/69121 pour reproduire les mouches sinon j'ai codé à partir de mes notes
  de cours.
 ******************************************************************************************************************************** */


//VARIABLES GLOBALES
//Pour la position du personnage
float x;
float y;

//Pour la position du chapeau
float xChapeau;
float yChapeau;
int largeurChapeau;
int hauteurChapeau;

//Pour la position de la base du chapeau  
float xChapeauBase;
float yChapeauBase;
int largeurBaseChapeau;
int hauteurBaseChapeau;

//Pour animer le chapeau
boolean tenirChapeau = false;

//Pour animer les yeux
boolean pockOeilDroit = false;
boolean pockOeilGauche = false;
int incrementationOeilDroit;
float distanceOeilDroit;
float distanceOeilGauche;

//Yeux
float yeuxGaucheX;
float yeuxGaucheY;
float yeuxDroiteX;
float yeuxDroiteY;
float yeuxDiametre = 30;
int oeilHauteurDroit = 30;
int oeilHauteurGauche = 30;
int pupilleDiametre;

//Tableau de mouches
final int nbrMouches = 50;
float [] tableauMouchesX;
float [] tableauMouchesY;


void setup() {
  size(400, 400);
  smooth();

  //Chapeau
  xChapeau = (width/2) - 17.5;
  yChapeau = (height/2) -130;
  largeurChapeau = 35;
  hauteurChapeau = 40;
  
  //Base chapeau
  xChapeauBase = (width/2) - 25;
  yChapeauBase = (height/2) - 95;
  largeurBaseChapeau = 50;
  hauteurBaseChapeau = 10;

  //Tableau de mouches
  tableauMouchesX = new float[nbrMouches];
  tableauMouchesY = new float[nbrMouches];
  
  //Remplir le tableau de mouche de valeures aléatoires
  int i = 0;
  while ( i < nbrMouches ) {
    tableauMouchesX[i] = random(-10, 130);
    tableauMouchesY[i] = random(100, 300);
    i = i+1;
  }
    
}

void draw() {
  background(50);
  dessinerDecor();

  //Positionner le monstre dans le milieu de la scène
  x = width/2;
  y = height/2;

  strokeWeight(1);
  stroke(0);

  //Pieds 
  int piedLargeur = 13;
  int piedHauteur = 50;

  fill(0);
  rect(x+25, y+125, piedLargeur, piedHauteur); //Gauche
  beginShape();
  curveVertex(x, y+174);
  curveVertex(x+37, y+159);
  curveVertex(x+60, y+174);
  curveVertex(x+30, y+174);
  curveVertex(x, y+174);
  endShape();

  rect(x-40, y+125, piedLargeur, piedHauteur); //Droit
  beginShape();
  curveVertex(x, y+174);
  curveVertex(x-37, y+159);
  curveVertex(x-60, y+174);
  curveVertex(x-30, y+174);
  curveVertex(x, y+174);
  endShape();

  //Corps du monstre
  beginShape();
  vertex(x+40, y-20);
  vertex(x+70, y+100);
  vertex(x, y+175);
  vertex(x-70, y+100);
  vertex(x-40, y-20);
  endShape();

  //Habit 
  fill(140);
  quad(x+25, y-35, x+25, y+100, x-25, y+100, x-25, y-35);

  //Tête
  arc(x, y-85, 120, 130, 0, PI);

  //Oreilles 
  triangle(x-60, y-105, x-25, y-85, x-60, y-85); //Gauche
  triangle(x+60, y-105, x+25, y-85, x+60, y-85); //Droite
  stroke(140);
  line(x-25, y-85, x-59, y-85); //Gauche
  line(x+25, y-85, x+59, y-85); //Droite

  //Intérieur d'oreilles
  noStroke();
  fill(250, 212, 212);
  triangle(x+57, y-98, x+45, y-85, x+57, y-82);
  triangle(x-57, y-98, x-45, y-85, x-57, y-82);

  //Nez
  quad(x, y-45, x+10, y-35, x, y-23, x-10, y-35);

  //Noeud papillon
  fill(0);
  noStroke();
  beginShape();
  vertex(x+20, y-20); //Coin supérieur droit
  vertex(x+20, y);
  vertex(x+5, y-5);
  vertex(x-5, y-5);
  vertex(x-20, y);
  vertex(x-20, y-20);
  vertex(x-5, y-15);
  vertex(x+5, y-15);
  vertex(x+20, y-20);
  endShape();
  stroke(0);

  //Queue petite
  fill(30);
  beginShape();
  vertex(x+85, y+83); //Point le plus à gauche de la queue
  vertex(x+120, y+67);
  vertex(x+160, y+100);
  vertex(x+95, y+110);
  vertex(x+85, y+83);
  endShape();

  //Queue moyenne
  fill(10);
  beginShape();
  vertex(x+70, y+100); //Point le plus bas de la queue
  vertex(x+69, y+87);
  vertex(x+80, y+75);
  vertex(x+95, y+20);
  vertex(x+190, y-30);
  vertex(x+180, y+60);
  vertex(x+85, y+83);
  vertex(x+70, y+100);
  endShape();

  //Queue grande
  fill(0);
  beginShape();
  vertex(x+70, y+100); //Point le plus bas de la queue
  vertex(x+69, y+87);
  vertex(x+80, y+75);
  vertex(x+65, y-10);
  vertex(x+150, y-80);
  vertex(x+155, y+40);
  vertex(x+85, y+83);
  vertex(x+70, y+100);
  endShape();

  //Rayures queue grande
  fill(255);
  quad(x+65.5, y-10.5, x+75, y-18.5, x+90, y+80, x+80, y+90);
  quad(x+85, y-26.5, x+95, y-34.5, x+110, y+68, x+100, y+74);
  quad(x+105, y-42.5, x+115, y-51.5, x+130, y+55, x+120, y+62);
  quad(x+125, y-59.5, x+135, y-67.5, x+150, y+43, x+140, y+50);
  quad(x+145, y-76.5, x+150, y-79.5, x+155, y, x+155, y+40);


  //Bandeau sur les yeux
  fill(0);
  strokeJoin(ROUND);
  strokeWeight(20);
  beginShape();
  vertex(x-30, y-70); 
  vertex(x+30, y-70);
  vertex(x+30, y-50);
  vertex(x-30, y-50);
  vertex(x-30, y-70);
  endShape();
  strokeWeight(1);

  //Yeux 
  yeuxGaucheX = x-20;
  yeuxGaucheY = y-60;
  yeuxDroiteX = x+20;
  yeuxDroiteY = y-60;
  pupilleDiametre = 15;

  fill(255);
  ellipse(yeuxGaucheX, yeuxGaucheY, yeuxDiametre, oeilHauteurGauche); //Gauche
  ellipse(yeuxDroiteX, yeuxDroiteY, yeuxDiametre, oeilHauteurDroit); //Droit
 
  //Yeux suivent la souris
  //gauche
  float radiansOeilGauche = atan2(mouseY-yeuxGaucheY, mouseX-yeuxGaucheX);
  float distanceOeilGauche = dist(mouseX, mouseY, yeuxGaucheX, yeuxGaucheY);
  distanceOeilGauche = constrain(distanceOeilGauche, 0, yeuxDiametre/2 - pupilleDiametre/2);
  float pupilleGaucheX = cos(radiansOeilGauche) * distanceOeilGauche + yeuxGaucheX;
  float pupilleGaucheY = sin(radiansOeilGauche) * distanceOeilGauche + yeuxGaucheY;

  //droit
  float radiansOeilDroite = atan2(mouseY-yeuxDroiteY, mouseX-yeuxDroiteX);
  float distanceOeilDroite = dist(mouseX, mouseY, yeuxDroiteX, yeuxDroiteY);
  distanceOeilDroite = constrain(distanceOeilDroite, 0, yeuxDiametre/2 - pupilleDiametre/2);
  float pupilleDroiteX = cos(radiansOeilDroite) * distanceOeilDroite + yeuxDroiteX;
  float pupilleDroiteY = sin(radiansOeilDroite) * distanceOeilDroite + yeuxDroiteY;
  
  //Dessiner la pupille
  fill(0);
  ellipse(pupilleGaucheX, pupilleGaucheY, pupilleDiametre, pupilleDiametre); //Gauche
  ellipse(pupilleDroiteX, pupilleDroiteY, pupilleDiametre, pupilleDiametre); //Droit

  //Vérifier si l'état de l'oeil est à true et s'il est plus grand que 0
  if (pockOeilDroit == true && oeilHauteurDroit > 0 ) {
    oeilHauteurDroit -= 3;
    sourcilFache();
  }
  else if (oeilHauteurDroit <= 0) {
    oeilHauteurDroit = 30;
    pockOeilDroit = false;
  }
  //Vérifier si l'état de l'oeil est à true et s'il est plus grand que 0
  if (pockOeilGauche == true && oeilHauteurGauche > 0 ) {
    oeilHauteurGauche -= 3;
    sourcilFache();
  }
  else if (oeilHauteurGauche <= 0) {
    oeilHauteurGauche = 30;
    pockOeilGauche = false;
  }

  //Chapeau
  if (tenirChapeau == true) {
    
    //Faire suivre la souris
    xChapeau = mouseX - (largeurChapeau / 2)  ;
    yChapeau = mouseY - (hauteurChapeau / 2)  ;
    xChapeauBase = mouseX - (largeurBaseChapeau / 2);
    yChapeauBase = mouseY + hauteurChapeau / 2;

    sourcilFache();
  }
  //Sinon, il retourne sur la tête du monstre
  else {
    float facteur = 0.2;

    xChapeau = (((width/2) - 17.5) - xChapeau) * facteur + xChapeau;
    yChapeau = (((height/2) - 130) - yChapeau) * facteur + yChapeau;
    xChapeauBase = (((width/2) - 25) - xChapeauBase) * facteur + xChapeauBase;
    yChapeauBase = (((height/2) - 95) - yChapeauBase) * facteur + yChapeauBase;
  }
  //Dessiner le chapeau
  fill(0);
  stroke(0);
  rect(xChapeauBase, yChapeauBase, largeurBaseChapeau, hauteurBaseChapeau);
  rect(xChapeau, yChapeau, largeurChapeau, hauteurChapeau);
   
  //Vérifier si la souris clique dans le chapeau
  if (mousePressed) {
    if ((mouseX > (xChapeau) && mouseX < (xChapeau) + largeurChapeau && mouseY > (yChapeau) && mouseY < (yChapeau) + hauteurChapeau) || (mouseX > (xChapeauBase) && mouseX < (xChapeauBase) + largeurBaseChapeau && mouseY > (yChapeauBase) && mouseY < (yChapeauBase) + hauteurBaseChapeau ) ) {
      tenirChapeau = true;
    }
  }

  //Tableau de mouches
  for ( int j = 0; j < nbrMouches ; j += 1 ) {
    tableauMouchesX[j] = tableauMouchesX[j] + random(-5, 5);
    tableauMouchesY[j] = tableauMouchesY[j] + random(-5, 5);
 
  //Si les mouches dépassent le cadre invisible ou leur réasigne une valeur aléatoire
  if (tableauMouchesX[j] >= 130 || tableauMouchesX[j] <= -10 || tableauMouchesY[j] >= 300 || tableauMouchesY[j] <= 100) {
    tableauMouchesX[j] = random(-10, 130);
    tableauMouchesY[j] = random(100, 300);
  }
  //Dessine les mouches  
  noStroke();
  fill (0);
  ellipse( tableauMouchesX[j], tableauMouchesY[j], random(1,3), random(1,3));
  }
  

}//fin void draw()


void sourcilFache() {
  noStroke();
  fill(80);

  //Sourcil gauche
  float radiansCarre = 0.3;
  pushMatrix(); 
  rotate(radiansCarre); 
  rect(198, 64, 30, 5); 
  popMatrix(); 

  //Sourcil droit
  float radiansCarre2 = -0.3;
  pushMatrix(); 
  rotate(radiansCarre2); 
  rect(155, 182, 30, 5); 
  popMatrix(); 
}// Fin void sourcilFache()


void mousePressed() {

  //Vérifier si la souris clique l'oeil droit
  distanceOeilDroit = dist(mouseX, mouseY, yeuxDroiteX, yeuxDroiteY);

  //Oeil Droit
  if (distanceOeilDroit < (yeuxDiametre / 2)) {
    pockOeilDroit = true;
  }
  //Vérifier si la souris clique l'oeil Gauche
  distanceOeilGauche = dist(mouseX, mouseY, yeuxGaucheX, yeuxGaucheY);

  //Oeil Gauche
  if (distanceOeilGauche < (yeuxDiametre / 2)) {
    pockOeilGauche = true;
  }
}//Fin void mousePressed()



void mouseReleased() {
  tenirChapeau = false;
}//Fin void mouseReleased()


void dessinerDecor() {

  //Rangées de briques
  fill(71, 6, 3);
  rect(0, 0, 400, 224);
  fill(158, 13, 7);
  stroke(158, 13, 7);
  strokeJoin(ROUND);
  strokeWeight(15);

  float r = -200;
  for (int rangeeY=0; rangeeY<218; rangeeY=rangeeY+36 ) {
    for (float rangeeX = r; rangeeX < width; rangeeX = rangeeX + 61) {
      beginShape();
      vertex(rangeeX, rangeeY); 
      vertex(rangeeX+45, rangeeY);
      vertex(rangeeX+45, rangeeY+20);
      vertex(rangeeX, rangeeY+20);
      vertex(rangeeX, rangeeY);
      endShape();
    }
    r=r+30;
  }

  //Sac de poubelle
  fill(32, 46, 7);
  stroke(20, 31, 3);
  strokeWeight(1);
  beginShape();
  curveVertex(15, 143);
  curveVertex(16, 145);
  curveVertex(72, 154);
  curveVertex(87, 179);
  curveVertex(105, 209);
  curveVertex(106, 232);
  curveVertex(85, 249);
  curveVertex(72, 269);
  curveVertex(44, 255);
  curveVertex(33, 269);
  curveVertex(14, 269);
  curveVertex(-1, 255);
  curveVertex(-21, 257);
  curveVertex(-37, 232);
  curveVertex(-70, 229);
  curveVertex(-55, 206);
  curveVertex(-33, 183);
  curveVertex(-50, 149);
  curveVertex(-38, 122);
  curveVertex(4, 142);
  curveVertex(10, 119);
  curveVertex(25, 81);
  curveVertex(26, 126);
  curveVertex(35, 102);
  curveVertex(54, 80);
  curveVertex(49, 106);
  curveVertex(56, 112);
  curveVertex(55, 124);
  curveVertex(13.5, 179.5);
  endShape();

  //Boucle du sac de poubelle
  strokeWeight(3);
  noFill();
  beginShape();
  curveVertex(48, 173);
  curveVertex(28, 181);
  curveVertex(12, 148);
  curveVertex(9, 149);
  curveVertex(27, 127);
  curveVertex(41, 149);
  curveVertex(-24, 138);
  curveVertex(-14, 162);
  curveVertex(11, 148);
  curveVertex(10, 149);
  curveVertex(14, 174);
  curveVertex(2, 182);
  endShape();

  //Ligne sur le sac de poubelle
  beginShape();
  curveVertex(102, 207);
  curveVertex(72, 219);
  curveVertex(69, 194);
  curveVertex(66, 195);
  curveVertex(57, 236);
  curveVertex(29, 211);
  curveVertex(-0.5, 184);
  endShape();

  //Banane
   fill(249,250,8);
   strokeWeight(1);
   beginShape();
   curveVertex(4,240);
   curveVertex(-5,216);
   curveVertex(8,211);
   curveVertex(14,237);
   curveVertex(23,240);
   curveVertex(39,242);
   curveVertex(70,248);
   curveVertex(75,261);
   curveVertex(51,256);
   curveVertex(25,251);
   curveVertex(29,262);
   curveVertex(41,267);
   curveVertex(91,283);
   curveVertex(55,288);
   curveVertex(29,282);
   curveVertex(15,252);
   curveVertex(11,261);
   curveVertex(9,265);
   curveVertex(-2,277);
   curveVertex(-12,278);
   curveVertex(-4,262);
   curveVertex(0,260);
   curveVertex(10,243);
   curveVertex(0,222);
   curveVertex(-54.5,164);
   endShape();
   
   
   //Ligne centre banane
   noFill();
   beginShape();
   curveVertex(-12,265);
   curveVertex(3,214);
   curveVertex(30,270);
   curveVertex(88,286);
   curveVertex(163,304);
   endShape();
   
   //Ligne droite banane
   beginShape();
   curveVertex(-11,289);
   curveVertex(14,244);
   curveVertex(30,250);
   curveVertex(82,260);
   curveVertex(161,216);
   endShape();
   
   //Ligne gauche banane
   beginShape();
   curveVertex(25,223);
   curveVertex(14,242);
   curveVertex(2,265);
   curveVertex(-26,300);
   curveVertex(-42,350);
   endShape();
}//fin void dessinerDecor()


