
PFont miLetra;

void setup()
{
size(500,500);
frameRate (5);
}
void draw()
{

miLetra= createFont("Serif.vlw");
textFont(miLetra);
fill(204,24);
textSize(random(10,90));
rect(0,0,500,500);
fill(0)
text("Brianda",random(500),random(500));
}
