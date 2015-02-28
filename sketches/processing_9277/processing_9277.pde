
size(500, 400);
background(63,108,163);

//rectangulo amarillo
noStroke();
fill(233,202,59);
rect(25,25,50,10);

//Rendonda grande
fill(60,78,102);
strokeWeight(3);
stroke(0);
ellipse(150,200,150,150);

//Rendonda pequeña
fill(24,50,87);
strokeWeight(1);
stroke(0);
ellipse(150,200,50,50);

//Triangulo invertido grande
noStroke();
fill(0,0,0,200); //(color,color,color,TRANSPARENCIA hasta 255max.
beginShape();
vertex(150,200);
vertex(225,100);
vertex(75,100);
vertex(150,200);
endShape(CLOSE);

//Triangulo opuesto
fill(0,0,0,215);
beginShape();
vertex(150,200);
vertex(200,350);
vertex(100,350);
vertex(150,200);
endShape(CLOSE);

//3 triangulos
fill(0);
beginShape();
vertex(225,325);
vertex(250,325);
vertex(238,275);
vertex(225,325);
endShape(CLOSE);
beginShape();
vertex(220,275);
vertex(255,275);
vertex(238,250);
vertex(220,275);
endShape(CLOSE);
beginShape();
vertex(215,250);
vertex(260,250);
vertex(238,200);
vertex(215,250);
endShape(CLOSE);

//Tringulo invertido naranja
fill(234,90,38);
beginShape();
vertex(300,250);
vertex(450,250);
vertex(375,350);
endShape(CLOSE);

// Triangulo negro encima de triangulo naranja invertido
fill(0);
beginShape();
vertex(420,250);
vertex(440,230);
vertex(400,230);
endShape(CLOSE);

//luna negra
fill(0,0,0,200);
beginShape();
vertex(300, 350);
bezierVertex(300, 275, 450, 275, 450, 350);
bezierVertex(450, 300, 300, 300, 300, 350);
endShape(CLOSE);

// cuernos vela con traslacion de coordenadas+rotacion
pushMatrix();
translate(350,100);
float rad2 = radians(-30);
rotate(rad2); 
fill(97,52,49);
beginShape();
vertex(0, 0);
bezierVertex(0, 50, 100, 50, 100, 0);
bezierVertex(100, 60, 0, 60, 0, 0);
endShape(CLOSE);
popMatrix();

pushMatrix();
translate(360,55);
fill(249,219,53);
beginShape();
vertex(0, 0);
bezierVertex(0, 30, 50, 30, 50, 0);
bezierVertex(50, 40, 0, 40, 0, 0);
endShape(CLOSE);
popMatrix();

//Tringulo naranja vela
fill(205,70,45);
beginShape();
vertex(275,240);
vertex(375,25);
vertex(375,240);
endShape(CLOSE);

// rectangulo bicolor
fill(152,56,42);
rect(375,170,60,30);
fill(0);
beginShape();
vertex(375,200);
vertex(375,170);
vertex(435,200);
endShape(CLOSE);

// rectangulo blanco
fill(255);
rect(375,210,100,8);

//trinagulo peq inferior vela
fill(249,219,53);
beginShape();
vertex(375,240);
vertex(375,225);
vertex(390,225);
endShape(CLOSE);


//rectangulo rojo rotado
fill(255,35,0);
pushMatrix();
translate(300,75);
float rad = radians(25);
rotate(rad); 
rect(0, 0, 35, 35);
popMatrix();


