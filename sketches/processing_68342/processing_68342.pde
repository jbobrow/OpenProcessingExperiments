
size(618, 840);
background(244, 242, 227);

//cuadrilatero fondo
noStroke();
fill(227, 221, 199);
quad(14, 14, 604, 14, 604, 826, 14, 826); 

//cuadrilatero fondo gris
noStroke();
fill(161, 157, 145, 240);
quad(207, 207, 280, 138, 563, 420, 423, 420); 

//linea gris vertical derecha
stroke(135, 130, 117);
strokeWeight(6);
strokeCap(SQUARE);
line(423, 284, 423, 514);

//linea negra diagonal
stroke(186, 179, 160);
strokeWeight(2);
strokeCap(SQUARE);
line(115, 299, 400, 583);

//linea negra horizontal
stroke(0);
strokeWeight(4);
strokeCap(SQUARE);
line(115, 299,437, 299);

//linea negra horizontal abajo
stroke(186, 179, 160);
strokeWeight(3);
strokeCap(SQUARE);
line(246, 583, 400, 583);

//linea negra vertical de la cruz
stroke(0);
strokeWeight(13);
strokeCap(SQUARE);
line(280, 554, 280, 609);

//linea negra horizontal de la cruz
noStroke();
fill(42,40,42,200);
quad(256,583,304, 583, 304, 594, 256, 594); 

//circunferencia central

noStroke();
fill(17, 15, 16);
ellipse(236, 420, 262, 262);

//cuadrado
noStroke();
fill(0);
quad(300, 274, 325, 274,  325, 299, 300, 299);

//ladosuperior
noStroke();
fill(227, 221, 199);
quad(222, 195, 247, 195, 325, 274, 300, 274); 

//costado del cubo
noStroke();
fill(114, 110, 104);
quad(222, 195, 300, 274, 300, 299, 222, 220);
