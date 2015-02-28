
size(720,480);
smooth();
strokeWeight(2);
background(255);
ellipseMode(RADIUS);

//NEACK
stroke(102);//setea ruesor a gris
line(266,257,266,162);//izquierdo
line(276,257,276,162);//mitad
line(286,257,286,162);//derecho

//antena
line(276,155,246,112);//pequeño
line(276,155,306,56);//alto
line(276,155,342,170);//medio

//cuerpo
noStroke();//inavilita gruesor
fill(102);//relleno a gris
ellipse(264,377,33,33);//orvita
fill(0); //relleno a negro
rect(219,257,90,120);//cuerpo robot
fill(102);//relleno a gris
rect(219,274,90,6);//franja gris

//cabeza
fill(0);//negro
ellipse(276,155,45,45);//cabeza
fill(255);//relleno a blanco
ellipse(288,150,14,14);//tamaño ojo
fill(0);//relleno a negro
ellipse(288,150,3,3);//pupila
fill(153);//gris claro
ellipse(263,148,5,5);
ellipse(296,130,4,4);
ellipse(305,162,3,3);

//cabeza
fill(0);//negro
ellipse(186,155,45,45);
fill(255);
ellipse(178,150,13,13);
fill(15,14,15);
ellipse(178,150,2,2);
fill(153);
ellipse(183,125,4,4);
fill(153);
ellipse(200,140,6,6);
fill(153);
ellipse(160,160,3,3);

//cuello
stroke(102);
line(160,118,80,62);
line(230,257,200,197);
line(236,256,200,195);

//manos
noStroke();
fill(102);//relleno a gris
rect(310,274,90,20);//franja gris
rect(128,274,90,20);

