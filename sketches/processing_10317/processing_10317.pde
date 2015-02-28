
  /*
EJERCICIO 01 SESION 2
MIRO ESTATICO
  
 Titulo: Miro estatico
 Nombre: Aixa martinez

*/
//fondo
size(600,433);
PImage b;
b = loadImage("fondo.jpg");
background (b);

//suelo gris
stroke(35);
strokeWeight(30);
fill(45);
rect(-30,246,width*2,height*2);
 

//elipse verde
noStroke();
fill(33,97,28);
ellipse (145,42,30,30);

//elipse azul
noStroke();
fill(10,00,205);
ellipse (94,192,20,20);

//elipse gris
noStroke();
fill(51,55,56);
ellipse (518,94,20,20);

//elipse marron
noStroke();
fill(89,66,56);
ellipse (570,170,30,30);

 
//elipse roja
noStroke();
fill(143,54,46);
ellipse (426,149,30,30);

//elipse naranja oscuro difuminado
noStroke();
fill(160,71,28,70);
ellipse (143,388,38,38);
//elipse naranja oscuro
noStroke();
fill(113,50,40);
ellipse (144,386,20,20);


//elipse naranja claro difuminado
noStroke();
fill(160,71,28,70);
ellipse (396,338,53,53);
//elipse naranja claro
noStroke();
fill(170,81,28);
ellipse (399,333,30,30);

//blur
filter(BLUR, 1);

//elipse grande roja
noStroke();
fill(200,60,60);
ellipse (294,106,252,168);

//borde blanco
stroke(255);
strokeWeight(8);
noFill();
rect(0,0,width,height);


