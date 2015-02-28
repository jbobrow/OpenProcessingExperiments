


FlorEspiral f;

void setup()
{
    size(600,600);
    smooth();
    f=new FlorEspiral(0,0);
    background(255);
}


void draw()
{
    translate(width/2,height/2);
    f.update();
    f.draw();
}


