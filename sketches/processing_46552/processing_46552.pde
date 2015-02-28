

List<Wiggle> w;
int n=50;

void setup()
{
    size(600,600);
    w=new Vector();
    for(int i=0; i < n; i++)
    {
        Wiggle wig=new Wiggle(50,map(i,0,n,50,height-50),width-100,height/2,150);
        wig.gaussParam(0,0.75);
        w.add(wig );
    }
    smooth();
    background(0);
}

void draw()
{
    background(0);
    pushMatrix();


for(Wiggle wig:w)
    {
        wig.update();
        wig.draw();
    }

    popMatrix();
    for(int i=0; i < 3;i++){
  int index=(int)random(0,n);
  ((Wiggle)w.get(index)).addGauss(random(0.5,1.3));
    }
}


