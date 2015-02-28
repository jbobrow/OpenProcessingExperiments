
size (720, 480);
smooth ();
strokeWeight (2);
background (204);
ellipseMode (RADIUS);

//cuello
stroke (102); //setear stroke a gris
line (266, 257, 266, 162); //izquierda
line (276, 257, 276, 162); //medio
line (286, 257, 286, 162); //derecha

//antena
line (276, 155, 246, 112); //pequeño
line (276, 155, 306, 56); //alto
line (276, 155, 342, 170); //mediano

//cuerpo
noStroke (); //desabilito stroke
fill (102); //seteo relleno a gris
ellipse (264, 377, 33, 33); //orbita anti gravedad
fill (0); //seteo relleno a negro
rect (219, 257, 90, 120); //cuerpo principal
fill (102); //relleno a gris
rect (219, 274, 90, 6); //franja gris

//cabeza
fill (0); 
ellipse (276, 155, 45, 45);
fill (255);
ellipse (288, 150, 14, 14); //ojo grande
fill (0); //setea relleno a negro
ellipse (288, 150, 3, 3); //pupila
fill (153); //setea relleno a gris claro
ellipse (263, 148, 5, 5); //ojo pequeño 1 
ellipse (296, 130, 4, 4); //ojo pequeño 2
ellipse (305, 162, 3, 3); //ojo pequeño 3




