
public final static int minIndex = 1;
public final static int maxIndex = 61;
/* SMOOTH PALETE 2D */
class SmootherPalete1D
{
    color[] img,next;
    float t,tc;
    boolean change;
    float stepChange;
    int pos,nextPos;
    int width;
    int index,nextIndex;
    Smoother step;
    
    SmootherPalete1D(int frameChange)
    {
      tc=0;
        index=(int)random(minIndex,maxIndex);
        nextIndex=index;
        while(nextIndex==index)
        {
            nextIndex=(int)random(minIndex,maxIndex);
        }
        t=0;
        step=new Smoother(0.99);
        step.setTarget(1.0/pow(2,random(0,7)));
        stepChange=1.0/(float)frameChange;
        change=false;
        //copy data
        PImage imgTemp = loadImage("1d/"+str(index)+"h.png");
        PImage nextTemp = loadImage("1d/"+str(nextIndex)+"h.png");
        this.width=imgTemp.width*imgTemp.height;
        img= new color[width];
        next= new color[width];

        for(int x=0; x < imgTemp.width; x++)
            for(int y=0; y < imgTemp.height; y++)
            {
                img[y*imgTemp.width+x]=imgTemp.get(x,y);
            }
        for(int x=0; x < imgTemp.width; x++)
            for(int y=0; y < imgTemp.height; y++)
            {
                next[y*imgTemp.width+x]=nextTemp.get(x,y);
            }
      pos=(int)random(width);
      nextPos=(pos+1)%width;
    }

    color next()
    {
      tc+=step.getValue();
        //incrementar contadores
        if(tc>=1){
          tc=0;
        pos++;
        nextPos++;
        if(pos == width)
        {
            pos=0;
        }
        if(nextPos == width)
        {
           nextPos=0;
        }
        }
        
        if(change)
        {
            return lerpColor(lerpColor(img[pos],img[nextPos],tc),lerpColor(next[pos],next[nextPos],tc),t);
        }
        else
        {
            return lerpColor(img[pos],img[nextPos],tc);
        }
    }

    void update()
    {
      step.tick();
        if(change)
        {
            t+=stepChange;
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
                PImage nextTemp = loadImage("1d/"+str(nextIndex)+"h.png");
                for(int x=0; x < width; x++)
                    {
                        img[x]=next[x];
                    }
                for(int x=0; x < nextTemp.width; x++)
                    for(int y=0; y < nextTemp.height; y++)
                    {
                        next[x+y*nextTemp.width]=nextTemp.get(x,y);
                    }
            }
        }
    }

    void changePalete()
    {
        if(!change)
        {
            change=true;
                    step.setTarget(1.0/pow(2,random(0,7)) );
        }
    }

   
}


