
// declaración de variables

// int se refiere a numeros enteros ...,-3,2,1,0,1,2,3..
int ancho = 200;
int alto = 300;

// define el tamaño de la ventana
size(500, 600);
background(180, 25, 50);

// rect(x, y, ancho, alto);
fill(30, 5, 5, 70);
stroke(65, 25, 70);
strokeWeight(3);
rect(250-(ancho/2), 250, ancho, alto);

// para dibujar elipses. (el circulo es un tipo de elipse)
fill(11, 4, 124, 195);
stroke(0,230,0, 50);
strokeWeight(100);
ellipseMode(CORNER); 
ellipse(250-(ancho/2), 20, ancho, alto);

// triangulo
strokeWeight(1);
fill(135, 170, 105, 175);
stroke(29,29,180);
triangle(250, 25, 250-90, 400, 250+90, 400);

//arco
stroke(255,255,255,175);
fill(29,29,180, 120);
arc(0, 0, 500, 600, PI/2, 3*PI/2);

//lines
strokeWeight(1);
stroke(60, 180, 25, 175);
line(250, 300, 500, 0);
line(250, 300, 500, 60);
line(250, 300, 500, 120);
line(250, 300, 500, 180);
line(250, 300, 500, 240);
line(250, 300, 500, 300);
line(250, 300, 500, 360);
line(250, 300, 500, 420);
line(250, 300, 500, 480);
line(250, 300, 500, 540);
line(250, 300, 500, 600);

line(500, 600, 450, 0);
line(500, 540, 400, 0);
line(500, 480, 350, 0);
line(500, 420, 300, 0);
line(500, 360, 250, 0);
line(500, 300, 200, 0);
line(500, 240, 150, 0);
line(500, 180, 100, 0);
line(500, 120, 50, 0);
line(500, 60, 0, 0);

line(500, 540, 0, 600);
line(500, 480, 50, 600);
line(500, 420, 100, 600);
line(500, 360, 150, 600);
line(500, 300, 200, 600);
line(500, 240, 250, 600);
line(500, 180, 300, 600);
line(500, 120, 350, 600);
line(500, 60, 400, 600);
line(500, 0, 450, 600);




