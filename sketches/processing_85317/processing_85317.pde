
size(500, 500);
background(255);
noStroke();

//1 BAS EN HAUT
pushMatrix();
rotate(radians(-90));
translate(-250, 80);
fill(50, 50, 50, 127);
triangle(40, 150, 80, 120, 80, 30); // Noir

fill(100, 100, 100, 127);
triangle(80, 30, 120, 150, 80, 120); // Gris

fill(50, 50, 50, 127);
triangle(80, 30, 120, 150, 120, 60); // Noir

fill(100, 100, 100, 127);
triangle(80, 30, 120, 60, 200, 30); // Gris
popMatrix();

//2
pushMatrix();
translate (200, 0);
rotate(radians(-90));
translate(-250, 80);
fill(50, 50, 50, 127);
triangle(40, 150, 80, 120, 80, 30); // Noir

fill(100, 100, 100, 127);
triangle(80, 30, 120, 150, 80, 120); // Gris

fill(50, 50, 50, 127);
triangle(80, 30, 120, 150, 120, 60); // Noir

fill(100, 100, 100, 127);
triangle(80, 30, 120, 60, 200, 30); // Gris

fill(50, 50, 50, 50);
triangle(200, 30, 120, 150, 120, 60); //Clair
popMatrix();
