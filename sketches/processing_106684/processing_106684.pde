
int w=1, h=1, r=0, g=0, b=0;


void setup()
{
    size(480,270);
    println("Hello World");
}

void draw()
{
    fill(r, g, b);
    ellipse(mouseX, mouseY, w, h);
    w++;
    h++;
    r++;
    g++;
    b++;
}
