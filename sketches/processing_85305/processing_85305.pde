
size(500, 500);
background(255);
noStroke();

//1
pushMatrix();
translate(150, 150);
fill(255, 184, 3, 200);
quad(20, 130, 80, 120, 120, 60, 80, 30); // Orange 1

fill(52, 255, 90, 150);
triangle(80, 30, 140, 130, 80, 120); // Vert 1

// Extensions - droit
fill(52, 255, 90, 150);
triangle(80, 30, 140, 130, 160, 70); // Vert 2
fill(255, 3, 243, 150);
beginShape();
vertex(80, 30);
vertex(190, 20);
vertex(160, 70);
vertex(80, 30);
vertex(0, 40);
vertex(20, 90);
vertex(80, 30);
endShape(CLOSE);// Violet

// Extensions - gauche
fill(255, 184, 3, 150);
triangle(80, 30, 20, 130, 0, 70); // Orange 2
fill(52, 255, 253, 150);
triangle(80, 30, 0, 70, -30, 20); // Bleu 1
fill(52, 255, 253, 150);
triangle(80, 30, -30, 20, 10, -30); // Bleu 2

fill(255, 62, 52, 150);
quad(80, 30, 10, -30, 20, -70, 100, -70); // Rouge

fill(251, 255, 52, 150);
quad(80, 30, 100, -70, 170, -50, 190, 20); // Jaune

fill(247, 15, 89, 150);
triangle(80, 30, 190, 20, 90, -20); // Rose

fill(52, 255, 253, 150);
quad(80, 120, 140, 130, 180, 90, 190, 20); // Bleu 3
popMatrix();

//Répétition
pushMatrix();
translate(110, 130);
fill(255, 184, 3, 200);
quad(20, 130, 80, 120, 120, 60, 80, 30); // Orange 1

fill(52, 255, 90, 150);
triangle(80, 30, 140, 130, 80, 120); // Vert 1

// Extensions - droit
fill(52, 255, 90, 150);
triangle(80, 30, 140, 130, 160, 70); // Vert 2
fill(255, 3, 243, 150);
beginShape();
vertex(80, 30);
vertex(190, 20);
vertex(160, 70);
vertex(80, 30);
vertex(0, 40);
vertex(20, 90);
vertex(80, 30);
endShape(CLOSE);// Violet

// Extensions - gauche
fill(255, 184, 3, 150);
triangle(80, 30, 20, 130, 0, 70); // Orange 2
fill(52, 255, 253, 150);
triangle(80, 30, 0, 70, -30, 20); // Bleu 1
fill(52, 255, 253, 150);
triangle(80, 30, -30, 20, 10, -30); // Bleu 2

fill(255, 62, 52, 150);
quad(80, 30, 10, -30, 20, -70, 100, -70); // Rouge

fill(251, 255, 52, 150);
quad(80, 30, 100, -70, 170, -50, 190, 20); // Jaune

fill(247, 15, 89, 150);
triangle(80, 30, 190, 20, 90, -20); // Rose

fill(52, 255, 253, 150);
quad(80, 120, 140, 130, 180, 90, 190, 20); // Bleu 3
popMatrix();

//Répétition
pushMatrix();
rotate(radians(30));
translate(150, 120);
fill(255, 184, 3, 200);
quad(20, 130, 80, 120, 120, 60, 80, 30); // Orange 1

fill(52, 255, 90, 150);
triangle(80, 30, 140, 130, 80, 120); // Vert 1

// Extensions - droit
fill(52, 255, 90, 150);
triangle(80, 30, 140, 130, 160, 70); // Vert 2
fill(255, 3, 243, 150);
beginShape();
vertex(80, 30);
vertex(190, 20);
vertex(160, 70);
vertex(80, 30);
vertex(0, 40);
vertex(20, 90);
vertex(80, 30);
endShape(CLOSE);// Violet

// Extensions - gauche
fill(255, 184, 3, 150);
triangle(80, 30, 20, 130, 0, 70); // Orange 2
fill(52, 255, 253, 150);
triangle(80, 30, 0, 70, -30, 20); // Bleu 1
fill(52, 255, 253, 150);
triangle(80, 30, -30, 20, 10, -30); // Bleu 2

fill(255, 62, 52, 150);
quad(80, 30, 10, -30, 20, -70, 100, -70); // Rouge
fill(251, 255, 52, 150);
quad(80, 30, 100, -70, 170, -50, 190, 20); // Jaune

fill(247, 15, 89, 150);
triangle(80, 30, 190, 20, 90, -20); // Rose

fill(52, 255, 253, 150);
quad(80, 120, 140, 130, 180, 90, 190, 20); // Bleu 3
popMatrix();
