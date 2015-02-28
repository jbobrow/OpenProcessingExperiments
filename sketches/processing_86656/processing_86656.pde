
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
translate(-340, 120);
noStroke();
fill(247, 12, 32, 50);
quad(60, 40, 150, 40, 120, 80, 30, 80);


translate(30,10);
fill(12, 226, 247, 50);
quad(60, 40, 150, 40, 120, 80, 30, 80);

translate(-5, -20);
fill(247, 240, 12, 50);
quad(60, 40, 150, 40, 120, 80, 30, 80);



 
popMatrix();
 
}
}
