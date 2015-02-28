
//Nombre: D. Paola Barragán Acevedo,Fecha: 12/02/13,Título: El Fugitivo



size(400, 400);
background(255);

//lineas fondo
noFill();
stroke(230);
bezier(0, 0, 200, 312, 399, 60, 400, 400);
bezier(30, 0, 200, 312, 399, 60, 390, 400);
bezier(60, 0, 200, 312, 399, 60, 380, 400);
bezier(90, 0, 200, 312, 399, 60, 370, 400);
bezier(120, 0, 200, 312, 399, 60, 360, 400);
bezier(150, 0, 200, 312, 399, 60, 350, 400);
bezier(180, 0, 200, 312, 399, 60, 340, 400);
bezier(210, 0, 200, 312, 399, 60, 330, 400);
bezier(240, 0, 200, 312, 399, 60, 320, 400);
bezier(270, 0, 200, 312, 399, 60, 310, 400);
bezier(300, 0, 200, 312, 399, 60, 300, 400);
bezier(330, 0, 200, 312, 399, 60, 290, 400);
bezier(360, 0, 200, 312, 399, 60, 280, 400);
bezier(390, 0, 200, 312, 399, 60, 270, 400);


//cuadrados y círculos
noStroke();

fill(200, 17, 39, 60);
ellipse(200, 200, 397, 397);
fill(160, 17, 39, 34);
ellipse(200, 200, 363, 363);
fill(160, 17, 39, 34);
ellipse(200, 200, 308, 308);
fill(160, 17, 39, 34);
ellipse(200, 200, 271, 271);
fill(255);
rect(70, 42.871, 28, 28);
fill(255);
rect(42, 71, 28, 28);
fill(255);
rect(42, 71, 28, 28);
fill(255);
rect(15, 99, 28, 28);
fill(255);
rect(70, 99, 28, 28);//
fill(255);
rect(345, 280, 28, 28);
fill(255);
rect(318, 307, 28, 28);
fill(255);
rect(290, 334, 28, 28);
fill(255);
rect(290, 280, 28, 28);//

//arcos
fill(0);
arc(40, 350, 50, 50, radians (45), radians (225));
fill(0);
arc(350, 40, 50, 50, radians (225), radians (405));

//triangulo
stroke(240);
line(0, 400, 200, 30);
line(0, 400, 200, 60);
line(0, 400, 200, 90);
line(200, 90, 400, 400);
line(200, 60, 400, 400);
line(200, 30, 400, 400);

//estrella
fill(0);
noStroke();
beginShape();
curveVertex(98.74,87.73);
curveVertex(94.82,95.68);
curveVertex(86.05,96.96);
curveVertex(92.4,103.14);
curveVertex(90.9,111.87);
curveVertex(98.74,107.75);
curveVertex(106.59,111.87);
curveVertex(105.09,103.14);
curveVertex(111.44,96.95);
curveVertex(102.67,95.6);
curveVertex(98.74,87.73);
curveVertex(98.74,87.73);
curveVertex(98.74,87.73);
endShape(CLOSE);

//vector
noStroke();
fill(0);
ellipse(231,128,41,41);

beginShape();
vertex(197.79,137.87);
vertex(154.15,137.87);
vertex(131.21,165.87);
vertex(145.82,178.29);
vertex(162.47,158.7);
vertex(183.17,158.7);
vertex(160.34, 199.9);
vertex(160.34, 234.42);
vertex(120.86, 234.42);
vertex(120.86, 257.25);
vertex(181.14, 257.25);
vertex(181.14, 215.75);
vertex(201.95, 246.09);
vertex(201.95, 294.7);
vertex(224.78, 294.7);
vertex(224.78, 241.93);
vertex(200.83, 209.45);
vertex(214.43, 187.22);
vertex(214.43, 212.6);
vertex(266.39, 212.6);
vertex(266.39, 192.8);
vertex(234.12, 192.8);
vertex(234.12,162.32);
endShape(CLOSE);
