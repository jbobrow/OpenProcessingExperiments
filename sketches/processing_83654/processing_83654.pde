
void setup()
{
size(600, 400);
background(0, 0, 0);
smooth();
}

void draw()
{
fill(255, 0, 0);

textAlign(CENTER);
textSize(35);
text("Mercedes Benz G65 AMG", 350, 350);

image(loadImage("benz.jpg"),width-frameCount*5,0,400,300);
fill(0);
rect(0,250,width,50);

}

