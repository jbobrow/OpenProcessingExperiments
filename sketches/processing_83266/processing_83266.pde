
void setup()
{
size(400, 600);
background(0, 145, 0);
smooth();
textSize(35);
textAlign(CENTER);
fill(0,0,0);
text("Merry\nChristmas!", 200, 100);
}

void draw()
{
stroke(240, 0, 0);
line(0, 0, mouseX, mouseY);
} 

