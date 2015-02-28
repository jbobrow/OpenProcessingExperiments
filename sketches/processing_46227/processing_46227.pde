


List<WiggleCircle> w;
int n=(int)random(2,9);

void setup()
{
    size(600,600);
    colorMode(HSB);
    w=new Vector();

    for(int i=0; i < n; i++)
    {
        WiggleCircle wig=new WiggleCircle(width/2.0,height/2.0,0.0,400.0,100);
        w.add(wig);
    }
    background(255);
}

void draw()
{
    golpesAleatorios();
    noStroke();
for(WiggleCircle wig:w)
    {
        wig.update();
        wig.draw();
    }
}

void golpesAleatorios()
{
    if(random(1.0) > 0.9 )
    {
        int index=(int)random(0,n);
        ((WiggleCircle)w.get(index)).addGauss(1.0);
    }

}

