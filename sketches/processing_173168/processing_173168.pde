
void setup()
{
size(500, 500);
background(255);
colorMode(HSB, 360, 100, 100);
smooth();
}

void draw()
{
if (mouseX >= 220 && mouseX <= 280 && mouseY >= 220 && mouseY <= 280)
{
if (mousePressed == true)

{
background (0, 100, 0);
fill(0, 0, 100);
noStroke();
translate(width/2, height/2);
ellipse(-31, 0, 98, 98);
ellipse(+31, 0, 98, 98);
triangle(-62, +38, +62, +38, 0, 100);
}
}

else
{
background(320, 47, 100);
fill(329, 100, 100);

noStroke();
translate(width/2, height/2);
ellipse(-31, 0, 98, 98);
ellipse(+31, 0, 98, 98);
triangle(-62, +38, +62, +38, 0, 100);
}}
