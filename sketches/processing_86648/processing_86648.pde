
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
translate(170, 70);
fill(50, 50, 50, 50);
triangle(40, 150, 80, 120, 80, 30); // Noir

fill(100, 100, 100, 50);
triangle(80, 30, 120, 150, 80, 120); // Gris

fill(200, 200, 200, 50);
triangle(80, 30, 120, 150, 130, 100); // Côté droit
triangle(80, 30, 40, 150, 30, 100); // Côté gauche
popMatrix();

 
popMatrix();
 
}
}
