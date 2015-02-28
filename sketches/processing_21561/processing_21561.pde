
// Dessin et concept réalisé par Félix Descôteaux

float monsterX;
float monsterY;
float pupilleXGauche;
float pupilleYGauche;
float pupilleXDroite;
float pupilleYDroite;
float bouleX;
float bouleY;
float bouleV;

boolean numberTwo = false;


void setup() {
  size(400,400);
  smooth();
}


void draw() {

  background(5,30,100);
  

  monsterX = map (mouseX, 0, width, 100, 300) ;
  monsterY = map (mouseY, 0, height, 100, 300) + sin(frameCount*0.05) * 10 ;

  boule();

  monstre();
}



void mousePressed() {
  if ( numberTwo == false ) {
    numberTwo = true; 
    bouleX = monsterX;
    bouleY = monsterY + 40;
    bouleV = 0;
  }
}

void boule() {
  
  if(numberTwo) {

    bouleV = bouleV + 0.2;
    bouleY = bouleY + bouleV;

    noStroke();
    fill(255, 255, 0);
    ellipse(bouleX, bouleY, 40, 40);
  
    if ( bouleY > height+20) numberTwo = false;
  }
}




void monstre() {

  // Dessin et concept réalisé par Félix Descôteaux

  stroke(1);
  fill(50,200,50);
  strokeWeight(5);

  beginShape(); //Traçage de la forme du monstre
  curveVertex(monsterX - 105,monsterY - 100);
  curveVertex(monsterX - 105,monsterY - 100);
  curveVertex(monsterX - 80,monsterY - 130); 
  curveVertex(monsterX + 85,monsterY - 130);
  curveVertex(monsterX + 100,monsterY + 5);
  curveVertex(monsterX + 100,monsterY + 50);
  vertex(monsterX + 116,monsterY + 89);
  vertex(monsterX + 60, monsterY + 51);
  vertex(monsterX + 33,monsterY + 98);
  vertex(monsterX,monsterY + 51);
  vertex(monsterX - 35,monsterY + 93);
  vertex(monsterX - 63,monsterY + 52);
  vertex(monsterX - 107,monsterY + 85);
  vertex(monsterX - 100,monsterY + 40);
  vertex(monsterX - 105,monsterY - 100);
  endShape(CLOSE);



  //Traçage de la bouche
  fill(255);
  strokeWeight(2);
  beginShape();
  curveVertex(monsterX - 71,monsterY - 35);
  curveVertex(monsterX - 71,monsterY - 35);
  curveVertex(monsterX - 13,monsterY - 27);
  curveVertex(monsterX + 74,monsterY - 41);
  curveVertex(monsterX + 64,monsterY + 23);
  curveVertex(monsterX - 55,monsterY + 24);
  curveVertex(monsterX - 55,monsterY + 24);
  endShape(CLOSE);

  line(monsterX - 58, monsterY + 11,monsterX + 74,monsterY + 11);

  //Traçage des sourcis
  strokeWeight(20);
  stroke(0);
  line(monsterX + 5,monsterY - 102,monsterX + 99,monsterY - 139);
  line(monsterX - 18,monsterY - 98,monsterX - 84,monsterY - 145);

  if (mousePressed) {


    //yeux fermés
    stroke(0);
    strokeWeight(5);
    line(monsterX - 17, monsterY - 90, monsterX - 70, monsterY - 100);
    strokeWeight(8);
    line(monsterX - 17, monsterY - 90, monsterX - 82, monsterY - 50);
    strokeWeight(3);
    line(monsterX - 17, monsterY - 90, monsterX - 70, monsterY - 75);

    strokeWeight(5);
    line(monsterX, monsterY - 96, monsterX + 65, monsterY - 100);
    strokeWeight(8);
    line(monsterX, monsterY - 96, monsterX + 60, monsterY - 53);
    strokeWeight(3);
    line(monsterX, monsterY - 96, monsterX + 70, monsterY - 85);
  }

  else
  {
    //yeux ouverts

    stroke(0);
   
    strokeWeight(3);
    fill(255);
    ellipse(monsterX - 40,monsterY - 86,50,50); //oeil gauche
    ellipse(monsterX + 30,monsterY - 78,65,65); //oeil droit

    //Restriction des pupilleles
    pupilleXGauche = map(mouseX, 0, width, monsterX - 40 - 20, monsterX - 40 + 5);
    pupilleYGauche = map(mouseY, 0, height, monsterY - 86 - 15, monsterY - 86 + 5);

    pupilleXDroite = map(mouseX, 0, width, monsterX + 30 - 25, monsterX + 30 + 14);
    pupilleYDroite = map(mouseY, 0, height, monsterY - 78 - 25, monsterY - 78 + 12);

    //Traçage des pupilleles

    strokeWeight(2);
   
    fill(0);
    ellipse(pupilleXDroite+10, pupilleYDroite+10,20,20);


    fill(0);
    ellipse(pupilleXGauche+10, pupilleYGauche+10,20,20);
  }
}
                                
