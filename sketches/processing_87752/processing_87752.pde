
//Monstre Laurence Daoust-Gref

//***Paramètres***
 float x;
 float y;

void setup() {
 size(400,400); // La taille de la fenetre.
 smooth(); // Lisser les formes dessinees.
 x= width*0.5;
 y= height*0.5;
}

//***Dessin***
void draw() {
 background(127); // Remplir l'arriere-plan d'une teinte de gris.

//Antenne de gauche
beginShape();
stroke(219,201,229);
noFill();
curveVertex(182.0, 183.0);
curveVertex(177.0, 126.0);
curveVertex(159.0, 35.0);
curveVertex(90.0, 45.0);
curveVertex(74.73517, 183.91223);
endShape();

//Antenne de droite
beginShape();
stroke(219,201,229);
noFill();
curveVertex(237.0, 201.0);
curveVertex(222.0, 126.0);
curveVertex(239.0, 69.0);
curveVertex(299.0, 61.0);
curveVertex(331.0, 95.0);
curveVertex(338.0, 205.0);
endShape();

//Corps
noStroke();
fill(219,201,229);
ellipse(x,y+30,150,30); //corps haut (ellipse 1)
ellipse(x,y+50,150,30); //corps (ellipse 2)
ellipse(x,y+70,150,30); //corps (ellipse 3)
ellipse(x,y+90,150,30); //corps (ellipse 4)
ellipse(x,y+110,150,30); //corps (ellipse 5)
ellipse(x,y+130,150,30); //corps bas (ellipse 6)
arc(x,y+30,150,220,PI,2*PI); // demie-ellipse : tete encastrée dans 1ere ellipse

//Narines
fill(0,0,0);
ellipse(193,145,3,3); //narine de gauche
ellipse(208,145,3,3); //narine de droite

//Noeud papillon
beginShape();
fill(0,0,0);
curveVertex(276.0, 195.0);
curveVertex(150.0, 220.0);
curveVertex(150.0, 270.0);
curveVertex(250.0, 220.0);
curveVertex(250.0, 270.0);
curveVertex(151.0, 220.0);
curveVertex(114.0, 229.0);
endShape();

//Pieds
fill(201,145,232);
ellipse(x-50,y+155,70,50);  //pied gauche
ellipse(x+50,y+155,70,50);  //pied droit

//Orteils pied gauche      en partant de gauche à droite
fill(191,24,214); 
ellipse(x-64,y+175,7,10);  //orteils ds gauche
ellipse(x-57,y+176,7,12);  //orteils ds gauche
ellipse(x-50,y+177,7,12);  //orteils ds gauche
ellipse(x-43,y+176,7,12);  //orteils ds gauche
ellipse(x-36,y+175,7,10);  //orteils ds gauche

//Orteils pied droit        en partant de droite à gauche
ellipse(x+64,y+175,7,10);  //orteils ds droit
ellipse(x+57,y+176,7,12);  //orteils ds droit
ellipse(x+50,y+177,7,12);  //orteils ds droit
ellipse(x+43,y+176,7,12);  //orteils ds droit
ellipse(x+36,y+175,7,10);  //orteils ds droit

//Ongles d'orteils pied gauche           en partant de gauche à droite
fill(214,91,194);
stroke(165,30,143);
arc(x-57,y+176,5,10,radians(0),PI);  //ongles ds gauche
arc(x-50,y+177,5,10,radians(0),PI);  //ongles ds gauche
arc(x-43,y+176,5,10,radians(0),PI);  //ongles ds gauche
arc(x-36,y+175,5,8,radians(0),PI);  //ongles ds gauche
arc(x-64,y+175,5,8,radians(0),PI);  //ongles ds gauche

//Ongles d'orteils pied droit            en partant de droite à gauche
arc(x+64,y+175,5,8,radians(0),PI);  //ongles ds droit
arc(x+57,y+176,5,10,radians(0),PI);  //ongles ds droit
arc(x+50,y+177,5,10,radians(0),PI);  //ongles ds droit
arc(x+43,y+176,5,10,radians(0),PI);  //ongles ds droit
arc(x+36,y+175,5,8,radians(0),PI);  //ongles ds droit

//Yeux
fill(255,255,255);
stroke(0,0,0);
ellipse(x-110,y-130,50,50); //oeil gauche
ellipse(x+130,y-80,50,50); //oeil droit
noStroke();

//Pupilles
fill(0,0,0);
ellipse(x-127,y-130,15,15); //pupille gauche
ellipse(x+130,y-80,15,15); //pupille droite

//Paupières
fill(201,145,232);
stroke(0,0,0);
arc(x-110,y-130,50,50,PI,TWO_PI); //paupière gauche
arc(x+130,y-80,50,50,PI,TWO_PI); //paupière droite

//Bouche
noStroke();
fill(227,66,168);
arc(x,y+20,75,110,PI,TWO_PI);

//Bouche dégradé
for (float i =0; i<=200; i+= 8) { 
fill(120+i*0.7, 25+i*0.103, 110+i*0.7); //dégradé RGB
arc(x,y+20,75-i,110-(i*0.3),PI,TWO_PI);
 }

//Langue
stroke(0,0,0);
fill(162,15,108);
arc(x,y+19,70,30,PI,TWO_PI); 

//Dents
noStroke();
fill(255,255,255);
arc(x,y-32,20,8,PI,2*PI);    //arc haut dents
stroke(0,0,0);
arc(x+5,y-32,10,25,0,PI);      //dent droite
arc(x-5,y-32,10,25,0,PI);      //dent gauche
}

//Utilisation de « text(mouseX + " " + mouseY, mouseX + 5, mouseY); » afin de trouver les coordonnées pour faire condorder les bouts des antennes
