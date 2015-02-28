
size(500,500);
background(255);


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


//1
//rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(7);
stroke(#DE0051,80);
line(100,105,125,130);
strokeWeight(2);
line(125,130,100,150);
line(100,150,125,170);
strokeWeight(7);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#E85900,80);
strokeWeight(7);
line(200,105,175,130);
strokeWeight(2);
line(175,130,200,150);
line(200,150,175,170);
strokeWeight(7);
line(175,170,200,195);

/*//triangle
strokeWeight(2);
line(125,130,175,130);
line(175,130,150,150);
line(150,150,125,130);
*/
//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();












//2
translate(150,0);
//rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(7);
stroke(#001EAF,80);
line(100,105,125,130);
strokeWeight(2);
stroke(#004AFF,80);
line(125,130,100,150);
line(100,150,125,170);
strokeWeight(7);
stroke(#001EAF,80);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#001EAF,80);
strokeWeight(7);
line(200,105,175,130);
strokeWeight(2);
stroke(#004AFF,80);
line(175,130,200,150);
line(200,150,175,170);
strokeWeight(7);
stroke(#001EAF,80);
line(175,170,200,195);

/*//triangle
strokeWeight(2);
line(125,130,175,130);
line(175,130,150,150);
line(150,150,125,130);
*/
//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();











//3
translate(0,150);
//rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(9);
stroke(#001EAF,80);
line(100,105,125,130);
strokeWeight(4);
stroke(#004AFF,80);
line(125,130,100,150);
line(100,150,125,170);
strokeWeight(9);
stroke(#001EAF,80);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#001EAF,80);
strokeWeight(9);
line(200,105,175,130);
strokeWeight(4);
stroke(#004AFF,80);
line(175,130,200,150);
line(200,150,175,170);
strokeWeight(9);
stroke(#001EAF,80);
line(175,170,200,195);

/*//triangle
strokeWeight(2);
line(125,130,175,130);
line(175,130,150,150);
line(150,150,125,130);
*/
//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();

//triangle bas plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(175,170);
vertex(125,170);
vertex(150,150);
vertex(175,170);
endShape();



//3
translate(-150,0);
//rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(9);
stroke(#001EAF,80);
line(100,105,125,130);
strokeWeight(4);
stroke(#004AFF,80);
line(125,130,100,150);
line(100,150,125,170);
strokeWeight(9);
stroke(#001EAF,80);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#001EAF,80);
strokeWeight(9);
line(200,105,175,130);
strokeWeight(4);
stroke(#004AFF,80);
line(175,130,200,150);
line(200,150,175,170);
strokeWeight(9);
stroke(#001EAF,80);
line(175,170,200,195);

//triangle
stroke(#E85900,80);
strokeWeight(2);
line(125,130,175,130);
strokeWeight(4);
line(175,130,150,150);
line(150,150,125,130);

//triangle bas
stroke(#E85900,80);
strokeWeight(4);
line(175,170,125,170);
strokeWeight(9);
line(125,170,150,150);
line(150,150,175,170);

/*
//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();

//triangle bas plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(175,170);
vertex(125,170);
vertex(150,150);
vertex(175,170);
endShape();
*/












//4
translate(0,120);
//rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(9);
stroke(#001EAF,80);
line(100,105,125,130);
strokeWeight(4);
stroke(#004AFF,80);
line(125,130,100,150);
line(100,150,125,170);
strokeWeight(9);
stroke(#001EAF,80);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#001EAF,80);
strokeWeight(9);
line(200,105,175,130);
strokeWeight(4);
stroke(#004AFF,80);
line(175,130,200,150);
line(200,150,175,170);
strokeWeight(9);
stroke(#001EAF,80);
line(175,170,200,195);

strokeWeight(4);
stroke(#004AFF,80);
//ligne centre croisement
line(175,130,150,150);
line(150,150,125,130);

//bas
line(125,170,150,150);
line(150,150,175,170);

/*
//triangle
stroke(#E85900,80);
strokeWeight(2);
line(125,130,175,130);
strokeWeight(4);
line(175,130,150,150);
line(150,150,125,130);

//triangle bas
stroke(#E85900,80);
strokeWeight(4);
line(175,170,125,170);
strokeWeight(9);
line(125,170,150,150);
line(150,150,175,170);


//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();

//triangle bas plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(175,170);
vertex(125,170);
vertex(150,150);
vertex(175,170);
endShape();
*/














//6
translate(125,0);
//rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(11);
stroke(#001EAF,80);
line(100,105,125,130);
strokeWeight(2);
stroke(#004AFF,80);
line(125,130,100,150);
line(100,150,125,170);
strokeWeight(11);
stroke(#001EAF,80);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#001EAF,80);
strokeWeight(11);
line(200,105,175,130);
strokeWeight(2);
stroke(#004AFF,80);
line(175,130,200,150);
line(200,150,175,170);
strokeWeight(11);
stroke(#001EAF,80);
line(175,170,200,195);

strokeWeight(7);
stroke(#004AFF,80);
//ligne centre croisement
line(175,130,150,150);
line(150,150,125,130);

//bas
strokeWeight(2);
line(125,170,150,150);
line(150,150,175,170);


//triangle
stroke(#E85900,80);
strokeWeight(2);
line(125,130,175,130);

//bas triangle
line(175,170,125,170);
/*
strokeWeight(4);
line(175,130,150,150);
line(150,150,125,130);

//triangle bas
stroke(#E85900,80);
strokeWeight(4);
line(175,170,125,170);
strokeWeight(9);
line(125,170,150,150);
line(150,150,175,170);


//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();

//triangle bas plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(175,170);
vertex(125,170);
vertex(150,150);
vertex(175,170);
endShape();
*/















//7
translate(125,0);
noFill();
strokeWeight(1);
stroke(#E34800,80);
rect(100,100,100,100);
//diagonales 

/*
//hg bd
strokeWeight(10);
line(100,100,150,150);
strokeWeight(5);
line(150,150,200,200);
//hd bg
strokeWeight(5);
line(200,100,150,150);
strokeWeight(10);
line(150,150,100,200);
*/
/*
//diago hg
stroke(#256293,80);
strokeWeight(10);
line(100,100,200,200);
line(200,100,100,200);
*/

//ligne côté gauche de haut en bas
strokeWeight(10);
stroke(#E34800,80);
line(100,105,125,130);
/*strokeWeight(2);
stroke(#004AFF,80);
line(125,130,100,150);
line(100,150,125,170);
*/
strokeWeight(10);
stroke(#E34800,80);
line(125,170,100,195);

//ligne côté droit haut en bas
stroke(#E34800,80);
strokeWeight(10);
line(200,105,175,130);
/*
strokeWeight(2);
stroke(#004AFF,80);
line(175,130,200,150);
line(200,150,175,170);
*/
strokeWeight(10);
stroke(#E34800,80);
line(175,170,200,195);

strokeWeight(2);
stroke(#E34800,80);
//ligne centre croisement
line(175,130,150,150);
line(150,150,125,130);

//bas
strokeWeight(2);
line(125,170,150,150);
line(150,150,175,170);


//triangle
stroke(#E85900,80);
strokeWeight(2);
line(125,130,175,130);

//bas triangle
line(175,170,125,170);
/*
strokeWeight(4);
line(175,130,150,150);
line(150,150,125,130);

//triangle bas
stroke(#E85900,80);
strokeWeight(4);
line(175,170,125,170);
strokeWeight(9);
line(125,170,150,150);
line(150,150,175,170);


//triangle plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(125,130);
vertex(175,130);
vertex(150,150);
vertex(125,130);
endShape();

//triangle bas plein
fill(#E85900,80);
noStroke();
beginShape();
vertex(175,170);
vertex(125,170);
vertex(150,150);
vertex(175,170);
endShape();
*/

 



