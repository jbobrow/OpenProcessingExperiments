
int numBombolles = 30;
Bombolla[] b;
 
void setup()
{
    size(800, 600);
    b = new Bombolla[numBombolles];
    for (int i = 0; i < numBombolles; i++) {
        b[i] = new Bombolla();
    }
}
 
void draw()
{
    

    numBombolles=129;
    background(255-mouseY,0,mouseY);
    smooth();
    for (int i = 0; i < b.length; i++) {
        b[i].update();
        b[i].render();
        if ( b[i].y < 0) {
            b[i].reset();
        }
    }
}
         
class Bombolla
{
    float x, y;
    float   speed;
    float   tam;
     
    Bombolla()
    {
        
        x=mouseX;
        y=mouseY;
        speed = random(0.5, 2);
        tam = random( 5, 10 );
    }
     
    void update()
    {
        y -= speed;
        x += random(-10,10);
    }
     
    void render()
    {
        stroke(59, 173, 224);
        fill(random(0,255), random(0,255), random(0,255), random(0,255));
        for (int i = 1; i < 3; i++) {
            ellipse( x, y, i * tam * 2, i * tam * 2 );
        }
    }
     
    void reset()
    {
        x = mouseX;
        y = mouseY;
        speed = random(0.5, 2);
        tam = random( 5, 10 );
    }
     
}


