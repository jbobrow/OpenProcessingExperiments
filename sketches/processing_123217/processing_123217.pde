
int numBurbujas = 100;
Burbuja[] Burbujas;
 
void setup()
{
    size(450, 400);
     
    Burbujas = new Burbuja[numBurbujas];
    for (int i = 0; i < numBurbujas; i++) {
        Burbujas[i] = new Burbuja();
    }
}
 
void draw()
{
    background(#F7C624);
    smooth();
     
    for (int i = 0; i < Burbujas.length; i++) {
        Burbujas[i].update();
        Burbujas[i].render();
        if (Burbujas[i].loc.y < -50) {
           Burbujas[i].reset();
        }
    }
}
         

class Burbuja
{
    PVector loc;
    float   speed;
    float   radius;
     
    Burbuja()
    {
        loc = new PVector( random(width), random(height) );
        speed = random(0.5, 2);
        radius = random( 2, 5 );
    }
     
    void update()
    {
        loc.y -= speed;
    }
     
    void render()
    {
        
        fill(#FFFFFF);
        for (int i = 1; i < 3; i++) {
            ellipse( loc.x, loc.y, i * radius * 2, i * radius * 2 );
        }
    }
     
    void reset()
    {
        loc.x = random(width);
        loc.y = height + 70;
        speed = random(0.5, 3);
        radius = random( 0.5,3 );
    }
     
}



