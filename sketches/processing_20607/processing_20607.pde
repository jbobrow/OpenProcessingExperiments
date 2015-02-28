
/************************************* 
TP1 Algorithmie et interactivité
FELIX DESCOTEAUX

CRÉATION D'UN MONSTRE PACMAN
Remise le 11 février 2011

**************************************/



//initialisation des variables
float monsterX;
float monsterY;
float positionBouleX = monsterX;
float positionBouleY = monsterY;
float speedY = 1;
float pupilX;
float pupilY;
float pupilXx;
float pupilYy;
PImage b;

void setup()
{
  //frameRate(10000);
  //initialisation du canevas
  size(400,400);
  colorMode(RGB);
  //background(255);
   b = loadImage("background.jpg");
}


void draw()
{
  //initialisation du background
  background(0,0,205);
  
  
  
  tint(255, 120);  
  image (b, 0, 0);
  
  smooth(); //antialiasing
  
  //Restrictions des valeurs de monsterX et monsterY par rapport à la position de la souris
  monsterX = map (mouseX, 0, width, 150, 250);
  monsterY = map (mouseY, 0 , height, 200, 250);
 
  boule(); //Appel de la fonction boule qui fait tomber la boule jaune
 
  stroke(1);
  fill(200,50,50);
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
  endShape();
 

 
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
 
  yeux();
 
 
}


void boule()
{
  if(mousePressed){
    
    
    positionBouleX = monsterX;
    speedY = speedY + 0.2;
    positionBouleY = positionBouleY + speedY;
    
   noStroke();
   fill(255, 255, 0);
   ellipse(monsterX, (monsterY+30) + (positionBouleY * speedY), 40, 40);
    
  }
  else {
    positionBouleY = 0;
    speedY = 1;
 
  }
}




void yeux()
{
  
  if (mousePressed){
   println ("clique: x "+mouseX+" y " +mouseY); //imprimer les coordonnées
   
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
  float monsterX = map (mouseX, 0, width, 150, 250);
 float monsterY = map (mouseY, 0 , height, 200, 250);
 strokeWeight(3);
 fill(255); 
 ellipse(monsterX - 40,monsterY - 86,50,50); //oeil gauche
 ellipse(monsterX + 30,monsterY - 78,65,65); //oeil droit
 
 //Restriction des pupilles
 pupilX = map(mouseX, 0, width, monsterX - 40 - 20, monsterX - 40 + 5);
 pupilY = map(mouseY, 0, height, monsterY - 86 - 15, monsterY - 86 + 5);
 pupilXx = map(mouseX, 0, width, monsterX + 30 - 25, monsterX + 30 + 14);
 pupilYy = map(mouseY, 0, height, monsterY - 78 - 25, monsterY - 78 + 12);
 
 //Traçage des pupilles
 strokeWeight(2);
 ellipse(pupilXx, pupilYy,10,10);
 fill(0);
 ellipse(pupilXx+10, pupilYy+10,20,20);
 
 fill(255);
 ellipse(pupilX, pupilY,10,10);
 fill(0);
 ellipse(pupilX+10, pupilY+10,20,20);

}

}



