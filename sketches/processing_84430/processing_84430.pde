
background(255);
size(500,500);



/*
MES COULEURS
Rose
#DE0051,80
ligne violet
stroke(#DE0051,80);
violet gris
#8076BC,80
BLEU FONCE
(#001EAF,80);
BLEU CLAIR
 #004AFF,80
Orange
#E85900,80
orange foncé
#E34800,80
jaune
#FFD812,90
vert
#1AB404
*/
//rect(100,100,100,100);

//ligne gauche
strokeWeight(17);
stroke(#1AB404,90);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);

stroke(#DE0051,90);
//ligne coté centre gauche
strokeWeight(12);
line(125,125,100,150);
line(100,150,125,175);

//bas gauche
line(125,175,100,200);

//ligne coté centre droit

line(175,125,200,150);
line(200,150,175,175);

//bas droit
line(175,175,200,200);














//2
translate(125,0);
//ligne gauche
strokeWeight(12);
stroke(#001EAF,80);
line(100,100,150,150);
//ligne droite
stroke(#FFD812,95);
line(150,150,200,100);

stroke(#001EAF,80);
//ligne coté centre gauche
strokeWeight(6);
line(125,125,100,150);
line(100,150,125,175);

//bas gauche
line(125,175,100,200);

stroke(#FFD812);
//ligne coté centre droit

line(175,125,200,150);
line(200,150,175,175);

//bas droit
line(175,175,200,200);
















//3
translate(125,0);

//ligne gauche
strokeWeight(12);
stroke(#FFD812,95);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);

stroke(#DE0051,80);
//ligne coté centre gauche
strokeWeight(6);
line(125,125,100,150);
line(100,150,125,175);

//bas gauche
line(125,175,100,200);

//ligne coté centre droit

line(175,125,200,150);
line(200,150,175,175);

//bas droit
line(175,175,200,200);

//line du sommet
line(125,125,150,150);
line(150,150,175,125);















//4
translate(0,125);

/*//ligne gauche
strokeWeight(12);
stroke(#FFD812,95);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);
*/

//diagonal
strokeWeight(20);
stroke(#FFD812,95);
line(100,100,200,200);
line(200,100,100,200);

stroke(#DE0051,80);
//ligne coté centre gauche
strokeWeight(6);
line(125,125,100,150);
line(100,150,125,175);

//bas gauche
line(125,175,100,200);

//ligne coté centre droit

line(175,125,200,150);
line(200,150,175,175);

//bas droit
line(175,175,200,200);

//line du sommet
line(125,125,150,150);
line(150,150,175,125);


















//5
translate(-125,0);

/*//ligne gauche
strokeWeight(12);
stroke(#FFD812,95);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);
*/

//diagonal
strokeWeight(12);
stroke(#FFD812,95);
line(100,100,200,200);
line(200,100,100,200);

stroke(#DE0051,80);
//ligne coté centre gauche
strokeWeight(20);
line(125,125,100,150);
line(100,150,125,175);



stroke(#DE0051,80);
//bas gauche
line(125,175,100,200);


//bas droit
line(175,175,200,200);

//line du sommet
line(125,125,150,150);
line(150,150,175,125);

//ligne coté centre droit

line(175,125,200,150);
line(200,150,175,175);

//bas droit
line(175,175,200,200);

//line du sommet
line(125,125,150,150);
line(150,150,175,125);















//6
translate(-125,0);

//ligne gauche
strokeWeight(30);
stroke(#FFD812,95);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);


//droit
noStroke();
fill( #004AFF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();



strokeWeight(20);
stroke(#004AFF,80);

//bas gauche
line(125,175,100,200);



//bas droit
line(175,175,200,200);

/*line du sommet
line(125,125,150,150);
line(150,150,175,125);
*/

















//7
translate(0,125);


//diagonal
strokeWeight(15);
stroke(#FFD812,95);
line(100,100,200,200);
line(200,100,100,200);
//ligne gauche
strokeWeight(25);
stroke(#FFD812,60);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);


//droit
noStroke();
fill( #004AFF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();



strokeWeight(20);
stroke(#004AFF,40);

//bas gauche
line(125,175,100,200);



//bas droit
line(175,175,200,200);

/*line du sommet
line(125,125,150,150);
line(150,150,175,125);
*/

//carré central
noStroke();
fill(#001EAF,80);
beginShape();
vertex(150,125);
vertex(125,150);
vertex(150,175);
vertex(175,150);
vertex(150,125);
endShape();













//8
translate(125,0);


//diagonal
strokeWeight(10);
stroke(#FFD812,95);
line(100,100,200,200);
line(200,100,100,200);
/*//ligne gauche
strokeWeight(25);
stroke(#FFD812,60);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);

*/
//droit
noStroke();
fill( #004AFF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();



strokeWeight(20);
stroke(#004AFF,40);

/*//bas gauche
line(125,175,100,200);



//bas droit
line(175,175,200,200);

/*line du sommet
line(125,125,150,150);
line(150,150,175,125);
*/

//carré central
noStroke();
fill(#E34800,80);
beginShape();
vertex(150,125);
vertex(125,150);
vertex(150,175);
vertex(175,150);
vertex(150,125);
endShape();














//8
translate(125,0);


/*//diagonal
strokeWeight(10);
stroke(#FFD812,95);
line(100,100,200,200);
line(200,100,100,200);
//ligne gauche
strokeWeight(25);
stroke(#FFD812,60);
line(100,100,150,150);
//ligne droite
line(150,150,200,100);
*/
//triangle haut
beginShape();
vertex(100,100);
vertex(150,150);
vertex(200,100);
vertex(100,100);
endShape();
//tiangle bas
//droit
noStroke();
fill( #004AFF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();



strokeWeight(10);
stroke(#004AFF,60);

//bas gauche
line(125,175,100,200);



//bas droit
line(175,175,200,200);

/*line du sommet
line(125,125,150,150);
line(150,150,175,125);
*/

//carré central
noStroke();
fill(#E34800,80);
beginShape();
vertex(150,125);
vertex(125,150);
vertex(150,175);
vertex(175,150);
vertex(150,125);
endShape();



