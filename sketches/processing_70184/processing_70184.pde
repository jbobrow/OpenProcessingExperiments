
// Declaración de Variables

//Variable para cuadrilateros
int posx1 = -30;
int posx2 = 30;

//Variable para elipses

int desplx = -40;
int desply = 40;

int desplxx = 40;
int desplyy = - 40;

//variable para triangulos

int movx =10;


// El Seteo

size(900,700);
background (239,239,100, 170); 

// La Sección del Dibujo

// Cuadrilatero parte atras
noStroke ();
fill (200,200);
quad (0,700, 280,100, 900,500, 900,700);

// Forma creada con vertex con color transparente
noStroke ();
fill (110,0,90,70);
beginShape ();

vertex (99, 12);
vertex (64, 431);
vertex (435, 42);
vertex (186, 660);
vertex (732, 60);
vertex (540, 630);
vertex (875, 364);
vertex (360, 540);
vertex (440, 200);
vertex (77,  562);
vertex (168, 58);
vertex (30, 162);

endShape (CLOSE);

// Repetición trinagulos color violeta transparente
stroke (216,57,255);
for (int a= 180; a<=695; a= a+25) {
  for (int b = 500; b<= 695; b= b+85) {
    triangle (280, a, 380, b, 500, a);
    
  }
}

// Arco Celeste 
noStroke ();
fill (132,199,255);
arc (280, 224, 390,390, 1.68,6.13);

// Repeticion triangulos color azul transparente
stroke (137,200,232);
fill (0,0,255,10);
for (int i= 280; i<=890; i= i+ 30) {
  for (int k = 500; k<=890; k= k+ 400) {
    for (int j= 260; j<= 890 ; j= j+60) {
      triangle (i, 224, k, 320, j, 400);
      
    }
  }
}

// Lineas
stroke (255);
strokeCap (SQUARE);
strokeWeight (11);
line (477,80, 570,20);
line (486,120, 620,60);

stroke (100,190);
strokeCap (SQUARE);
strokeWeight (10);
line (477,80, 570,20);
line (486,120, 620,60);

// Circulos en el arco
strokeWeight (1);
stroke (0,0,255,120);
ellipse (280-50, 224-50, 80,80);
ellipse (280-50, 224-50, 70,70);
ellipse (280-50, 224-50, 60,60);
ellipse (280-50, 224-50, 50,50);
ellipse (280-50, 224-50, 40,40);
ellipse (280-50, 224-50, 30,30);

stroke (0,0,255,60);
ellipse (280-50 +desplx, 224-50 +desply, 80,80);
ellipse (280-50 +desplx, 224-50 +desply, 70,70);
ellipse (280-50 +desplx, 224-50 +desply, 60,60);
ellipse (280-50 +desplx, 224-50 +desply, 50,50);
ellipse (280-50 +desplx, 224-50 +desply, 40,40);
ellipse (280-50 +desplx, 224-50 +desply, 30,30);

stroke (0,0,255,60);
ellipse (280-50 +desplxx, 224-50 +desplyy, 80,80);
ellipse (280-50 +desplxx, 224-50 +desplyy, 70,70);
ellipse (280-50 +desplxx, 224-50 +desplyy, 60,60);
ellipse (280-50 +desplxx, 224-50 +desplyy, 50,50);
ellipse (280-50 +desplxx, 224-50 +desplyy, 40,40);
ellipse (280-50 +desplxx, 224-50 +desplyy, 30,30);



// Cuadrilatero para diamante parte 1
stroke (255);
fill (100,190);
quad (768,570, 816,570, 852,598, 768,675);
quad (768,570, 816+posx1,570, 852+posx1,598, 768,675);

// Cuadrilatero para diamante parte 2
stroke (255);
fill (100,190);
quad (768,570, 816-93.75,570, 852-166,598, 768,675);
quad (768,570, 816-93.75+posx2,570, 852-166+posx2,598, 768,675);


// Rectangulo

rect (750,20, 50, 150);
rect (750,20, 50, 150);
rect (750,20, 50, 150);
// triangulo

triangle (14 +movx,579, 121+movx,583, 121+movx,685);
triangle (10 +movx,569, 111 +movx,573, 111 +movx,675);
triangle (5 +movx,559, 101 +movx,563, 101 +movx,665);
