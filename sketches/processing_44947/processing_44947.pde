
float t=0;
ArrayList wiggles;
int n=7;
PImage glow;
PGraphics pg;

void setup()
{
    size(600,600);
    background(0);
    colorMode(HSB);
    wiggles=new ArrayList(n);
    for(int i=0; i < n; i++)
    {
        wiggles.add(new Wiggle(40,0,100*i,width,40));
    }
    pg = createGraphics(width,height, P2D);
}

void draw()
{
    background(0);
//dibujo lineas
    pg.beginDraw();
    for(int i=0; i < n; i++)
    {
        Wiggle w= (Wiggle)wiggles.get(i);
        w.update();
        w.draw();
    }
    pg.endDraw();
//creo una imagen que dara un pequeño efecto sobre el background
    glow=pg.get(0,0,width,height);
    glow.resize(0,width/4);
    glow.filter(INVERT);
    glow.filter(BLUR,2);
    glow.resize(0,width);
//dibujo ambas lineas
    image(glow,0,0);
    image(pg,0,0);
}



