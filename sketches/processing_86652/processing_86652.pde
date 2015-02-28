
void setup()
{

// taille
size(700,700);
// couleur de fond
background(255);
}
 
void draw()
{
 // local var...
 color black = color(50, 50, 50),
       grey  = color(100, 100, 100);
 int opacity = 50;

 
if (mousePressed) {
// option de tourner sur soi meme la forme
 

noStroke();

translate(mouseX,mouseY);

pushMatrix();


fill(black, opacity);
triangle(0, 150, 40, 120, 40, 30); // Noir
 
fill(grey, opacity);  // Gris
triangle(40, 30, 80, 150, 40, 120);
 
fill(black, opacity); // Noir
triangle(40, 30, 80, 150, 80, 60);
 
fill(grey, opacity);  // Gris

triangle(40, 30, 80, 150, 160, 30); 
 
fill(black, opacity); // Noir
triangle(160, 30, 80, 150, 80, 60);
 
fill(black, opacity); // Noir
triangle(40, 120, 80, 150, 40, 240);

 
popMatrix();
 
}
}
