
size (610, 700);

//canvas
PImage b;
b = loadImage("canvas.jpg");
background(b);

//rectangulo gris izquierdo
fill(225, 250, 245);
noStroke();
rect (20, 0, 125, 700);

//rectangulo gris derecho
fill(225, 250, 245);
noStroke();
rect (550, 0, 60, 700);

//triangulo cafe
fill (113, 14, 25);
triangle(0, 520, 50, 555, 0, 590);

//rectangulo cafe
fill(113, 14, 25);
noStroke();
rect (175, 0, 35, 700);

//rectangulo naranja
fill(255, 132, 0);
noStroke();
rect (210, 0, 90, 700);

//rectangulo cafe angosto
fill(113, 14, 25);
noStroke();
rect (525, 0, 15, 700);

//quad cafe largo abajo
fill(113, 14, 2);
quad(400, 500, 430, 515, 430, 700, 400, 700);

//quad cafe largo arriba
fill(113, 14, 2);
quad(390, 490, 360, 475, 360, 300, 390, 320);

//triangulo azul
fill (104, 148, 178);
stroke (113, 14, 2);
strokeWeight(2);
triangle(-60, 700, 135, 560, 510, 700);

//quad azul
fill (104, 148, 178);
stroke (113, 14, 2);
strokeWeight(1);
quad(250, 495, 250, 570, 610, 710, 610, 625);

//quad cafe corto abajo
fill(113, 14, 2);
quad(410, 300, 410, 260, 435, 240, 435, 280);

//quad cafe corto derecha
fill(113, 14, 2);
quad(450, 250, 450, 210, 475, 190, 475, 230);

//quad cafe corto izquierda
fill(113, 14, 2);
quad(345, 230, 345, 190, 370, 200, 370, 240);

//quad cafe corto arriba
fill(113, 14, 2);
quad(370, 170, 370, 130, 395, 140, 395, 180);


//SALUDOS!




