
/*
UQÀM - 2012

TP1 - Monstre
par Alexandre Dagenais
 
EDM4600 - Algorithmie de base et intéractivité*/

size(400,400);
smooth();
background(0);

//--Déclaration de Variables--------
float x;
float y;
float largeurDent;
float departDent;
float dimensionDent;
float compteur;
float yeux;
x = width/2;
y = height/2;
largeurDent = 24;
departDent = x - 175;
dimensionDent = 25;
compteur = 1;

//-----------------------------------

//--Visage------------------

  //--Menton----------
  fill(147,133,120);
  arc(x, y+50, 240, 130, 0, PI);
 
  fill(162,148,136);
  arc(x, y+50, 250, 125, 0, PI);
  fill(188,172,158);
  arc(x, y+50, 250, 115, 0, PI);
  fill(206,195,183);
  arc(x, y+50, 250, 100, 0, PI);
  //--Front---------
  fill(206,195,183);
  arc(x, y, 320, 190, TWO_PI-PI, TWO_PI);
  
//----------------------------------- 
  

//--Petite Dent------------------
fill(255,255,245);
pushMatrix();
translate(50,0);
while(compteur < 11){
  
  beginShape();
  vertex(departDent,  y);
  vertex((departDent) + dimensionDent,  y);
  
  //--si je suis rendu a la dent 5 ou 6, met la plus grande )
  if(compteur == 5 || compteur == 6)
  {
  vertex((departDent) + (dimensionDent/2),  y + dimensionDent + 10);
  
  //--sinon laisse la de grandeur normal
  }else 
  vertex((departDent) + (dimensionDent/2),  y + dimensionDent);
  
  vertex(departDent,  y);
  endShape();
  
  compteur += 1;
  departDent = departDent + 25;
};

popMatrix();

//-------------------------------

//--Gencive----------------------
fill(157,121,119);
noStroke();
pushMatrix();

translate(0,-5);
 //--Gauche
  beginShape();
  curveVertex(x-110,  y+10);
  curveVertex(x-110,  y+10);
  curveVertex(x-132,  y-30);
  curveVertex(x-169,  y);
  curveVertex(x-123,  y+95);
  curveVertex(x-110,  y+10);
  curveVertex(x-110,  y+10);
  endShape();
  
    //--Droite
  beginShape();
  curveVertex(x+110,  y-10);
  curveVertex(x+110,  y-10);
  curveVertex(x+132,  y-30);
  curveVertex(x+169,  y);
  curveVertex(x+123,  y+95);
  curveVertex(x+110,  y-10);
  curveVertex(x+110,  y-10);
  endShape();
  

popMatrix();


pushMatrix();

translate(0,2);
  //--Bas Droite
  beginShape();
  curveVertex(x+75,  y+55);
  curveVertex(x+75,  y+55);
  curveVertex(x+83,  y+72);
  curveVertex(x+115,  y+55);
  curveVertex(x+93,  y-10);
  curveVertex(x+75,  y+55);
  curveVertex(x+75,  y+55);
  endShape();
  
  //--Bas Gauche
  beginShape();
  curveVertex(x-75,  y+55);
  curveVertex(x-75,  y+55);
  curveVertex(x-83,  y+72);
  curveVertex(x-115,  y+55);
  curveVertex(x-93,  y-10);
  curveVertex(x-75,  y+55);
  curveVertex(x-75,  y+55);
  endShape();

popMatrix();

rect(x-139, y-2, 270, 2);

//------------------------------

//--Grosse Dent------------------
fill(255,255,237);
  //--Gauche
  beginShape();
  curveVertex(x-110,  y+10);
  curveVertex(x-110,  y+10);
  curveVertex(x-132,  y-30);
  curveVertex(x-169,  y);
  curveVertex(x-123,  y+95);
  curveVertex(x-110,  y+10);
  curveVertex(x-110,  y+10);
  endShape();


  //--Droite
  beginShape();
  curveVertex(x+110,  y-10);
  curveVertex(x+110,  y-10);
  curveVertex(x+132,  y-30);
  curveVertex(x+169,  y);
  curveVertex(x+123,  y+95);
  curveVertex(x+110,  y-10);
  curveVertex(x+110,  y-10);
  endShape();
  
fill(255,255,240);  
  //--Bas Droite
  beginShape();
  curveVertex(x+75,  y+55);
  curveVertex(x+75,  y+55);
  curveVertex(x+83,  y+72);
  curveVertex(x+115,  y+55);
  curveVertex(x+93,  y-10);
  curveVertex(x+75,  y+55);
  curveVertex(x+75,  y+55);
  endShape();
  
  //--Bas Gauche
  beginShape();
  curveVertex(x-75,  y+55);
  curveVertex(x-75,  y+55);
  
  curveVertex(x-83,  y+72);
  curveVertex(x-115,  y+55);
  curveVertex(x-93,  y-10);
  
  curveVertex(x-75,  y+55);
  curveVertex(x-75,  y+55);
  endShape();

  
  
//-------------------------------

//--derriere Yeux----------------

fill(147,133,120);
noStroke();
ellipse(x-57, y-95,95,95);
ellipse(x+57, y-95,95,95);

//-------------------------------


//--Yeux--------------------------

fill(250);
ellipse(x-65, y-95,95,95);
ellipse(x+65, y-95,95,95);

//--------------------------------

//pupille-------------------------

  float positionPupilleYGauche = random(80, 115);
  float positionPupilleYDroit = random(80, 115);
  float positionPupilleX = 85;
  
    //--Contour------------
    fill(0);

    ellipse(x-positionPupilleX, y-positionPupilleYGauche,30,30);
    ellipse(x+positionPupilleX, y-positionPupilleYDroit,30,30);
    
    //--Centre------------=
        fill(37,146,232);
        ellipse(x-positionPupilleX, y-positionPupilleYGauche,20,20);
        ellipse(x+positionPupilleX, y-positionPupilleYDroit,20,20);

//--------------------------------

