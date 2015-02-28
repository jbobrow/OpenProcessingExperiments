
//author Carlos Cevallos Manzano
//clase 1r de ASIX grup tarda

//tamany del dibuix 
void setup (){
  size (600, 600); 
  background (90, 182, 206);
}

//cuerpo de Bob Esponja
void draw (){
fill (255, 255, 51);
stroke (#D0D13D);
strokeWeight (10);
rect (65, 80, 290, 295);

//contorno ojos 
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);

//ojos
ellipse (155, 190, 100, 100);
ellipse (255, 190, 100, 100); 

//relleno de ojos 
fill (0, 160, 198);
stroke (#000000);
strokeWeight (3);
ellipse (170, 190, 45, 45);
ellipse (240, 190, 45, 45);

//pupila de ojos 
fill (#000000);
noStroke ();
ellipse (170, 190, 20, 20);
ellipse (240, 190, 20, 20);

//nariz
fill (255, 255, 51);
stroke (161, 179, 13);
strokeWeight (3);
arc (200, 230, 40, 45, 2.01 , 3.05 * PI / 1.32);

//boca
noFill ();
stroke (#000000);
strokeWeight (3);
arc (200, 250, 215, 110, 19.01, 21.80);

//comisuras boca
stroke (#000000);
strokeWeight (3);
line (87, 259, 102, 259);
line (297, 259, 312, 259);

//mejillas sonrisa
noFill ();
stroke (255, 0, 0);
strokeWeight (3);
arc (310, 255, 40, 35, 2.85 , 3.05 * PI / 1.32);
arc (100, 255, 40, 35, 2.01 , 3.05 * PI / 1.42);
fill (255, 0, 0);
ellipse (90, 250, 5, 4);
ellipse (110, 250, 5, 4);
ellipse (100, 253, 5, 4);
ellipse (300, 250, 5, 4);
ellipse (320, 250, 5, 4);
ellipse (310, 253, 5, 4);

//agujeros de la esponja
fill (161, 179, 13);
noStroke ();
ellipse (100, 120, 23, 42); 
ellipse (320, 130, 18, 27); 
ellipse (90, 160, 13, 22); 
ellipse (125, 340, 23, 42);
ellipse (100, 310, 13, 22);
ellipse (320, 310, 23, 42);
ellipse (320, 350, 13, 22);

//dientes
fill (#FFFFFF);
stroke (#000000);
strokeWeight (2);
rect (165, 305, 30, 20);
rect (205, 305, 30, 20);

//camiseta
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
rect (65, 375, 290, 30);

//giros camiseta
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
triangle (140, 375, 190, 375, 165, 395);
triangle (210, 375, 260, 375, 235, 395);

//pantalon
fill (222, 147, 41);
stroke (#000000);
strokeWeight (3);
rect (65, 405, 290, 40);
fill (#000000);
noStroke ();
rect (85, 410, 25, 10);
rect (145, 410, 25, 10);
rect (250, 410, 25, 10);
rect (310, 410, 25, 10);

//corbata 
fill (255, 0, 0 );
noStroke();
rect (188, 377, 24, 40);
triangle (188, 417, 212, 414, 200, 432);

//barbilla
noFill ();
stroke (249, 155, 204);
strokeWeight (3);
arc (179, 315, 60, 65, 0.81 , 2.55);
arc (225, 318, 60, 65, 0.61 , 2.55);

//muslos 
fill (222, 147, 41);
stroke (#000000);
strokeWeight (2);
rect (130, 445, 50, 20);
rect (240, 445, 50, 20);

//pierna izquierda
fill (255, 255, 51);
stroke (#000000);
strokeWeight (2);
rect (145, 465, 20, 50);
fill (#FFFFFF);
stroke (#000000);
strokeWeight (2);
rect (145, 515, 20, 40);
fill (#000000);
stroke (#000000);
rect (145, 510, 20, 10);
fill (255, 0, 0); 
stroke (#000000);
strokeWeight (1);
rect(145, 538,20, 7);
fill (0, 160, 198);
stroke (#000000);
strokeWeight (1);
rect (145, 524,20, 10);

//zapatos pierna izquierda
fill (#000000);
stroke (#000000);
ellipse (155, 565, 30, 30);
ellipse (125, 565, 50, 35);

//pierna derecha
fill (255, 255, 51);
stroke (#000000);
strokeWeight (2);
rect (255, 465, 20, 50);
fill (#FFFFFF);
stroke (#000000);
strokeWeight (2);
rect (255, 515, 20, 40);
fill (#000000);
stroke (#000000);
rect (255, 510, 20, 10);
fill (255, 0, 0); 
stroke (#000000);
strokeWeight (1);
rect(255,538,20, 7);
fill (0, 160, 198);
stroke (#000000);
strokeWeight (1);
rect (255, 524,20, 10);

//zapatos pierna derecha
fill (#000000);
stroke (#000000);
ellipse (265, 565, 30, 30);
ellipse (295, 565, 50, 35);

//brazos izquierdo
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
rect (40, 360, 25, 50);
fill (255, 255, 51);
stroke (#000000);
strokeWeight (3);
rect (45, 410, 20, 50);

//mano izquierda
fill (255, 255, 51);
stroke (#000000);
strokeWeight (3);
ellipse (55,480, 30, 50);
ellipse (45, 485, 10, 30);
ellipse (52, 488, 10, 30);
ellipse (59, 488, 10, 30);
ellipse (66, 485, 8,30);

//brazos derecho
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
rect (355, 360, 25, 50);
fill (255, 255, 51);
stroke (#000000);
strokeWeight (3);
rect (355, 410, 20, 50);

//mano derecha
fill (255, 255, 51);
stroke (#000000);
strokeWeight (3);
ellipse (365,480, 30, 50);
ellipse (355, 485, 10, 30);
ellipse (362, 488, 10, 30);
ellipse (369, 488, 10, 30);
ellipse (376, 485, 8,30);

//burbujas de agua 
int posicion = 0;
fill (#7CB8E8);
stroke (#479EE3);
strokeWeight (7);
ellipse (450, 500, 30, 40);
ellipse (500, 550, 35, 40);
ellipse (400, 450, 40, 40);
ellipse (540, 410, 30, 40);
ellipse (510, 360, 40, 50);
ellipse (460, 313, 30, 40);
ellipse (500, 200, 30, 40);
ellipse (450, 180, 30, 40);
ellipse (500, 250, 35, 40);
ellipse (400, 120, 40, 40);
ellipse (540, 210, 30, 40);
ellipse (510, 360, 40, 50);
ellipse (460, 113, 30, 40);
ellipse (500, 90, 30, 40);
ellipse (400, 40, 40, 40);

}
  
 
  

