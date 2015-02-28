
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
rotate(radians(-90));
translate(-250, 80);
fill(50, 50, 50, 50);
triangle(40, 150, 80, 120, 80, 30); // Noir
 
fill(100, 100, 100, 50);
triangle(80, 30, 120, 150, 80, 120); // Gris
 
fill(50, 50, 50, 50);
triangle(80, 30, 120, 150, 120, 60); // Noir
 
fill(100, 100, 100, 50);
triangle(80, 30, 120, 60, 200, 30); // Gris
 
fill(50, 50, 50, 50);
triangle(200, 30, 120, 150, 120, 60); //Clair
 
fill(50, 50, 50, 50);
triangle(80, 120, 120, 150, 80, 240); // Clair
popMatrix();


 
popMatrix();
 
}
}
