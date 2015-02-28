
size(643,800);
PImage fondo;
fondo = loadImage("fondo.jpg");
background(fondo);
smooth();
noStroke();
// rectangulo 01
fill(#E5F7FF,150);
rect(25,0,140,800);
// rectangulo 02
fill(#480707,230);
rect(185,0,36,800);
// rectangulo 03
fill(#eb8c2e,210);
rect(221,0,70,800);
// rectangulo 03b
fill(#480707,230);
rect(291,0,2,800);
// rectangulo 04
fill(#B25F12,180);
rect(221,0,70,800);
// rectangulo 05
fill(#480707,180);
rect(538,0,5,800);
// rectangulo 06
fill(#eb8c2e,200);
rect(543,0,6,800);
// rectangulo 07
fill(#480707,180);
rect(549,0,3,800);
// rectangulo 08
fill(#E5F7FF,150);
rect(565,0,80,800);
// poligono 01, los puntos van en sentido antihorario
//1(izq.arriba)-2(izq-abajo)-3(dcha-abajo)-4(dha-arriba)
fill(#671100,150);
quad(394,151,391,200,424,220,425,170);
// poligono 02
fill(#671100,130);
quad(355,226,355,272,386,292,386,242);
// poligono 03
fill(#671100,110);
quad(464,262,464,304,496,290,496,242);
// poligono 04
fill(#671100,100);
quad(416,322,418,364,449,347,449,304);
// poligono 05
fill(#671100,150);
quad(362,356,362,537,394,552,392,374);
// poligono 06
fill(#671100,150);
quad(401,566,401,800,437,800,437,582);
// triangulo paret izqda
fill(#480707,255);
triangle(0,572,0,660,60,615);
// poliogono derecha
stroke(#480707);
fill(#a38a8d,255);
quad(245,542,245,633,643,820,643,729);
//triangulo suelo
stroke(#480707);
fill(#767789,255);
triangle(151,630,-90,800,524,800);

