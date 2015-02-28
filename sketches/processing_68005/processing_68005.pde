
// Armando Rocha

void setup()
{
size(500,500);
}
void draw()
{
  background(230);
smooth();
noFill();
stroke(0,0,255);
strokeWeight(10);
ellipse(50,50,70,70);
stroke(0,0,0);


ellipse(120,50,70,70);
stroke(255,0,0);
// aro rojo
ellipse(mouseX,mouseY,70,70);
stroke(255,255,0);

ellipse(80,100,70,70);
stroke(0,255,0);
ellipse(150,100,70,70);
}
