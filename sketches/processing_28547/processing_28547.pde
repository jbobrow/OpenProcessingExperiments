
float h;
float r = 15;

float minRadius = 10;
float maxRadius = 20;

boolean grow = false;
boolean saveOne = false;

void setup()
{
    size( 450, 400 );
    background(255);
    
    colorMode( HSB, 360, 100, 100, 100 );
    
    h = random(360);
}

void draw()
{
    smooth();
    fill( h, random(100), random(100), 50 );
    stroke( h, random(100), random(100), 70 );
    ellipse(mouseX, mouseY, r * 2, r * 2);
    
    if ( grow ) {
        r++;
        if (r > maxRadius) {
            grow = false;
        } 
    } else {
        r--;
        if (r < minRadius) {
            grow = true;
        }
    }
}
