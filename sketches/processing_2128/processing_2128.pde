
size(480,666);
//tamaño del lienzo
smooth();
//suavizado de los bordes pixelados
noStroke();

PImage fondo = loadImage("malevich.JPG"); 
background(fondo); 
//descarga de imagen y definición de ésta como background
noStroke();


fill(171, 39, 1); 
//color del relleno en rgb
ellipse(94, 108, 158, 158); 
//tipo de polígono y coordenadas en y, x, y,x 
noStroke(); 
// círculo

fill(209, 172, 29); 
quad(26, 277, 374, 244, 375, 270, 32, 308);
noStroke();
// figura horizontal ocre

fill(217, 197, 217); 
quad(248, 417, 300, 417, 248, 573, 192, 573);
noStroke(); 
//figura diagonal 3_rosa

 
fill(4, 9, 109); 
quad(190, 118, 243, 100, 248, 108, 191, 125);
noStroke(); 
// parte cruz horitzontal 

fill(4, 9, 109); 
quad(220, 88, 309, 584, 296, 590, 209, 90);
noStroke(); 
// parte cruz vertical 

fill(17, 14, 41); 
quad(398, 176, 330, 311, 186, 238, 258, 105);
noStroke(); 
// quadrat

fill(209, 172, 29); 
quad(170, 425 , 195, 425, 105, 679, 80, 679);
noStroke(); 
//figura diagonal 1_ocre

fill(127, 35, 12); 
quad(205, 400, 245, 400, 165, 620, 125, 620);
noStroke();
//figura diagonal 2_granate


fill(150, 28, 5); 
quad(426, 552, 426, 580, 312, 642, 298, 620);
noStroke(); 
// figura esquina 1

fill(205, 150, 1); 
quad(362, 622, 362, 640, 464, 592, 464, 572);
noStroke(); 
// figura esquina 2
 
 
 


