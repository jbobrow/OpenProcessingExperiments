

List<Wiggle> w,g;
int n=10;

void setup()
{
    size(600,600);
    w=new Vector();
    g=new Vector();
    for(int i=0; i < n; i++)
    {
        Wiggle wig=new Wiggle(0,height/2,width,height/2,150);
        wig.gaussParam(map(i,0,n-1,-2,2),0.75+random(-0.1,0.1));
        w.add(wig );
    }

    for(int i=0; i < n; i++)
    {
        Wiggle wig=new Wiggle(0,height/2,width,height/2,150);
        wig.gaussParam(map(i,0,n-1,-2,2),0.75+random(-0.1,0.1));
        wig.c=0;
        g.add(wig );
    }

    fill(0);
    rect(0,0,width,height/2);
    fill(255);
    rect(0,height/2,width,height);
}

void draw()
{

    golpesAleatorios();

    fill(0,50);
    rect(0,0,width,height/2);
for(Wiggle wig:w)
    {
        wig.update();
        wig.draw();
    }
    translate(width,height);
    rotate(PI);
    fill(255,50);
    rect(0,0,width,height/2);
for(Wiggle wig:g)
    {
        wig.update();
        wig.draw();
    }

}

void golpesAleatorios()
{

    if(random(1.0) > 0.8 )
    {
        int index=(int)random(0,n);
        ((Wiggle)w.get(index)).addGauss(1.0);
    }
    if(random(1.0) > 0.8 )
    {
        int index=(int)random(0,n);
        ((Wiggle)g.get(index)).addGauss(1.0);
    }
}


