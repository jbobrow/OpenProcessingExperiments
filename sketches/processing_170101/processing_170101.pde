
//Crear un personatge expresant un sentiment. Podeu dibuixar-vos a vosaltres.

//PI, TWO_PI --> semicircunferencia mitad arriba (PATAS).

// ------------ INICIO CÓDIGO ------------ //


// ------ VENTANA ------
background(255);
size(600, 600);

// ------ ALA IZQUIERDA ------
fill(32, 32, 32);//gris oscuro.
strokeWeight(3);
stroke(0);
arc(248, 290, 300, 230, PI, PI+QUARTER_PI);
line(100, 290, 130, 290);

// ------ ALA DERECHA ------
arc(460, 290, 160, 180, PI, TWO_PI);
line(510, 290, 540, 290);

// ------ REFLEJO ALA IZQUIERDA ------
noStroke();
fill(255, 255, 255, 30);//30 = opacidad.
arc(238, 280, 280, 210, PI, PI+QUARTER_PI);

// ------ REFLEJO ALA DERECHA ------
arc(490, 280, 100, 135, PI, TWO_PI);

// ------ CUERPO ------
strokeWeight(3);
stroke(0);
fill(32, 32, 32);
ellipse(320, 280, 380, 420);//x, y, anchura x, altura y.

// ------ OJO DERECHO ------
noFill();
strokeWeight(8);
stroke(132, 129, 122);
arc(320, 140, 275, 30, 0, PI);//PARCHE del ojo
fill(0);
strokeWeight(5);
ellipse(400, 170, 90, 105);

// ------ OJO IZQUIERDO ------
fill(255);
noStroke();
arc(260, 170, 90, 90, 0, PI+QUARTER_PI); //LÍNIA QUE FALLA AL PONER "CHORD" U "OPEN".
triangle(229, 138, 305, 170, 230, 170);
fill(0);
ellipse(270, 180, 45, 45);
strokeWeight(10);
stroke(0);
line(230, 120, 310, 170);


// ------ BARRIGA ------
fill(255);//blanco
noStroke();
ellipse(325, 350, 280, 260);

// ------ EFECTO BARRIGA ------
fill(232, 232, 232, 90);//80 = opacidad.
ellipse(325, 327, 260, 210);

// ------ PICO ------
strokeWeight(2);
stroke(220, 173, 21);
fill(239, 185, 23);
triangle(325, 280, 270, 220, 370, 220);//x1, y1, x2, y2, x3, y3.

// ------ PATA IZQUIERDA ------
noStroke();
fill(220, 173, 21);//amarillo oscuro
arc(230, 500, 160, 140, PI, TWO_PI);//semicircunferencia mitad arriba.

// ------ REFLEJO PATA IZQUIERDA ------
fill(255, 255, 255, 60); //60 = opacidad.
arc(230, 470, 110, 70, PI, TWO_PI);

// ------ PATA DERECHA ------
fill(220, 173, 21);
arc(400, 500, 160, 140, PI, TWO_PI);//semicircunferencia mitad arriba.

// ------ REFLEJO PATA DERECHA ------
fill(255, 255, 255, 60); //60 = opacidad.
arc(400, 470, 110, 70, PI, TWO_PI);


// ------------ FINAL CÓDIGO ------------ //



