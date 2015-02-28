
/*

                       Marie-Agathe PATY
       Exercice pour le 30 octobre : "dessiner une figure"
      

*/

//Définition de la taille de la fenêtre
size(500,500);
background(240);

translate(0,25);

//dessin de l'ensemble des ballons de gauche et les fils associés

stroke(122,75,175);
strokeWeight(1);

line(50,80,150,370);
line(70,90,150,370);
line(95,75,150,370);
line(130,105,150,370);
line(90,110,150,370);
line(110,130,150,370);
line(35,110,150,370);
line(50,145,150,370);
line(70,140,150,370);
line(100,150,150,370);

fill(188,51,134,200);
ellipse(50,50,45,60);
fill(220,51,134,200);
ellipse(70,60,45,60);
fill(240,51,134,200);
ellipse(95,45,45,60);
fill(255,51,134,200);
ellipse(130,75,45,60);
fill(255,70,134,200);
ellipse(90,80,45,60);
fill(255,90,134,200);
ellipse(110,100,45,60);
fill(255,110,134,200);
ellipse(35,80,45,60);
fill(255,130,134,200);
ellipse(50,115,45,60);
fill(255,150,134,200);
ellipse(70,110,45,60);
fill(255,170,134,180);
ellipse(100,120,45,60);


//dessin du banc
//fill(100,62,142);
fill(94,144,183,220);
noStroke();
rect(130,370,240,20,5);

//dessin de l'ensemble des ballons de droite et les fils associés

stroke(122,75,175);
fill(188,51,134,200);

line(450,80,350,370);
line(430,90,350,370);
line(405,75,350,370);
line(370,105,350,370);
line(410,110,350,370);
line(390,130,350,370);
line(465,110,350,370);
line(450,145,350,370);
line(430,140,350,370);
line(400,150,350,370);

fill(188,51,134,200);
ellipse(450,50,45,60);
fill(220,51,134,200);
ellipse(430,60,45,60);
fill(240,51,134,200);
ellipse(405,45,45,60);
fill(255,51,134,200);
ellipse(370,75,45,60);
fill(255,70,134,200);
ellipse(410,80,45,60);
fill(255,90,134,200);
ellipse(390,100,45,60);
fill(255,110,134,200);
ellipse(465,80,45,60);
fill(255,70,134,200);
ellipse(450,115,45,60);
fill(255,150,134,200);
ellipse(430,110,45,60);
fill(255,170,134,180);
ellipse(400,120,45,60);

// Buste et tête

noStroke();
fill(70);
rect(235,270,45,95,10);
ellipse(257.5,245,40,40);

//jambe gauche 

stroke(70);
strokeWeight(15);
line(245,350,210,380);
line(210,380,230,420);

//jambe droite

line(270,350,290,380);
line(290,380,280,430);

//bras gauche

line(240,280,210,360);

//bras droit

line(273,280,310,360);







