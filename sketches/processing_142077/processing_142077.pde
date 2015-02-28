
//EL FONDO SIRVE PARA LA CARA
//EL PERSONAJE ESTÁ HECHO DE MANERA QUE LAS MEDIDAS ESTÁN EN FUNCIÓN DE WIDTH Y HEIGHT,
//PERO SIEMPRE PARA UN TAMAÑO DE LIENZO CUADRANGULAR, PARA CONSERVAR PROPORCIONES.

size (500,500); 
background(247,233,192);

//PANTALON AZUL
fill(34,31,147); 
rect(0,(height/5)*4,width-1,height/5);

//CAMISETA ROJA
fill (157,13,15); 
rect(0,(height/5)*3,width-1,height/5);

//TIRANTE IZQUIERDO
fill(34,31,147); 
stroke(4,31,147); 
rect((width/8)*2,(height/5)*3,width/8,height/5);

//TIRANTE DERECHO
fill(34,31,147); 
stroke(4,31,147); 
rect((width/8)*6,(height/5)*3,-width/8,height/5);

//GORRA ROJA
fill (157,13,15); 
rect (0,0,width-1,height/10);

//SIMULAR EL REDONDEO EXTERIOR
stroke(255); 
strokeWeight (50);
fill(0,0);
rect(0,0,width-1,height-1,width/8);

//OJO DERECHO
  //AZUL
fill(137,255,252);
stroke(137,255,252);
strokeWeight(1);
ellipse(width/3,height/4,width/6,width/6);

  //NEGRO
fill(0);
stroke(0);
strokeWeight(1);
ellipse(width/3,height/4,width/8,width/8);

//OJO IZQUIERDO
  //AZUL
fill(137,255,252);
stroke(137,255,252);
strokeWeight(1);
ellipse((width/3)*2,height/4,width/6,width/6);

  //NEGRO
fill(0);
stroke(0);
strokeWeight(1);
ellipse((width/3)*2,height/4,width/8,width/8);


//BOTON IZQUIERDO AMARILLO
fill(252,242,23);
stroke(252,242,23);
ellipse((width/16)*5,(height/6)*5,width/12,width/12);

//BOTON DERECHO AMARILLO
fill(252,242,23);
stroke(252,242,23);
ellipse((width/16)*11,(height/6)*5,width/12,width/12);

//BIGOTE
fill(0);
stroke(0);
arc(width/2,(height/7)*3,width/2,height/3,0,PI);



//NARIZ
fill (250,223,169);
stroke (2250,223,169);
strokeWeight(5);
ellipse(width/2,(height/8)*3,width/4,width/4);





