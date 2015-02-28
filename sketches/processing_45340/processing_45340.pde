

class Palete1D
{
    color c[];
    float t,step;
    int size;
    int now,next;
    int currentIndex;

    Palete1D(int frames)
    {
        t=0;
        step=1.0/(float)frames;

        currentIndex=(int)random(1,10);
        PImage img =loadImage(str(currentIndex)+".png");
        size=img.width*img.height;
        now=(int)random(0,size-2);
        next=now+1;
        c=new color[size];
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }

    color next()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            next++;
            t=0.0f;
            if(now==size)now=0;
            if(next==size)next=0;
        }
        return lerpColor(c[now],c[next],t);
    }

    color randomC()
    {
        return c[(int)random(size)];
    }
}


