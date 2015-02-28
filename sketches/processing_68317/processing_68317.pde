
size(500, 680); //tamaño de la imagen
background(254, 252, 214); //color fondo

stroke(180, 158, 79);
strokeWeight(5);
line(5, 670, 495, 560);

stroke(0);
strokeWeight(4);
line(0, 599, 500, 599); //línea gruesa horizontal (abajo)

fill(255, 0);
stroke(221, 216, 164);
strokeWeight(1);
ellipse(311, 533, 128, 128);//circulo más claro, atrás

stroke(204, 204, 153);
strokeWeight(2);
line(328, 511, 258, 210);

fill(0);
stroke(0);
strokeWeight(1);
ellipse(326, 534, 127, 46);//ovalo negro horizontal

fill(255, 0);
stroke(113, 76, 44);
strokeWeight(1);
ellipse(325, 533, 128, 128);//circulo central, más oscuro

fill(255, 0);
stroke(113, 76, 44);
strokeWeight(1);
ellipse(327, 534, 46, 128);//óvalo más oscuro, adelante

stroke(60, 55, 52);
line(306, 555, 348, 512);//línea diagonal circulo central

stroke(113, 76, 44);
line(327, 470, 390, 406);

stroke(166, 141, 102);
strokeWeight(2);
line(390, 406, 390, 266); //línea recta vertical más a la derecha

fill(230, 225, 180, 50);
stroke(210, 193, 144, 50);
strokeWeight(1);
quad(287, 137, 271, 72, 207, 88, 222, 152); //cuadrado más claro, atrás negro

fill(230, 203, 103, 50);
noStroke();
quad(298, 153, 265, 190, 290, 294, 320, 250);//rombo más transparente

noStroke();
fill(212, 189, 139, 150);
beginShape(); //figura extraña mostaza, puntos de derecha inf a izq)
vertex(268, 207);
vertex(263, 175);
vertex(199, 190);
vertex(184, 127);
vertex(152, 134);
vertex(175, 228);
endShape(CLOSE);

stroke(0);
strokeWeight(1);
fill(0);
beginShape(); //figura extraña negra, puntos de derecha sup a izq)
vertex(360, 171);
vertex(295, 171);
vertex(295, 105);
vertex(263, 105);
vertex(263, 203);
vertex(360, 203);
endShape(CLOSE);

noStroke();
fill(166, 141, 102);
quad(360, 171, 400, 130, 400, 256, 360, 297); //rombo más claro

stroke(41, 19, 22);
strokeWeight(1);
fill(78, 64, 57);
rect(324, 73, 66, 66); //cuadrado de la derecha, arriba


stroke(0);
strokeWeight(2);
line(348, 204, 348, 512); //línea izquierda

noStroke();
fill(102, 51, 51, 50);
quad(295, 105, 333, 64, 207, 64, 170, 105); //rombo rosa

/*
rotate(13);
stroke(210, 193, 144);
fill(230, 225, 180);
rect(215, 79, 66, 66);
¿cómo hacer para que al rotar, rote en el centro?
*/

stroke(204, 204, 153, 60);
strokeWeight(2);
line(298, 470, 343, 396);

line(343, 396, 312, 261);

fill(230, 203, 103, 50);
noStroke();
quad(184, 127, 215, 76, 92, 105, 62, 153); //rombo MÄS claro, izq
