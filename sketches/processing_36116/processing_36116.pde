
size(720,480);
smooth();
strokeWeight(2);
background(232,129,33);
ellipseMode(RADIUS);

//Neck
stroke(245,25,25); //Setea grosor a gris
strokeWeight(5);
line(266,257,266,162); // Izq
line(276,257,276,162); //centro
line(286,257,286,162); // Der
//Antena
line(276,155,246,112);//Pequeño
line(276,155,306,46); //Alto
line(276,155,342,170); //Medio

//Body
noStroke(); 
fill(102);
ellipse(264,377,33,33); //Orbita
fill(0);
rect(219,257,90,120);//Franja Gris
fill(16,146,224);
rect(219,300,90,10);

//Head
fill(0);
ellipse(276,155,45,45);//Head
fill(255);
ellipse(288,300,14,14);//Ojo grande
fill(255);
ellipse(238,300,14,14);//Ojo grande
fill(255);
ellipse(288,350,14,14);//Ojo grande
fill(255);
ellipse(238,350,14,14);//Ojo grande
fill(0);
ellipse(288,150,3,3);//Pupila
fill(153);
ellipse(263,148,5,5);//Ojo pequeño1
ellipse(300,130,4,4);//Ojo pequeño2
ellipse(305,162,3,3);//Ojo pequeño3



