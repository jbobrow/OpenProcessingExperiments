
size(720,480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//cuello
stroke(102);//setea grosor a gris 
line(266,257,266,162);//izquierdo
line(276,257,276,162);//mitad
line(286,257,286,162);//derecho

//antena
line(276,155,246,112);//pequeño
line(276,155,306,56);//alto
line(276,155,342,170);

//cuerpo
noStroke();//inabilita grosor
fill(102);//setea relleno a gris
ellipse(264,377,33,33);//orbita 
fill(0);//setea relleno a negro
rect(219,257,90,120);//cuerpo robot
fill(102);//setea relleno a gris
rect(219,274,90,6);//

//cabeza
fill(0);//setea relleno a negro
ellipse(276,155,45,45);//cabeza
fill(255);//setea relleno a blanco
ellipse(288,150,14,14);//ojo
fill(0);//stea rellenoa negro
ellipse(288,150,3,3);//pupila
fill(153);//stea relleno a gris claro
ellipse(263,148,5,5);//ojo pequeño 1
ellipse(296,130,4,4);
ellipse(305,162,3,3);



