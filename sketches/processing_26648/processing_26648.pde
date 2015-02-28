
// idep 2011 
// 
//Gerard Bernal

size(450,600);
PImage b;
b=loadImage("fondo_textura.jpg");
background(b);
smooth();
noStroke();
stroke(105,32,22);
fill(248,232,205);
quad(100, 0, 390, 0, 390, 600, 100, 600);
fill(232,138,45);
quad(136, 0, 193, 0, 193, 600, 136, 600);
fill(105,32,22);
//Las coordenadas: primero esq.sup.izda  segundo:esq.sup.der. tercero:esq.inf.der.
//cuarto:esq.inf.izda.
quad(267, 115, 291, 130, 289, 166, 265, 151);
quad(237, 167, 263, 181, 260, 215, 238, 205);
quad(319, 199, 343, 184, 342, 218, 320, 230);
quad(286, 242, 308, 230, 309, 261, 285, 275);
quad(243, 268, 266, 281, 268, 416, 244, 404);
quad(273, 425, 299, 438, 301, 573, 274, 557);
quad(116, 0, 140, 0, 140, 600, 116, 600);
quad(372, 0, 385, 0, 385, 600, 372, 600);
triangle(0, 445, 20, 463, 0, 482);
fill(125,112,130);
stroke(105,32,22);
quad(160, 407, 449, 545, 449, 620, 161, 477);
quad(88, 474, 364, 600, 0, 600, 0, 536);



