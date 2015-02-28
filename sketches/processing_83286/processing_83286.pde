
void setup()
{
size(400, 600);
background(0, 0, 0);
smooth();
frameRate(5);
}

void draw()
{
rect(180,400,40,100);
fill(0,255,0);
triangle(100,400,300,400,width/2,120);
fill(0,0,0,75);
rect(0,0,width,height);
//nostroke();
stroke(255,255,255);
strokeWeight(5);
//fill(255,0,0);
//ellpise(mouseX, mouseY, mouseX, mouseY);
point (random(width), random(height));
fill(246,132,89);
textSize(30);
text("Merry Christmas", 100,100);
