
int y;

void setup()
{
    size ( 400, 400);
    background( 255);
    noCursor();
    ellipseMode( CENTER);
}
void draw()
{
    fill( mouseX*255/400, 0, mouseY*255/400);
    rect( 0, 0, 400, 400);
    y = 0;
    noFill();
    while( y <= 1200)
    {
        stroke( 255, y);
     
        ellipse( 400, 400, y, y);
        ellipse( 0, 0, y, y);
        ellipse( 400, 0, y, y);
        ellipse( 0, 400, y, y);  
        ellipse( mouseX, mouseY, y, y);
        y = y + 10;
    }
}
