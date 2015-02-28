
int WIDTH = 580;
int HEIGHT = 580;

float x = WIDTH/2;
float y = HEIGHT/2;

void setup()
{
    size (WIDTH,HEIGHT);
}

void draw()
{
    background(0);
    
    float dx = mouseX - x;
    float dy = mouseY - y;
    
    x += dx/30;
    y += dy/30;
    
    ellipse (x,y,20,20);
}
