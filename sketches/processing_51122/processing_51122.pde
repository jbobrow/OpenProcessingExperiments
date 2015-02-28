
/*-----------------------------------------------------------------------------
Monstre
Par Samantha Velandia Prieto
-----------------------------------------------------------------*/

//Variables pour la position
float x;
float y;

//Configuration Scene
size(400,400);
smooth();

//Point Centre de la scene
x = width/2;
y = height/2;

//Arriere Plan
background(215,15,242);

//Dessin Ventre
rectMode(CENTER);
stroke(0);
fill(32,198,169);
//Taille ventre proportionnel a la scene
float largeurVentre = width/5;
float hauteurVentre = height/3;
rect(x,y,largeurVentre, hauteurVentre);

//Dessin Tete
rectMode(CENTER);
stroke(0);
fill(32,198,169);
//Taille tête proportionnel a la scene
float largeurTete=width/8;
float hauteurTete=width/6;
rect(x-0,y-120, largeurTete,hauteurTete);

//Dessin Bouche
rectMode(CENTER);
stroke(0);
fill(32,198,169);
//Taille bouche proportionnel a la scene
float largeurBouche=width/5;
float hauteurBouche=height/16;
rect(x-0,y-95,largeurBouche, hauteurBouche);

//Desin Yeux
int d=20;
ellipseMode(CENTER);
fill(252,252,252);
stroke(0);
ellipse(x-12,y-135,d,d);
ellipse(x+12,y-135,d,d);

//Dessin pupile yeux
int d2=10;
ellipseMode(CENTER);
fill(0);
ellipse(x-12,y-135,d2,d2);
ellipse(x+12,y-135,d2,d2);

//Dessin Dents
fill(252,252,252);
stroke(0);
triangle(x-40,y-108,x-30,y-108,x-35,y-118);
triangle(x-30,y-108,x-20,y-108,x-25,y-118);
triangle(x-20,y-108,x-10,y-108,x-15,y-118);
triangle(x-10,y-108,x-0,y-108,x-05,y-118);
triangle(x-0,y-108,x+10,y-108,x+05,y-118);
triangle(x+10,y-108,x+20,y-108,x+15,y-118);
triangle(x+20,y-108,x+30,y-108,x+25,y-118);
triangle(x+30,y-108,x+40,y-108,x+35,y-118);

//Dessin Cou
rectMode(CENTER);
stroke(0);
fill(32,198,169);
//Taille cou proportionnel a la scene
float largeurCou=width/20;
float hauteurCou=height/25;
rect(x-0,y-75,largeurCou, hauteurCou);

//Dessin Jambes
rectMode(CENTER);
stroke(0);
fill(32,198,169);
float largeurJambe=width/20;
float hauteurJambe=height/10;
rect(x-20,y+86,largeurJambe, hauteurJambe);
rect(x+20,y+86,largeurJambe, hauteurJambe);

//Dessin Pieds
rectMode(CENTER);
stroke(0);
fill(32,198,169);
float largeurPied=width/13;
float hauteurPied=height/20;
rect(x-25,y+106,largeurPied,hauteurPied);
rect(x+25,y+106,largeurPied,hauteurPied);

//Dessin Bras
rectMode(CENTER);
stroke(0);
fill(32,198,169);
float largeurBras1=width/13;
float hauteurBras1=height/25;
rect(x+55,y-59, largeurBras1, hauteurBras1);
rect(x+65,y-59, largeurBras1/2, hauteurBras1);
rect(x-55,y-59, largeurBras1,hauteurBras1);
rect(x-65,y-59, largeurBras1/2, hauteurBras1);

//Dessin Oreilles
fill(32,198,169);
stroke(0);
triangle(x+25,y-153,x+50,y-150,x+25,y-180);
triangle(x-25,y-153,x-50,y-150,x-25,y-180);

//Dessin triangles arrière plan
fill(125,6,206);
noStroke();
triangle(x-200,y-200,x-70,y-200,x-200,y-30);
triangle(x+200,y+200,x+70,y+200,x+200,y+30);
triangle(x-200,y+200,x-70,y+200,x-200,y+30);
triangle(x+200,y-200,x+70,y-200,x+200,y-30);

//Boucle Nombril
noStroke();
 float e = width-340;
float ratio = 0.8;
 while ( e > 10 ) {
   fill (77,22,111 - e / width * 400 );
   ellipse( x , y , e , e );
   e = e * ratio;
}














                
                
