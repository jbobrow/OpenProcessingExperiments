
PShape square;
void setup() 
{
    setSize(100, 100, P2D);
    square = createShape(RECT, 0, 0, 10, 10);
    square.fill(255, 155, 55);
    square.setStroke(false);
}

void draw() 
{
    shape(square, 25, 25);
}
