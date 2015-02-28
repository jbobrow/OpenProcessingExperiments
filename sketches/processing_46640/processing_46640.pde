
public final static int minIndex = 1;
public final static int maxIndex = 61;
/* SMOOTH PALETE 2D */
class SmoothPalete2D
{
    color[][] img,next;
    float t;
    boolean change;
    float step;
    int posX,posY;
    int width,height;
    int index,nextIndex;

    SmoothPalete2D(int frames)
    {
        index=(int)random(minIndex,maxIndex);
        nextIndex=index;
        while(nextIndex==index)
        {
            nextIndex=(int)random(minIndex,maxIndex);
        }
        t=0;
        step=1.0/(float)frames;
        posX=0;
        posY=0;
        change=false;
        //copy data
        PImage imgTemp = loadImage("2d/"+str(index)+"h.png");
        PImage nextTemp = loadImage("2d/"+str(nextIndex)+"h.png");
        this.width=imgTemp.width;
        this.height=imgTemp.height;
        img= new color[width][height];
        next= new color[width][height];

        for(int x=0; x < width; x++)
            for(int y=0; y < height; y++)
            {
                img[x][y]=imgTemp.get(x,y);
            }
        for(int x=0; x < width; x++)
            for(int y=0; y < height; y++)
            {
                next[x][y]=nextTemp.get(x,y);
            }

    }

    color next()
    {
        //incrementar contadores
        posX++;
        if(posX == width)
        {
            posX=0;
            posY++;
            if(posY == height)
            {
                posY=0;
            }
        }

        if(change)
        {
            return lerpColor(img[posX][posY],next[posX][posY],t);
        }
        else
        {
            return img[posX][posY];
        }
    }

    color nextX()
    {
        //incrementar contadores
        posX++;
        if(posX == width)
        {
            posX=0;
            posY++;
            if(posY == height)
            {
                posY=0;
            }
        }

        if(change)
        {
            return lerpColor(img[posX][posY],next[posX][posY],t);
        }
        else
        {
            return img[posX][posY];
        }
    }

    color nextY()
    {
        //incrementar contadores
        posY++;
        if(posY == width)
        {
            posY=0;
            posX++;
            if(posX == height)
            {
                posX=0;
            }
        }

        if(change)
        {
            return lerpColor(img[posX][posY],next[posX][posY],t);
        }
        else
        {
            return img[posX][posY];
        }
    }

    color randomColor()
    {
        int indx=(int)random(0,width);
        int indy=(int)random(0,height);

        if(change)
        {
            return lerpColor(img[indx][indy],next[indx][indy],t);
        }
        else
        {
            return img[indx][indy];
        }
    }

    void update()
    {
        if(change)
        {
            t+=step;
            if(t >= 1)
            {
                change=false;
                t=0.0;
                index=nextIndex;
                while(nextIndex==index)
                {
                    nextIndex=(int)random(minIndex,maxIndex);
                }

                //copiamos nueva paleta
                PImage nextTemp = loadImage("2d/"+str(nextIndex)+"h.png");
                for(int x=0; x < width; x++)
                    for(int y=0; y < height; y++)
                    {
                        img[x][y]=next[x][y];
                    }
                for(int x=0; x < width; x++)
                    for(int y=0; y < height; y++)
                    {
                        next[x][y]=nextTemp.get(x,y);
                    }
            }
        }
    }

    void changePalete()
    {
        if(!change)
        {
            change=true;
        }
    }

    color get(int x,int y)
    {
        if(change)
        {
            return lerpColor(img[posX][posY],next[posX][posY],t);
        }
        else
        {
            return img[posX][posY];
        }
    }
}


