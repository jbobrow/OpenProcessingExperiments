
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
rotate(radians(90));
translate(160, 30);
noStroke();
fill(247, 12, 32, 50);
scale(1, 0.5);
triangle(150, 40, 120, 80, 30, 80);

translate(30,10);
noStroke();
fill(12, 226, 247, 50);
triangle(150, 40, 120, 80, 30, 80);

translate(-5, -20);
noStroke();
fill(247, 240, 12, 50);
triangle(150, 40, 120, 80, 30, 80);


 
popMatrix();
 
}
}
