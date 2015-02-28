
size(729,480);
smooth();
strokeWeight(2);
background(79,252,71);
ellipseMode(RADIUS);

//NECK CUELLO

stroke(102); //setea grosor a gris
line(266,257,266,162); //izquierdo
line(276,257,276,162); //mitad
line(286,257,286,162); //derecho

//Antennae antena

line (276,155,246,112); //pequeño
line (276,155,306,56); //alto
line (276,155,342,170); //medio

//Bodycuerpo

noStroke (); //inhabilita grosor
fill(102); //setea relleno a gris
ellipse (264,377,33,33); //
fill(0); //relleno niga
rect(219,257,90,120);
fill (102);
rect (219,274,90,6);

//Headcabeza

fill(0);
ellipse(276,155,45,45);
fill (255);
ellipse (288,150,14,14);
fill(0);
ellipse (288,150,3,3);
fill(153);
ellipse (263,148,5,5);
ellipse (296,130,4,4);
ellipse (305,162,3,3);

//
                                
