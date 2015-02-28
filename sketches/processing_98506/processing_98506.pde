
void setup()
{
    size(400, 600);
    background(255, 255, 255);
    smooth();
    frameRate(60);

}

void draw()
{
    strokeWeight(3);
    fill( random(255), random(255), random(255) );
    ellipse(mouseX, mouseY,  mouseX/2, mouseY/2 );
}
