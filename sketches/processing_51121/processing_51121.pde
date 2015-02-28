
/***************************************************************
PETIT MONSTRE
Par Victoria Malenfant
Pour EDM4600
***************************************************************/

size(400, 400);
smooth();

float x;
float y; 
x = 0;
y = 0;
float r, g, b;
r = random (0, 256);
g = random (0, 256);
b = random (0, 256);
float r2, g2, b2;
r2 = random (0, 256);
g2 = random (0, 256);
b2 = random (0, 256);
float pustule = PI + HALF_PI;

    
//Début code paysage
    background(162, 231, 255);
    fill(100);
    noStroke();
    rect(0, 170, 400, 230);
//Fin code paysage
   
//Début code cailloux
    stroke(190);
    fill(190);
    ellipse(100, 200, 3, 3);
    ellipse(300, 250, 4, 4);
    ellipse(70, 370, 5, 5);
    fill(75);
    stroke(75);
    ellipse(370, 190, 3, 3);
    ellipse(50, 270, 4, 4);
    ellipse(210, 380, 5, 5);
//Fin code cailloux

//Début code nuage
    noStroke();
    fill(255);
    ellipse(50, 60, 72, 50);
    arc(47, 79, 35, 30, 0, PI);
    pushMatrix();
    translate(74, 72);
    rotate(- QUARTER_PI);
    arc(0, 0, 35, 30, 0, PI + HALF_PI);
    popMatrix();
    pushMatrix();
    translate(43, 41);
    rotate(PI);
    arc(0, 0, 35, 30, 0, PI);
    popMatrix();
    pushMatrix();
    translate(70, 50);
    rotate(PI + QUARTER_PI);
    arc(0, 0, 35, 30, 0, PI);
    popMatrix();
//Fin code nuage

// DÉBUT CODE CORPS GÉNÉRAL
//Début code forme corps
    fill(r, g, b);
    stroke(r * 0.90, g * 0.90, b * 0.90);
    /*fill(103, 196, 150);
    stroke(166, 222, 194);*/
    strokeWeight(3);
    beginShape();
    curveVertex(x + 34.0, y + 210.0);
    curveVertex(x + 157.0, y + 227.0);
    curveVertex(x + 113.0, y + 327.0);
    curveVertex(x + 288.0, y + 321.0);
    curveVertex(x + 336.0, y + 322.0);
    curveVertex(x + 338.0, y + 312.0);
    curveVertex(x + 243.0, y + 290.0);
    curveVertex(x + 222.0, y + 222.0);
    curveVertex(x + 241.0, y + 187.0);
    curveVertex(x + 261.0, y + 141.0);
    endShape();
//Fin code forme corps  
    
//Début code forme tête
    beginShape();
    curveVertex(x + 201, y + 84);
    curveVertex(x + 143, y + 143);
    curveVertex(x + 145, y + 224);
    curveVertex(x + 246, y + 188);
    curveVertex(x + 242, y + 168);
    curveVertex(x + 263, y + 153);
    curveVertex(x + 257, y + 129);
    curveVertex(x + 310, y + 192);
    curveVertex(x + 288, y + 81);
    curveVertex(x + 201, y + 84);
    curveVertex(x + 143, y + 142);
    curveVertex(x + 145, y + 224);
    endShape();
//Fin code forme tête  
   
//Début code bras
    arc(x + 199, y + 250, 15, 60, 0, PI);
//Fin code bras

//Début code petites pustules
    strokeWeight(2);
    arc(x + 200, y + 230, 5, 5, 0, pustule);
    arc(x + 160, y + 300, 7, 7, 0, pustule);
    arc(x + 230, y + 310, 5, 5, 0, pustule);
    arc(x + 230, y + 150, 5, 5, 0, pustule);
    arc(x + 190, y + 115, 7, 7, 0, pustule);
    arc(x + 260, y + 95, 5, 5, 0, pustule);
   
//Début code bouche
    fill(211, 98, 113);
    strokeWeight(0);
    stroke(232, 63, 86);
    beginShape();
    curveVertex(x + 175, y + 98);
    curveVertex(x + 153, y + 192);
    curveVertex(x + 159, y + 216);
    curveVertex(x + 195, y + 199);
    curveVertex(x + 207, y + 173);
    curveVertex(x + 153, y + 192);
    curveVertex(x + 94, y + 125);
    endShape();
//Fin code bouche  
  
//Début code yeux blancs
    noStroke();
    fill(255, 255, 255);
    ellipse(x + 150, y + 150, 35, 35);
    ellipse(x + 200, y + 150, 28, 28);
//Fin code yeux blancs  
    
//Début relief pour oeil gauche
    float x1 = x + 150;
    float y1 = y + 150;
    noStroke();
    float d = 35;
    float difference = 1;
    while (d > 5) {
      fill(255 - d / 70 * 105);
      ellipse(x1, y1, d, d);
      d = d - difference;
    }
//Fin relief pour oeil gauche
     
//Début relief pour oeil droit
    float x2 = x + 200;
    noStroke();
    float d2 = 28;
    while (d2 > 3) {
      fill(255 - d2 / 56 * 105);
      ellipse(x2, y1, d2, d2);
      d2 = d2 - difference;
    }
//Fin relief pour oeil droit
  
//Début code pupille
    fill(r2, g2, b2);
  /*fill(180, 151, 33);*/
    arc(x + 150, y + 150, 20, 20, 0, PI+HALF_PI+QUARTER_PI);
    arc(x + 200, y + 150, 13, 13, 0, PI+HALF_PI+QUARTER_PI);
//Fin code pupille 
  
//Début code lueur
    fill(255, 255, 255);
    ellipse(x + 147, y + 158, 4, 4);
    ellipse(x + 199, y + 156, 3, 3);
//Fin code lueur
                
