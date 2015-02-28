
PGraphics pg;
PImage img;
int rad=2;
float t=0;

void setup()
{
    size(512,512);
    reset();
}


void draw()
{
    t+=0.00004;
    if(t > 1)t=0;
    int rSize=(int)pow(rad*2+1,2);
    int[] rIndex=randomIndex(rad,rSize);
    color swap;
    int ssize=(int)((pg.width*pg.height)*log(1+t));
    int maxX=pg.width-rad;
    int maxY=pg.height-rad;
    int x=(int)random(1,pg.width-1),y=0,loc1=0,loc2=0;

    pg.loadPixels();
    for(int i=0; i < ssize; i++)
    {
        x=(int)random(rad,maxX);
        y=(int)random(rad,maxY);
        loc2=x+y*pg.width;
        loc1=loc2+rIndex[(int)random(rSize)];
        swap=pg.pixels[loc2];
        pg.pixels[loc2]=pg.pixels[loc1];
        pg.pixels[loc1]=swap;
    }
    pg.updatePixels();
    image(pg,0,0,width,height);

}

int[] randomIndex(int rad,int rSize)
{
    int[] rIndex=new int[rSize];
    int row=rad*2+1;
    for(int y=0; y < row; y++)
    {
        for(int x=0; x < row; x++)
        {
            rIndex[x+y*row]=pg.width*(y-rad)+(x-rad);
        }
    }

    return rIndex;
}

void reset()
{
    img=loadImage((int)random(1,11)+".jpg");
    pg = createGraphics(img.width,img.height,P2D);


    int ssize=pg.width*pg.height;
    pg.loadPixels();

    for(int y=0; y < img.height; y++)
        for(int x=0; x < img.width; x++)
        {
            pg.pixels[x+y*img.width]=img.get(x,y);
        }
    pg.updatePixels();
}

void keyPressed()
{
    reset();
    t=0;
}


