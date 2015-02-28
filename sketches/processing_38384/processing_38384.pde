
size(400,400);




smooth();
strokeWeight(2);

background(44,85,106);



ellipseMode(RADIUS);//cuello
stroke(102);//zetear stroke a gris
line(266,257,266,162); //izquierda
line(276,257,276,162); //medio
line(286,257,286,162); //derecha//antena
line(276,155,246,112); //pequeño
line(276,155,306,56); //alto
line(276,155,342,170); //mediano//cuerpo
noStroke(); // desabilito stroke
fill (39,159,162); //zeteo a gris
triangle(276,155,306,56,70,60);
ellipse (250,377,33,33); //orbita antigravedad
fill(0); //seteo reyeno a negro
rect(219,257,90,120); //main body
rect(219,230,70,80);
fill(165,78,99); //zeteo relleno a gris
rect(219,274,90,6); //franja gris//head

fill(0); //seta fill a negro
ellipse(276,150,50,60); //head
fill (255); //set a fill a blanco
ellipse (288,150,14,14); //large eye
fill(0);//seta reyeno a negro
ellipse(288,150,3,3);// pupila
fill(153); //seta reyeno a gris claro tres ellipce
ellipse(263,148,5,5); //hojo pequeño 1
ellipse(296,130,4,4); //ojo pequeño 2
ellipse(305,162,3,3); //ojo pequeño 3

