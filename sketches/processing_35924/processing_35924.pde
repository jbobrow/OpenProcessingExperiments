

size(720,480); 
smooth(); 
strokeWeight(2); 
background(155,17,2); 
ellipseMode(RADIUS); 

//NEACK 
stroke(102);//setea ruesor a gris 
line(266,257,266,162);//izquierdo 
line(276,257,276,162);//mitad 
line(286,257,286,162);//derecho 

//antena 
line(276,155,246,112);//pequeÃ±o 
line(276,155,306,56);//alto 
line(276,155,342,170);//medio 

//cuerpo 
noStroke();//inavilita gruesor 
fill(102);//relleno a gris 
ellipse(264,377,33,33);//orvita 
fill(245,10,10); //relleno a negro 
rect(219,257,90,120);//cuerpo robot 
fill(116,14,2);//relleno a gris 
rect(219,274,90,6);//franja gris 

//cabeza 
fill(245,10,10);//negro 
ellipse(276,155,45,45);//cabeza 
fill(255);//relleno a blanco 
ellipse(288,150,14,14);//tamaÃ±o ojo 
fill(0);//relleno a negro 
ellipse(288,150,3,3);//pupila 
fill(153);//gris claro 
ellipse(263,148,5,5); 
ellipse(296,130,4,4); 
ellipse(305,162,3,3);


                
                
