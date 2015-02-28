
// Jean-Michel Leblanc - Tp1: Le Monstre - EDM4600

// ----------------------- Déclaration des variables -----------------------
float x;
float y;
float gTete;
float pTete;
float corps;

// ----------------------- Initialisation de la surface de travail -----------------------
void setup(){  
  /* Taille de la surface de travail (en pixels), 
  antialiasing activé et aucune bordure aux formes */
  size(400, 400);
  background(23, 19, 31);
  smooth();
  
  // ----------------------- Initialisation des propriétés des variables -----------------------
  x = width/2;
  y = height/2;
  gTete = x;
  pTete = x;
  corps = x;
}

// ----------------------- Fonction permettant de dessiner le personnage -----------------------
// Planète (Voir exemple "While: Soustraction")
void draw(){
  float d = 400;
  float difference = 5;
 
  while ( d > 0 ) {
    fill ( d / 2 );
    ellipse( x+70 , y+270 , d , d );
    d = d - difference;
  }
  
  // Ombre du personnage
  fill (130);
  ellipse(x+50, y+110, 130, 40);
  
  // ----------------------- Corps robotisé du personnage -----------------------
  // Les roues
  noStroke();
  ellipseMode(CENTER);
  fill(40);
  ellipse(corps+10, corps+105, 25, 25);
  ellipse(corps+60, corps+105, 25, 25);
  ellipse(corps+93, corps+95, 25, 25);
  
  // Le corps métallique P.1
  strokeJoin(ROUND);
  stroke(150, 168, 183);
  fill(150, 168, 183);
  strokeWeight(20.0);
  beginShape();
    vertex(corps+30, corps-10);
    vertex(corps+30, corps+90);
    vertex(corps+100, corps+90);
    vertex(corps+100, corps-10);
    vertex(corps+30, corps-10);
  endShape();
  
  // Fix de la perspective
  line(corps+100, corps+90, corps+70, corps+100);
  line(corps+30, corps-10, corps, corps);
  
  // Le corps métallique P.2
  strokeJoin(ROUND);
  stroke(210, 228, 242);
  fill(210, 228, 242);
  strokeWeight(20.0);
  beginShape();
    vertex(corps, corps);
    vertex(corps, corps+100);
    vertex(corps+70, corps+100);
    vertex(corps+70, corps);
    vertex(corps, corps);
  endShape();

  // Trous pour la tête des personnages
  noStroke();
  fill(40);
  ellipse(corps+35, corps+25, 25, 25);
  ellipse(corps+55, corps-15, 25, 5);
  
  // Panneau de contrôle sur le côté du personnage
  beginShape();
    vertex(corps+85, corps+20);
    vertex(corps+85, corps+80);
    vertex(corps+105, corps+74);
    vertex(corps+105, corps+14);
    vertex(corps+85, corps+20);
  endShape();
  
  fill(255);
  beginShape();
    vertex(corps+90, corps+25);
    vertex(corps+90, corps+35);
    vertex(corps+100, corps+32);
    vertex(corps+100, corps+22);
    vertex(corps+90, corps+25);
  endShape();
  
  // Bouton rouge
  fill(180, 0, 0);
  ellipse(corps+95, corps+46, 11, 15);
  
  // Bouton turquoise
  fill(37, 99, 99);
  ellipse(corps+95, corps+64, 11, 15);
  
  // ----------------------- Tête du petit monstre -----------------------
  //Cou
  strokeJoin(ROUND);
  strokeWeight(8.0);
  stroke(255, 158, 0);
  line(pTete+55, pTete-18, pTete+55, pTete-70);
  
  // Tête (Voir exemple "While: Soustraction")
  noStroke();
  float dPetiteTete = 70;
  float diffPetiteTete = 5;
  float fillPetiteTete1 = 255;
  float fillPetiteTete2 = 158;
   
  while ( dPetiteTete > 5 ) {
     fill (fillPetiteTete1, fillPetiteTete2, 0);
     ellipse(pTete+55, pTete-70, dPetiteTete, dPetiteTete);
     fillPetiteTete1 = fillPetiteTete1 - 5;
     fillPetiteTete2 = fillPetiteTete2 - 5;
     dPetiteTete = dPetiteTete - diffPetiteTete;
  }

  
  // Yeux + pupilles
  fill(155, 96, 0);
  ellipse(pTete+57, pTete-73, 17, 20);
    fill(255);
    ellipse(pTete+57, pTete-75, 17, 20);
      fill(0);
      ellipse(pTete+59, pTete-73, 5, 7);
        fill(255);
        ellipse(pTete+60, pTete-75, 3, 3);
  
  fill(155, 96, 0);
  ellipse(pTete+77, pTete-73, 20, 30);
    fill(255);
    ellipse(pTete+77, pTete-75, 20, 30);
      fill(0);
      ellipse(pTete+75, pTete-73, 9, 12);
        fill(255);
        ellipse(pTete+77, pTete-77, 4, 4);
  
  // Grains de beauté
  fill(155, 96, 0);
  ellipse(pTete+35, pTete-85, 3, 4);
  ellipse(pTete+42, pTete-88, 5, 6);
  ellipse(pTete+35, pTete-93, 7, 8);
  
  // ----------------------- Tête du gros monstre -----------------------
  // Cou
  noFill();
  strokeJoin(ROUND);
  strokeWeight(16.0);
  stroke(255, 158, 0);
  beginShape();
    curveVertex(gTete, gTete);
    curveVertex(gTete+35, gTete+25);
    curveVertex(gTete-10, gTete+50);
    curveVertex(gTete-90, y);
    curveVertex(gTete-100, gTete-200);
  endShape();
  
  // Tête
  noStroke();
  fill(255, 158, 0);
  beginShape();
    curveVertex(gTete, gTete);
    curveVertex(gTete-90, gTete+15);
    curveVertex(gTete-60, gTete);
    curveVertex(gTete-50, gTete-50);
    curveVertex(gTete-35, gTete-80);
    curveVertex(gTete-45, gTete-130);
    curveVertex(gTete-100, gTete-150);
    curveVertex(gTete-130, gTete-130);
    curveVertex(gTete-150, gTete-100);
    curveVertex(gTete-150, gTete-50);
    curveVertex(gTete-130, gTete);
    curveVertex(gTete-90, gTete+15);
    curveVertex(gTete-90, gTete+15);
  endShape();
  
  // Yeux + pupilles + cernes
  fill(155, 96, 0);
  ellipse(gTete-128, gTete-73, 20, 30);
    fill(255);
    ellipse(gTete-130, gTete-75, 20, 30);
      fill(0);
      ellipse(gTete-130, gTete-75, 10, 15);
        fill(255);
        ellipse(gTete-128, gTete-82, 8, 8);
  
  fill(155, 96, 0);
  ellipse(gTete-99, gTete-71, 50, 70);
    fill(255);
    ellipse(gTete-100, gTete-75, 50, 70);
      fill(0);
      ellipse(gTete-95, gTete-81, 30, 50);
        fill(255);
        ellipse(gTete-90, gTete-100, 10, 10);
      
  // Grains de beauté
  fill(155, 96, 0);
  ellipse(gTete-60, gTete-100, 10, 12);
  ellipse(gTete-48, gTete-110, 15, 17);
  ellipse(gTete-65, gTete-120, 20, 22);
  
  // Bouche
  fill(173, 58, 62);
  ellipse(gTete-120, gTete-15, 25, 20);
    fill(85, 25, 16);
    ellipse(gTete-118, gTete-12, 18, 13);
    
  // Mâchoire
  fill(155, 96, 0);
  ellipse(gTete-68, gTete-38, 20, 22);
    fill(255, 158, 0);
    ellipse(gTete-70, gTete-40, 20, 22);
}

