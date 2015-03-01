
/* Soraya I. Pérez Rodríguez
Práctica 1 - Taller de Creación de Videojuegos
Grado en Comunicación Audiovisual
Universidad Pompeu Fabra
Enero 2015 */


/* Precarga de imágenes */
  /* @pjs preload="texturevintage.jpg", "logomonsters2.png"; */
    
    
/* Variables globales */

  // Colores

  color beige = color(223,215,195);
  color black = color(0); 
  color green = color(141,176,32);
  color darkgreen = color(96,120,21);
  color red = color (255,62,62);
  color turquoise = color(71,179,135);
  color white = color(255);


  // Lienzo

  size(500,500);
  background(30);  
  noStroke();

  // Posición centro Mike

  int x = 0;
  int y = 0;


/* Mike Fila 1 Columna 1 */

  // Cuernos
  
  x = 120;
  y = 120;
  
  fill(beige); 
  triangle(x-45,y-40,x-40,y-30,x-30,y-35);
  triangle(x+45,y-40,x+40,y-30,x+30,y-35); 
  
  // Cabeza 

  fill(green);
  ellipse(120,120,100,100); 
  
  // Boca
  
  fill(black); 
  arc(120,135,65,50,0,PI);

  fill(green); 
  arc(120,130,64,49,0,PI);
  
  // Ojo
  
  fill(white);
  ellipse(120,115,55,55);
  
  fill(turquoise);
  ellipse(120,115,30,30);
  
  fill(black);
  ellipse(120,115,16,16);
  
  fill(white);
  ellipse(129,107,6,6);


/* Mike Fila 1 Columna 2 */

 // Cuernos
  
  x = 250;
  y = 120;
  
  fill(beige); 
  triangle(x-45,y-40,x-40,y-30,x-30,y-35);
  triangle(x+45,y-40,x+40,y-30,x+30,y-35);
 
  // Cabeza
  
  fill(green);
  ellipse(250,120,100,100);

  // Boca
  
  fill(black); 
  arc(250,132,55,60,0,PI);

  fill(green); 
  arc(250,117,90,49,0,PI);

  // Ojo
  
  fill(white);
  ellipse(250,107,55,55);
  
  fill(turquoise);
  ellipse(250,107,30,30);
  
  fill(black);
  ellipse(250,107,16,16);
  
  fill(white);
  ellipse(260,100,6,6);


/* Mike Fila 1 Columna 3 */

 // Cuernos
  
  x = 380;
  y = 120;
  
  fill(beige); 
  triangle(x-45,y-40,x-40,y-30,x-30,y-35);
  triangle(x+45,y-40,x+40,y-30,x+30,y-35);

  // Cabeza

  fill(green);
  ellipse(380,120,100,100);

 // Boca
  
  fill(black);
  ellipse(380,155,19,20);

  // Ojo
  
  fill(white);
  ellipse(380,107,55,55);
  
  fill(turquoise);
  ellipse(380,107,30,30);
  
  fill(black);
  ellipse(380,107,16,16);
  
  fill(white);
  ellipse(390,100,6,6);


/* Mike Fila 2 Columna 1 */

  // Cuernos
  
  x = 120;
  y = 250;
  
  fill(beige); 
  triangle(x-45,y-40,x-40,y-30,x-30,y-35);
  triangle(x+45,y-40,x+40,y-30,x+30,y-35);

  // Cabeza

  fill(green);
  ellipse(120,250,100,100);

  // Boca
  
  fill(black);
  arc(120,291,25,20,PI,TWO_PI);
  
  fill(green);
  arc(120,294,25,20,PI,TWO_PI);
  
  // Ojo
  
  fill(white);
  ellipse(120,245,55,55);
  
  fill(turquoise);
  ellipse(120,245,30,30);
  
  fill(black);
  ellipse(120,245,16,16);
  
  fill(white);
  ellipse(131,241,6,6);

  //Párpado
  
  beginShape();
    fill(darkgreen);
    noStroke();
    vertex(92,245);
    bezierVertex(110,235,130,235,148,245);
    bezierVertex(145,208,95,208,92,245);
  endShape();
   

/* Mike Fila 2 Columna 2 */

 // Cuernos
  
  x = 250;
  y = 250;
  
  fill(beige); 
  triangle(x-45,y-40,x-40,y-30,x-30,y-35);
  triangle(x+45,y-40,x+40,y-30,x+30,y-35);

  // Cabeza

  fill(green);
  ellipse(250,250,100,100);

  // Boca
  
  stroke(black);
  strokeWeight(4); 
  strokeCap(ROUND);
  line(230,283,270,283);
  noStroke();
 
  // Ojo
  
  fill(white);
  ellipse(250,245,55,55);
  
  fill(turquoise);
  ellipse(250,245,30,30);
  
  fill(black);
  ellipse(250,245,16,16);
  
  fill(white);
  ellipse(259,237,6,6);


/* Mike Fila 2 Columna 3 */

  // Cuernos
  
  x = 380;
  y = 250;
  
  fill(beige); 
  triangle(x-45,y-40,x-40,y-30,x-30,y-35);
  triangle(x+45,y-40,x+40,y-30,x+30,y-35);

  // Cabeza

  fill(green);
  ellipse(380,250,100,100);

  // Boca
  
  fill(black);
  ellipse(380,285,30,10);
  
  // Lengua 
  
  fill(red);
  arc(380,285,21,33,0,PI);
  arc(380,285,21,5,PI,TWO_PI);
  
  stroke(black);
  strokeWeight(1.5);
  line(380,285,380,293);
  noStroke();
   
  // Ojo
  
  fill(white);
  ellipse(380,245,55,55);
  
  fill(turquoise);
  ellipse(380,245,30,30);
  
  fill(black);
  ellipse(380,245,16,16);
  
  fill(white);
  ellipse(389,237,6,6);


/* Elementos extra imagen */

  // Textura

  PImage img;

  tint(255, 60);
  img = loadImage("texturevintage.jpg");
  image(img,0,0);

  // Logo

  noTint();
  img = loadImage("logomonsters2.png");
  image(img,70,354,360,76);

  // Marco
  
  noFill();
  stroke(white);
  strokeWeight(25);
  rect(0,0,500,500);
  
  stroke(black);
  strokeWeight(1);
  rect(0,0,499,499);
  




