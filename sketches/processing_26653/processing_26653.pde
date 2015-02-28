
/* Idep 2010-2011 
Posgrado de Motion Graphics 
Proyecto: Frantisek Kupka con processing
Marta Abad 
/*


/*Tamaño del documento que tiene que coincidir con el tamaño en pixeles de la imagen de fondo*/
size (482, 600);
PImage b;
b= loadImage ("fondo.jpg");
background (b);

/* Rectangulo 1 color crema que aparece a la izquierda, se le aplica alfa para que se entrevea la textura de fondo*/
noStroke ();
fill (248, 235, 219, 85);
rect (0, 0, 22, 600);

/* Rectangulo 2 gris, se le aplica alfa para que se entrevea la textura de fondo*/
smooth ();
/*¿suaviza la linea?*/
strokeWeight(1);
stroke (197, 183, 174,100);
fill (211, 211, 210, 95);
rect (22, 0, 203, 600);

/*Rectangulo 3 color crema con alfa*/
noStroke ();
fill (248, 235, 219, 85);
rect (123, 0, 17, 600);



/* Rectangulo 4 marron*/
noStroke ();
fill (114,20,18);
rect (140, 0, 24, 500);

/* Rectangulo 5 naranja*/
smooth ();
strokeWeight(1);
stroke (122, 18, 16);
fill (217, 112, 31);
rect (164, -1, 54, 545);

/* Rectangulo 6 color crema con alfa*/
noStroke ();
fill (240, 213, 157, 90);
rect (218, 0, 210, 600);

/*Rectangulo 7 marron estrecho*/
noStroke ();
fill (148, 55, 21);
rect (400, -1, 13, 602);

/* Rectangulo 8 color gris con alfa*/
smooth ();
strokeWeight(2);
stroke (197, 183, 174,100);
fill (211, 211, 210, 95);
rect (420, 0, 62, 600);






/*Los 6 quads centrales marrones*/

noStroke ();
fill (98,32,18);
quad(265, 167, 290, 180, 290, 218, 265,205);

noStroke ();
fill (118,48,36);
quad(294, 112, 318, 127, 317, 164, 293,151);

noStroke ();
fill (158,65,32);
quad (348, 195, 371, 182, 371,216, 348,230);

noStroke ();
fill (158,65,32);
quad (312, 241, 336, 226, 336,260, 312,274);

noStroke ();
fill (125,47,27);
quad (270, 266, 295, 280, 294,415, 270,403);

noStroke ();
fill (127,37,29);
quad (300, 423, 327, 436, 330,571, 300,573);


/*Quad gris que como tiene que colocarse en primer 
plano encima de los quads marrones, se coloca al final de todo el text*/
smooth ();
strokeWeight(1);
stroke (100, 54, 58);
fill (165,148,158);
quad(185, 473, 184, 406, 482, 546, 481, 612);

/* Quad() situado en la parte inferior, que sirve de base al cuadro*/
strokeWeight(1);
stroke (100, 54, 58);
fill (111,113,134);
quad(-1, 552, 112, 473, 390, 599, -1,800);

smooth ();
strokeWeight(1);
stroke (100, 54, 58);
fill (165,148,158);
quad(185, 473, 184, 406, 482, 546, 481, 612);

/* quad() situado en la parte inferior izquierda, marron*/
noStroke ();
fill (92,52,50);
quad (0, 428, 42, 462, 0,495, -40,460);

