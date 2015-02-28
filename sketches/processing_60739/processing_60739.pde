
class Fish
{
    float[] x;
    float[] y;
    int s;
    
    Fish(float x, float y, int s, float speed, float angle)
    {
        this.x = new float[2000];
        this.y = new float[2000];
        for (int i = 0; i < s; i++)
        {
            this.x[i] = x;
            this.y[i] = y;
        }
        this.s = s;
    }
    
    void display(float mx, float my)
    {
        fill(240);
        noStroke();
        for (int i = 0; i < s-1; i++)
        {
            float dx = x[i+1] - x[i];
            float dy = y[i+1] - y[i];
            
            if ((x[i] + (dx/20) < x[i+1]-s && dx > 0) || (x[i] + (dx/20) > x[i+1]+s && dx < 0))
            {
                x[i] += dx/30;
            }
            if ((y[i] + (dy/20) < y[i+1]-s && dy > 0) || (y[i] + (dy/20) > y[i+1]+s && dy < 0))
            {
                y[i] += dy/30;
            }
            
            ellipse(x[i],y[i],s,s);
        }
        
        float mdx = mx - x[s-1];
        float mdy = my - y[s-1];
        
        x[s-1] += mdx/20;
        y[s-1] += mdy/20;
        
        fill(160,160,255);
        ellipse(x[s-1],y[s-1],(s*1.2),(s*1.2));
    }
    
    void display()
    {
        fill(240);
        noStroke();
        for (int i = 0; i < s; i++)
        {
            ellipse(x[i],y[i],s,s);
        }
    }
    
    void setSize(int s)
    {
        this.s = s;
        for (int i = s-1; i > 0; i--)
        {
            x[i] = x[i-1];
            y[i] = y[i-1];
        }
    }
    
    int getSize()
    {
        return s;
    }
    
    float getXAtIndex(int n)
    {
        return x[n];
    }
    
    float getYAtIndex(int n)
    {
        return y[n];
    }
}

