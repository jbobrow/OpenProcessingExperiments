
public final static int minIndex = 1;
public final static int maxIndex = 61;
String paletePath= "";
/* DiscretePALETE 1D */

class DiscretePalete1D
{
    color c[];
    float t,step;
    int size;
    int now;
    int currentIndex;

    DiscretePalete1D(int frames)
    {
        t=0;
        step=1.0/(float)frames;

        currentIndex=(int)random(minIndex,maxIndex);
        PImage img =loadImage(paletePath+str(currentIndex)+"h.png");
        size=img.width*img.height;
        now=(int)random(0,size-1);
        c=new color[size];
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }

    void randomPalete()
    {
        currentIndex=(int)random(minIndex,maxIndex);
        PImage img =loadImage(paletePath+str(currentIndex)+"h.png");
        size=img.width*img.height;
        now=(int)random(0,size-1);
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }

    void update()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            t=0.0f;
            if(now==size)now=0;
        }
    }

    color next()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            t=0.0f;
            if(now==size)now=0;
        }
        return c[now];
    }

    color get(int ind)
    {
        ind=(ind+now)%size;
        return c[ind];
    }

    color randomC()
    {
        return c[(int)random(size)];
    }
}


