
int desplazo = 570;
color fondo = color(244, 125, 0);


// v 1
//color pupila
color ojo1 = color(0);
//color cuerpo 1
color cuerpo1 = color(0, 155, 25);
//borde 1
int borde1 = 5;



// v 1copia
//borde 1copia
int borde1c = 5;
//desplazar pupila 1copia
int ojo1c = -10;
//color cuerpo 1c
color cuerpo1c = color(0, 155, 25);



// v 2
//color cuerpo 1c
color cuerpo2 = color(25, 0, 100);
//color nariz
color cnariz = color(232, 97, 0);
//borde 2
int borde2 = 6;
//gordura pinguino (ponerle 100)
int gordo = 0;



/*____________________________________________*/


size(1000, 700);
background(fondo);

// 1

strokeWeight(borde1);
fill(cuerpo1);

beginShape();
vertex(100, 400);
vertex(250, 230);
vertex(350, 400);
vertex(190, 550);
vertex (280, 550);
endShape(CLOSE);

//ojo iz
strokeWeight(2);
fill(255);
ellipse(200, 350, 20, 25);

noStroke();
fill(ojo1);
ellipse(205, 350, 10, 12);

//ojo der
stroke(0);
strokeWeight(2);
fill(255);
ellipse(250, 350, 25, 30);

noStroke();
fill(ojo1);
ellipse(255, 350, 10, 15);

//boca
stroke(0);
strokeWeight(3);
noFill();
arc(230, 400, 100, 50, 0, 3.14);

// 1copia

stroke(0);
strokeWeight(borde1c);
fill(cuerpo1c);

beginShape();
vertex(100 +desplazo, 400);
vertex(250 +desplazo, 230);
vertex(350 +desplazo, 400);
vertex(190 +desplazo, 550);
vertex (280 +desplazo, 550);
endShape(CLOSE);

//ojo iz
stroke(0);
strokeWeight(2);
fill(255);
ellipse(200 +desplazo, 350, 20, 25);

noStroke();
fill(0);
ellipse(205 +desplazo +ojo1c, 350, 10, 12);

//ojo der
stroke(0);
strokeWeight(2);
fill(255);
ellipse(250 +desplazo, 350, 25, 30);

noStroke();
fill(0);
ellipse(255 +desplazo +ojo1c, 350, 10, 15);

//boca
stroke(0);
strokeWeight(3);
noFill();
arc(230+ desplazo, 400, 100, 50, 0, 3.14);



// 2
stroke(0);
strokeWeight(borde2);
fill(cuerpo2);
ellipse(500, 350, 100, 100);
ellipse(500, 480, 200+ gordo, 200);

fill(255);
ellipse(500, 480, 150+ gordo, 160);

//nariz
fill(cnariz);
beginShape();
vertex(490, 350);
vertex(505, 352);
vertex(498, 510);
endShape(CLOSE);

//ojo iz
stroke(0);
strokeWeight(2);
fill(255);
ellipse(480, 330, 20, 25);

noStroke();
fill(0);
ellipse(480, 330, 10, 12);

// ojo der
stroke(0);
strokeWeight(2);
fill(255);
ellipse(510, 330, 20, 25);

noStroke();
fill(0);
ellipse(510, 330, 10, 12);
