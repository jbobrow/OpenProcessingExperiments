
void setup()
{
 
// taille
size(700,700);
// couleur de fond
background(255);
// pas de contour
noStroke();

}
  
void draw()
{
 // local var...
 color orange = color(255, 184, 3),
       green = color(52, 255, 90),
       violet = color(255, 3, 243),
       blue = color(52, 255, 253),
       red = color(255, 62, 52),
       yellow = color(251, 255, 52),
       rose = color(247, 15, 89);
       
 int opacity = 150;


//1
pushMatrix();
translate(150, 150);

fill(orange, opacity);
quad(20, 130, 80, 120, 120, 60, 80, 30);

fill(green, opacity);
triangle(80, 30, 140, 130, 80, 120);

// Extensions - droit
fill(green, opacity);
triangle(80, 30, 140, 130, 160, 70);

fill(violet, opacity);
beginShape();
vertex(80, 30);
vertex(190, 20);
vertex(160, 70);
vertex(80, 30);
vertex(0, 40);
vertex(20, 90);
vertex(80, 30);
endShape(CLOSE);

// Extensions - gauche
fill(orange, opacity);
triangle(80, 30, 20, 130, 0, 70);

fill(blue, opacity);
triangle(80, 30, 0, 70, -30, 20);

fill(blue, opacity);
triangle(80, 30, -30, 20, 10, -30);

fill(red, opacity);
quad(80, 30, 10, -30, 20, -70, 100, -70);

fill(yellow, opacity);
quad(80, 30, 100, -70, 170, -50, 190, 20);

fill(rose, opacity);
triangle(80, 30, 190, 20, 90, -20);

fill(blue, opacity);
quad(80, 120, 140, 130, 180, 90, 190, 20);
popMatrix();
}
