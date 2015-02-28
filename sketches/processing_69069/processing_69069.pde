
//antes que todo se ingresan las variables y luego tam canvas
//xpos e ypos es posicion en x e y


//desplazamiento de los gatitos

int xpos = 150;
int ypos = 5;


//color llenado se utiliza de esta manera:

color a = color(255,0,0);
color aborde = color(200,20,20);
color b = color(0, 255, 0);
color bborde = color (20, 200, 20);
color c = color(0, 0, 255);
color cborde = color(20, 20, 200);

//variable ojos
int dam = 10;

//cabeza

int dam1 = 100;
int dam2 = 90;
int dam3 = 105;

//variable borde elipse 
int bordeIzq = 8;
int bordeAzul = 11;

//variable orejas
int orejas = 3;



// canvas
size (500, 500);
background(0);
noStroke();

//cerro atras

fill(90,140,100);
stroke(90,110,80);
strokeWeight(8);
arc(100,400,500,200, 0-PI, 180); 

//Cerro2
fill(90,140,100);
stroke(90,110,80);
strokeWeight(8);
arc(400,400,500,300, 0-PI, 180); 

//suelo o pasto
fill(90,170,100);
stroke(90,110,80);
quad(0, 400, 500, 400, 500, 500, 0, 500);

//luna
fill(255);
stroke(240);
strokeWeight(2);
ellipse(100, 70, 100, 100);

//GATO 1

//cuerpo 
fill(a);
stroke(aborde);
strokeWeight(bordeIzq);
quad(80,310, 123, 310, 123, 400, 80, 400);

//cabeza 
fill(a);
stroke (aborde);
strokeWeight(bordeIzq);
ellipse(100, 290, dam1, dam1);

//ojos
fill(0);
stroke(aborde);
strokeWeight(bordeIzq - 6);
ellipse (85, 290, 10, 10+dam);

fill(0);
stroke(aborde);
strokeWeight(bordeIzq - 6);
ellipse (115, 290, 10, 10+dam);

//puntito blanco en el ojo

fill(255);
noStroke();
strokeWeight(bordeIzq - 7);
ellipse (85+1, 288,dam-5, dam);

fill(255);
noStroke();
strokeWeight(bordeIzq - 7);
ellipse (115+1, 288, dam-5, dam);

//nariz

fill(0);
stroke(aborde);
strokeWeight(bordeIzq - 5);
beginShape();
vertex(95,300);
vertex(105,300);
vertex(100,310);
endShape(CLOSE);

noFill();
stroke(0);
strokeWeight(bordeIzq - 5);
arc(90, 310, 20, 17, 0, TWO_PI-PI);
//arc(x, y, amcho, alto, inicio, termino);
noFill();
stroke(0);
strokeWeight(bordeIzq - 5);
arc(90 + 20, 310, 20, 17, 0, TWO_PI-PI);
//arc(x, y, amcho, alto, inicio, termino);
   
//orejas

fill(a);
stroke(aborde);
strokeWeight(orejas);
beginShape();
vertex(74, 250);
vertex(82,230);
vertex(90,250);
endShape();

fill(a);
stroke(aborde);
strokeWeight(orejas);
beginShape();
vertex(74 + 35, 250);
vertex(82 + 35,230);
vertex(90 + 35,250);
endShape();

//cola
noFill();
stroke(aborde);
strokeWeight(9);
arc(130, 330, 100, 100, 0-QUARTER_PI, TWO_PI-PI-HALF_PI);

//linea pies
noFill();
stroke(aborde);
strokeWeight(bordeIzq);
line(101, 380, 101, 400);

//guatita
noFill();
stroke(aborde);
strokeWeight(6);
arc(100, 365, 24, 20, 0, TWO_PI-PI);


//GATO 2

//cuerpo 
fill(b);
stroke(bborde);
strokeWeight(bordeIzq);
quad(80+xpos,310, 123+xpos, 310, 123+xpos, 400, 80+xpos, 400);

//cabeza 
fill(b);
stroke (bborde);
strokeWeight(bordeIzq);
ellipse(100+xpos, 290, dam2, dam2);

//ojos
fill(0);
stroke(bborde);
strokeWeight(bordeIzq - 6);
ellipse (85+xpos, 290, 10, 10);

fill(0);
stroke(bborde);
strokeWeight(bordeIzq - 6);
ellipse (115+xpos, 290, 10, 10);

//puntito blanco en el ojo

fill(255);
noStroke();
strokeWeight(bordeIzq - 7);
ellipse (85+xpos+1, 288,dam-5, dam-5);

fill(255);
noStroke();
strokeWeight(bordeIzq - 7);
ellipse (115+xpos+1, 288, dam-5, dam-5);

//nariz

fill(0);
stroke(bborde);
strokeWeight(bordeIzq - 5);
beginShape();
vertex(95+xpos,300);
vertex(105+xpos,300);
vertex(100+xpos,310);
endShape(CLOSE);

noFill();
stroke(0);
strokeWeight(bordeIzq - 5);
arc(90+xpos, 310, 20, 17, 0, TWO_PI-PI);
//arc(x, y, amcho, alto, inicio, termino);
noFill();
stroke(0);
strokeWeight(bordeIzq - 5);
arc(90+xpos + 20, 310, 20, 17, 0, TWO_PI-PI);
//arc(x, y, amcho, alto, inicio, termino);
   
//orejas

fill(b);
stroke(bborde);
strokeWeight(orejas);
beginShape();
vertex(74+xpos, 250+ypos);
vertex(82+xpos,230);
vertex(90+xpos,250+ypos);
endShape();

fill(b);
stroke(bborde);
strokeWeight(orejas);
beginShape();
vertex(74 + 35+xpos, 250+ypos);
vertex(82 + 35+xpos,230);
vertex(90 + 35+xpos,250+ypos);
endShape();

//cola
noFill();
stroke(bborde);
strokeWeight(9);
arc(130+xpos, 330, 100, 100, 0-QUARTER_PI, TWO_PI-PI-HALF_PI);

//linea pies
noFill();
stroke(bborde);
strokeWeight(bordeIzq);
line(101+xpos, 380, 101+xpos, 400);

//guatita
noFill();
stroke(bborde);
strokeWeight(6);
arc(100+xpos, 365, 24, 20, 0, TWO_PI-PI);

//GATO3

//cuerpo 
fill(c);
stroke(cborde);
strokeWeight(bordeAzul);
quad(80+xpos+xpos,310, 123+xpos+xpos, 310, 123+xpos+xpos, 400, 80+xpos+xpos, 400);

//cabeza 
fill(c);
stroke (cborde);
strokeWeight(bordeAzul);
ellipse(100+xpos+xpos, 290, dam3, dam2);

//ojos
fill(0);
stroke(cborde);
strokeWeight(bordeIzq - 6);
ellipse (85+xpos+xpos, 290, 10+dam, 10+dam);

fill(0);
stroke(cborde);
strokeWeight(bordeIzq - 6);
ellipse (115+xpos+xpos, 290, 10+dam, 10+dam);

//puntito blanco en el ojo

fill(255);
stroke(cborde);
strokeWeight(bordeIzq - 6);
ellipse (85+xpos+xpos+1, 287,dam, dam);

fill(255);
stroke(cborde);
strokeWeight(bordeIzq - 6);
ellipse (115+xpos+xpos+1, 287, dam, dam);

//nariz

fill(0);
stroke(cborde);
strokeWeight(bordeIzq - 5);
beginShape();
vertex(95+xpos+xpos,300);
vertex(105+xpos+xpos,300);
vertex(100+xpos+xpos,310);
endShape(CLOSE);

noFill();
stroke(0);
strokeWeight(bordeIzq - 5);
arc(90+xpos+xpos, 310, 20, 17, 0, TWO_PI-PI);
//arc(x, y, amcho, alto, inicio, termino);
noFill();
stroke(0);
strokeWeight(bordeIzq - 5);
arc(90+xpos+xpos+ 20, 310, 20, 17, 0, TWO_PI-PI);
//arc(x, y, amcho, alto, inicio, termino);
   
//orejas

fill(c);
stroke(cborde);
strokeWeight(orejas);
beginShape();
vertex(74+xpos+xpos, 250+ypos);
vertex(82+xpos+xpos,230);
vertex(90+xpos+xpos,250+ypos);
endShape();

fill(c);
stroke(cborde);
strokeWeight(orejas);
beginShape();
vertex(74 + 35+xpos+xpos, 250+ypos);
vertex(82 + 35+xpos+xpos,230);
vertex(90 + 35+xpos+xpos,250+ypos);
endShape();

//cola
noFill();
stroke(cborde);
strokeWeight(bordeAzul);
arc(130+xpos+xpos, 330, 100, 100, 0-QUARTER_PI, TWO_PI-PI-HALF_PI);

//linea pies
noFill();
stroke(cborde);
strokeWeight(bordeIzq);
line(101+xpos+xpos, 380, 101+xpos+xpos, 400);

//guatita
noFill();
stroke(cborde);
strokeWeight(6);
arc(100+xpos+xpos, 365, 24, 20, 0, TWO_PI-PI);
