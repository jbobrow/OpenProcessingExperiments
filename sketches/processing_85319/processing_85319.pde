
size(500, 500);
background(255);
noStroke();

//1
translate(50, 0);
fill(50, 50, 50, 127);
triangle(40, 150, 80, 120, 80, 30); // Noir

fill(100, 100, 100, 127);
triangle(80, 30, 120, 150, 80, 120); // Gris

// Extensions - droit
fill(200, 200, 200, 127);
triangle(80, 30, 120, 150, 130, 100); 
fill(50, 50, 50, 127);
triangle(80, 30, 130, 100, 180, 100);

// Extensions - gauche
fill(200, 200, 200, 127);
triangle(80, 30, 40, 150, 30, 100);
fill(100, 100, 100, 127);
triangle(80, 30, 30, 100, -20, 100);

//2
pushMatrix();
translate(230, 0);

fill(255, 184, 3, 127);
triangle(40, 150, 80, 120, 80, 30); // Orange

fill(251, 255, 52, 127);
triangle(80, 30, 120, 150, 80, 120); // Jaune

// Extensions - droit
fill(52, 255, 90, 127);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 127);
triangle(80, 30, 130, 100, 180, 100); // Violet

// Extensions - gauche
fill(255, 62, 52, 127);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 127);
triangle(80, 30, 30, 100, -20, 100); // Bleu
pushMatrix();

//3
pushMatrix();
translate(-230, 200);

fill(255, 184, 3, 100);
triangle(40, 150, 80, 120, 80, 30); // Orange

fill(251, 255, 52, 100);
triangle(80, 30, 120, 150, 80, 120); // Jaune

// Extensions - droit
fill(52, 255, 90, 100);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 100);
triangle(80, 30, 130, 100, 180, 100); // Violet

// Extensions - gauche
fill(255, 62, 52, 100);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 100);
triangle(80, 30, 30, 100, -20, 100); // Bleu
popMatrix();

//Répétition
pushMatrix();
translate(-200, 180);

fill(255, 184, 3, 100);
triangle(40, 150, 80, 120, 80, 30); // Orange

fill(251, 255, 52, 100);
triangle(80, 30, 120, 150, 80, 120); // Jaune

// Extensions - droit
fill(52, 255, 90, 100);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 100);
triangle(80, 30, 130, 100, 180, 100); // Violet

// Extensions - gauche
fill(255, 62, 52, 100);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 100);
triangle(80, 30, 30, 100, -20, 100); // Bleu
popMatrix();

//4
pushMatrix();
translate(-40, 300);

fill(255, 184, 3, 200);
triangle(40, 150, 80, 120, 80, 30); // Orange

fill(251, 255, 52, 200);
triangle(80, 30, 120, 150, 80, 120); // Jaune

// Extensions - droit
fill(52, 255, 90, 200);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 200);
triangle(80, 30, 130, 100, 180, 100); // Violet

// Extensions - gauche
fill(255, 62, 52, 200);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 200);
triangle(80, 30, 30, 100, -20, 100); // Bleu
popMatrix();

//Répétition
pushMatrix();
translate(-10, 300);

fill(255, 184, 3, 100);
triangle(40, 150, 80, 120, 80, 30); // Orange

fill(251, 255, 52, 100);
triangle(80, 30, 120, 150, 80, 120); // Jaune

// Extensions - droit
fill(52, 255, 90, 100);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 100);
triangle(80, 30, 130, 100, 180, 100); // Violet

// Extensions - gauche
fill(255, 62, 52, 100);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 100);
triangle(80, 30, 30, 100, -20, 100); // Bleu
popMatrix();
