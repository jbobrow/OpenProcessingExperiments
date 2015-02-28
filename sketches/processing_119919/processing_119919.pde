
//Connections
//Another procedural way of painting
//Ale González, 2013
//TODO: hashgrid is not much efficient for this uneven distribution of particles --> implement a quadtree would be better

final int 
  WIDTH   = 800,
  HEIGHT  = 800,
  MAX_AGE = 100,
  STEPS = 900,
  DIST = 40,
  SQD = DIST*DIST;
final float 
  SMOOTHNESS = .005;

ParticleManager particles;

PGraphics bg;


void setup() 
{
    size(WIDTH, HEIGHT, P3D);
    smooth();
    
    //Create a fancy degraded background
    bg = createGraphics(WIDTH, HEIGHT, JAVA2D);
    DegradedBackground.create(bg, 400, 400);
    background(bg);
    
    //Create the particle system
    particles = new ParticleManager(loadImage("j.jpg"));   
}
  

void draw()
{
    if(mousePressed) 
        particles.add(mouseX, mouseY);   
    particles.update();
    particles.draw();
}

void keyPressed()
    { background(bg); }   


static class DegradedBackground 
{
    static void create(PGraphics pg, int X, int Y)
    {
        int x, y, w = pg.width, h = pg.height, s = pg.width*pg.height;
        pg.loadPixels();
        for(int i=0, dx=0, dy=0; i<s; i++, dx=(i/w)-X, dy=(i%w)-Y) 
            pg.pixels[i] = (~(dx*dx+dy*dy)>>12) * 0x010101;
        pg.updatePixels();
    }
}



