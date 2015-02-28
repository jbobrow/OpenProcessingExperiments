
void setup()
{
// taille
size(700,700);
background(255);
}
 
void draw()
{
 
// Toujours centrer
// translate(width/2, height/2);
 
if (mousePressed) {
// option de tourner sur soi meme la forme
 
pushMatrix();
noStroke();

translate(mouseX,mouseY);
rotate(3);
pushMatrix();
translate(130, 150);
fill(255, 184, 3, 50);
quad(20, 130, 80, 120, 120, 60, 80, 30); // Orange 1
 
fill(52, 255, 90, 50);
triangle(80, 30, 140, 130, 80, 120); // Vert
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 140, 130, 160, 70); // Vert
fill(255, 3, 243, 50);
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
fill(255, 184, 3, 50);
triangle(80, 30, 20, 130, 0, 70); // Orange
fill(52, 255, 253, 50);
triangle(80, 30, 0, 70, -30, 20); // Bleu
fill(52, 255, 253, 50);
triangle(80, 30, -30, 20, 10, -30); // Bleu
 
fill(255, 62, 52, 50);
quad(80, 30, 10, -30, 20, -70, 100, -70); // Rouge
 
fill(251, 255, 52, 50);
quad(80, 30, 100, -70, 170, -50, 190, 20); // Jaune
popMatrix();
 
//Répétition
pushMatrix();
translate(110, 130);
fill(255, 184, 3, 50);
quad(20, 130, 80, 120, 120, 60, 80, 30); // Orange 1
 
fill(52, 255, 90, 50);
triangle(80, 30, 140, 130, 80, 120); // Vert
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 140, 130, 160, 70); // Vert
fill(255, 3, 243, 50);
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
fill(255, 184, 3, 50);
triangle(80, 30, 20, 130, 0, 70); // Orange
fill(52, 255, 253, 50);
triangle(80, 30, 0, 70, -30, 20); // Bleu
fill(52, 255, 253, 50);
triangle(80, 30, -30, 20, 10, -30); // Bleu
 
fill(255, 62, 52, 50);
quad(80, 30, 10, -30, 20, -70, 100, -70); // Rouge
 
fill(251, 255, 52, 50);
quad(80, 30, 100, -70, 170, -50, 190, 20); // Jaune
popMatrix();
 
//Répétition
pushMatrix();
translate(150, 170);
fill(255, 184, 3, 50);
quad(20, 130, 80, 120, 120, 60, 80, 30); // Orange 1
 
fill(52, 255, 90, 50);
triangle(80, 30, 140, 130, 80, 120); // Vert
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 140, 130, 160, 70); // Vert
fill(255, 3, 243, 50);
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
fill(255, 184, 3, 50);
triangle(80, 30, 20, 130, 0, 70); // Orange
fill(52, 255, 253, 50);
triangle(80, 30, 0, 70, -30, 20); // Bleu 1
fill(52, 255, 253, 50);
triangle(80, 30, -30, 20, 10, -30); // Bleu
 
fill(255, 62, 52, 50);
quad(80, 30, 10, -30, 20, -70, 100, -70); // Rouge
fill(251, 255, 52, 50);
quad(80, 30, 100, -70, 170, -50, 190, 20); // Jaune
popMatrix();

 
popMatrix();
 
}
}
