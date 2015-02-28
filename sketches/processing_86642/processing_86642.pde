
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
rotate(radians(-90));
translate(150, 150);
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 0);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Motif Double

translate(-50, -50);
 
rotate(radians(30));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 0);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Motif Triple

 
rotate(radians(60));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Motif Quadruple

 
rotate(radians(30));
 
translate(60, 20);
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu

 
//Rotation

translate(110, -50);
 
rotate(radians(90));
 
fill(255, 184, 3, 50);
triangle(40, 150, 80, 120, 80, 30); // Orange
 
fill(251, 255, 52, 50);
triangle(80, 30, 120, 150, 80, 120); // Jaune
 
// Extensions - droit
fill(52, 255, 90, 50);
triangle(80, 30, 120, 150, 130, 100); // Vert
fill(255, 3, 243, 50);
triangle(80, 30, 130, 100, 180, 100); // Violet
 
// Extensions - gauche
fill(255, 62, 52, 50);
triangle(80, 30, 40, 150, 30, 100); // Rouge
fill(52, 255, 253, 50);
triangle(80, 30, 30, 100, -20, 100); // Bleu



 
popMatrix();
 
}
}
