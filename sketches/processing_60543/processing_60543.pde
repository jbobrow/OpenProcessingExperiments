
int i=0;
int lim=200*200;
int propagation=255;
int loss=1;
void setup()
{
    background(255);
    frameRate(12);
    noSmooth();
    size(200,200, P2D);
    loadPixels();
}

void draw()
{
    for(i=0;i<lim;i++)
    {
        int r = int(random(1,propagation));
        pixels[i] = color((((pixels[(i+propagation)%lim]^((~propagation+r)&0xFF))&(pixels[(i&propagation)|loss])^r))& 0xFF,r & propagation,r & 0xEE);
    }
    propagation = (((propagation+loss) & (propagation % loss))|propagation);
    updatePixels();
}

