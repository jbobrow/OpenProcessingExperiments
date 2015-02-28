
int counter;
// variables:
int des = 400;//desplazamientos
int des1 = 350;
int des2 = 200;
int des3 = 90;
int borde = 2;//grosor línea
color r = color (171,27,12);//color rojo
color p = color (176, 85, 117);//color púrpura
color a = color (220, 165, 36);//color amarillo
color y = color (46, 41, 93);//color morado
color z = color (12, 118, 188);//color celeste

size(600, 600);//tamaño mesa de trabajo
background(235, 233, 230);//color de fondo

//patrón cuadrado chico1
fill (255,255,255);
noStroke();
for (int m = 1; m <= 300 ; m = m +20) {
for (int n = 1 ; n <= 400; n = n +40) {
quad ( m-5, n-5, m-5, n+5, m+5, n+5, m+5, n-5); 
}
}

//elipses
fill (98, 102, 105, 100);//círculo grande
noStroke();
ellipse(133, 406, 300, 300);
fill (98, 102, 105, 50);//círculo chico
noStroke();
ellipse(307, 430, 200, 200);
fill (98, 102, 105, 70);//círculo grande
noStroke();
ellipse(358, 220, 290, 290);
fill (98, 102, 105, 100);//círculo gigante
noStroke();
ellipse(540, 349, 510, 510);
fill (98, 102, 105, 120);//círculo grande
noStroke();
ellipse(320,570 , 290, 290);

//LÍNEAS
//línea rosa
stroke(173, 74, 119);
strokeWeight(borde);
line(0, 553, 600, 130);
//línea amarilla
stroke(a);
strokeWeight(borde);
line(0, 583, 600, 215);
//línea púrpura
stroke(p);
strokeWeight(1);
line(30, 583, 600, 300);
//línea blanca 1
stroke(255, 255, 255);
strokeWeight(3);
line(56, 600, 600, 390);
//línea púrpura
stroke(p);
strokeWeight(10);
line(0, 556, 600, 200);
//línea blanca 1
stroke(255, 255, 255);
strokeWeight(3);
line(0, 510, 600, 70);

//arcos
noFill();
strokeWeight(borde);
stroke(255, 255, 255);
strokeCap(ROUND);
arc(247, 600, 100, 100, PI+ HALF_PI, TWO_PI);
strokeWeight(borde);
stroke(255, 255, 255);
strokeCap(ROUND);
arc(237, 611, 100, 100, PI+ HALF_PI, TWO_PI);
strokeWeight(borde);
stroke(255, 255, 255);
strokeCap(ROUND);
arc(260, 585, 100, 100, PI+ HALF_PI, TWO_PI);
strokeWeight(borde);
stroke(255, 255, 255);
strokeCap(ROUND);
arc(287, 560, 100, 100, PI+ HALF_PI, TWO_PI);
strokeWeight(borde);
stroke(255, 255, 255);
strokeCap(ROUND);
arc(307, 537, 100, 100, PI+ HALF_PI, TWO_PI);
strokeWeight(borde);
stroke(255, 255, 255);
strokeCap(ROUND);
arc(327, 520, 100, 100, PI+ HALF_PI, TWO_PI);

//cuadrados
fill (r);
noStroke();
quad (114, 287, 171, 338, 120, 394, 63, 343); 
fill (p);
noStroke();
quad (114+des1, 287-des2, 171+des1, 338-des2, 120+des1, 394-des2, 63+des1, 343-des2); 
fill (a);
noStroke();
quad (114+des3, 287+des3, 171+des3, 338+des3, 120+des3, 394+des3, 63+des3, 343+des3);
fill (y);
noStroke();
quad (114+des, 287, 171+des, 338, 120+des, 394, 63+des, 343); 
fill (z);
noStroke();
quad (114+des, 287+des2, 171+des, 338+des2, 120+des, 394+des2, 63+des, 343+des2); 

//rectángulos
fill (y);
noStroke();
quad (93, 443, 77, 494, 205, 433, 214, 366); 
fill (y);
noStroke();
quad (93+des2, 443, 77+des2, 494, 205+des2, 433, 214+des2, 366); 
fill (y);
noStroke();
quad (93+des2+des2, 443-des2, 77+des2+des2, 494-des2, 205+des2+des2, 433-des2, 214+des2+des2, 366-des2); 
fill (z);
noStroke();
quad (93-des3, 443, 77-des3, 494, 205-des3, 433, 214-des3, 366); 
fill (y);//rectángulo más delgado hacia abajo
noStroke();
quad (190, 360, 190, 376, 320, 298, 320, 270); 
fill (z);
noStroke();
quad (190+des3, 360, 190+des3, 376, 320+des3, 298, 320+des3, 270); 
fill (z);
noStroke();
quad (190, 360-des3, 190, 376-des3, 320, 298-des3, 320, 270-des3); 
fill (144, 27, 87);
noStroke();
quad (45, 515, 45, 536, 190, 458, 190, 430); 
fill (144, 27, 87);
noStroke();
quad (45+des3+des3, 515, 45+des3+des3, 536, 190+des3+des3, 458, 190+des3+des3, 430); 

//cuadriláteros
fill (y);//morado
beginShape();
vertex(349, 196); 
vertex(417, 169);
vertex(459, 221);
vertex(459, 221);
vertex(426, 261);
vertex(358, 235);
endShape(CLOSE);
fill (z);//celeste
beginShape();
vertex(230, 300); 
vertex(259, 292);
vertex(282, 343);
vertex(243, 377);
vertex(212, 352);
endShape(CLOSE);

//triángulos
//triángulos rojos
fill (r);
triangle(0,480,84,516,0,552);
fill (r);
triangle(0+des, 480-des, 84+des, 516-des, 0+des, 552-des);
fill (r);
triangle(0+des1, 480, 84+des1, 516, 0+des1, 552);
fill (r);
triangle(550, 240+des2, 550, 350+des2, 480, 400+des2);
fill (r);
triangle(418, 315, 393, 406, 286, 378);
fill (r);
triangle(235, 465, 146, 507, 186, 566);
//triángulos púrpura
fill (p);
triangle(80, 330, 113, 502, 30, 466);
fill (p);
triangle(80+des, 330, 113+des, 502, 30+des, 466);
fill (p);
triangle(80+des2, 330-des2, 113+des2, 502-des2, 30+des2, 466-des2);
fill (p);
triangle(526, 116, 592, 137, 557, 225);
//triángulo amarillo
fill (a);
triangle(90, 240+des2, 50, 350+des2, 70, 400+des2);
fill (a);
triangle(90+des, 240+des2, 50+des, 350+des2, 70+des, 400+des2);
fill (a);
triangle(550, 240, 550, 350, 480, 400);
fill (a);
triangle(418, 315-des3, 393, 406-des3, 286, 378-des3);
//triángulo morado
fill (y);
triangle(235+des1, 465, 146+des1, 507, 186+des1, 566);

fill (144, 27, 87);//rectángulo delgado
noStroke();
quad (45, 515-des3, 45, 536-des3, 190, 458-des3, 190, 430-des3); 
fill (144, 27, 87);//rectángulo delgado
noStroke();
quad (45+des3, 515-des2, 45+des3, 536-des2, 190+des3, 458-des2, 190+des3, 430-des2); 

//patrón repetido triángulos
fill (255,255,255);
for (int i = 1; i <= 600 ; i = i +50) {
for (int j = 1 ; j <= 600; j = j +50) {
triangle ( i, j, i+7, j+6, i+6, j+7); 
}
}
//patrón repetido cuadrado
fill (a);
noStroke();
for (int m = 1; m <= 600 ; m = m +100) {
for (int n = 1 ; n <= 600; n = n +150) {
quad ( m-10, n-10, m-10, n+10, m+10, n+10, m+10, n-10); 
}
}
//patrón repetido cuadrado chico
fill (z);
noStroke();
for (int m = 1; m <= 700 ; m = m +150) {
for (int n = 1 ; n <= 700; n = n +200) {
quad ( m-5, n-5, m-5, n+5, m+5, n+5, m+5, n-5); 
}
}

//patrón repetido cuadrado chico
fill (p);
noStroke();
for (int m = 1; m <= 500 ; m = m +230) {
for (int n = 1 ; n <= 500; n = n +170) {
quad ( m-5, n-5, m-5, n+5, m+5, n+5, m+5, n-5); 
}
}
