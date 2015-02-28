
re Laurence Daoust-Gref
 
//***Paramètres***
 float positionCouranteX = 120;
 float positionCouranteY = 330;
 float assouplissement = 0.9;
 float positionCibleX = 330;
 float positionCibleY = 120;
 float x;
 float y;
 color c;
 int timeStamp;
 int interval;
 int etat;
 int diametreOeil = 50;
 int diametrePupille = 15;
 
void setup() {
 size(400,400); // La taille de la fenetre.
 smooth(); // Lisser les formes dessinees.
 x= width*0.5;
 y= height*0.5;
 c = color(random(255), random(255), random(255));
     interval = 200;
}
 
//***Dessin***
void draw() {
  background(0);
  
//Antenne de gauche
beginShape();
  stroke(219,201,229);
  noFill();
  curveVertex(x-18.0, y-17.0);
  curveVertex(x-23, y-74);
  curveVertex(x-41, y-165);
  curveVertex(x-110,y-155);
  curveVertex(x-125.26483,y-16.087777);
endShape();
 
//Antenne de droite
beginShape();
  stroke(219,201,229);
  noFill();
  curveVertex(x+37.0, y+1.0);
  curveVertex(x+22.0, y-74.0);
  curveVertex(x+39.0, y-131.0);
  curveVertex(x+99.0, y-139.0);
  curveVertex(x+131.0, y-105.0);
  curveVertex(x+138.0, y+5.0);
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
  ellipse(x-7,y-55,3,3); //narine de gauche
  ellipse(x+8,y-55,3,3); //narine de droite
 
//Noeud papillon
beginShape();
  fill(c);
  stroke(0,0,0);
  curveVertex(x+76.0, y-5.0);
  curveVertex(x-50.0, y+20.0);
  curveVertex(x-50.0, y+70.0);
  curveVertex(x+50.0, y+20.0);
  curveVertex(x+50.0, y+70.0);
  curveVertex(x-51.0, y+20.0);
  curveVertex(x-86.0, y+29.0);
endShape();

//Pieds
 noStroke();
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
  ellipse(x-110,y-130, diametreOeil, diametreOeil); //oeil gauche
  ellipse(x+130,y-80, diametreOeil, diametreOeil); //oeil droit

// Dessin de l'oeil droit
 fill(255);
  ellipse(positionCouranteX, positionCouranteY, diametreOeil, diametreOeil);
// Pupille doit suivre la souris et reste dans l'oeil
  float distance = dist(mouseX, mouseY, positionCouranteX, positionCouranteY);
  distance = constrain(distance, 0, diametreOeil/2-diametrePupille/2);
  float radians = atan2(mouseY-positionCouranteY, mouseX-positionCouranteX); 
  float pupilleX = cos(radians)* distance + positionCouranteX;
  float pupilleY = sin(radians)* distance + positionCouranteY;
// Dessin de la pupille droite
 fill(0);
 noStroke();
  ellipse(pupilleX, pupilleY, diametrePupille, diametrePupille);
// Assouplissement du mouvement de l'oeil droit
  positionCouranteX = (positionCibleX - positionCouranteX) * assouplissement + positionCouranteX;
  positionCouranteY = (positionCibleY - positionCouranteY) * assouplissement + positionCouranteY;

//Pupille gauche
 fill(0,0,0);
  ellipse(x-127,y-130,diametrePupille, diametrePupille); 
 
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

if(mousePressed && mouseX >= x-65 && mouseX <= x+60 && mouseY >= y+20 && mouseY <= y+70)  {
  if ( millis() - timeStamp >= interval ) {
    timeStamp = timeStamp + interval;
    c = color(random(256), random(256), random(256));
   courante = (cible - courante) * 0.5 + courante;

   }
  } else { timeStamp = millis();
 }
}

