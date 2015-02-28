
class Particle
{
    float x;
    float y;
    float a;
    float s;
    float r;
    float g;
    float b;
    float glowR;
    float glowG;
    float glowB;
    float glowA;
    float glowS;
    float[] previousX = new float[100];
    float[] previousY = new float[100];
    int tails;
    
    Particle(float x, float y, float a, float s, float r, float g, float b)
    {
        this.x = x;
        this.y = y;
        this.a = a;
        this.s = s;
        this.r = r;
        this.g = g;
        this.b = b;
        glowR = random(200)+55;
        glowG = random(200)+55;
        glowB = random(200)+55;
        glowA = 0;
        glowS = 6;
        tails = 100;
    }
    
    void display()
    {
        
        fill(glowR,glowG,glowB,glowA);
        ellipse(x,y,glowS,glowS);
        fill(r,g,b);
        ellipse(x,y,6,6);
        
        stroke(255,255,255);
        if (tails == 100)
        {
            line(x,y,previousX[0],previousY[0]);
            for (int i = 1; i < 99; i++)
            {
                line(previousX[i],previousY[i],previousX[i+1],previousY[i+1]);
            }
        }
        for (int i = 99; i > 0; i--)
        {
            previousX[i] = previousX[i-1];
        }
        previousX[0] = x;
        previousY[0] = y;
        tails++;
        if (tails > 100)
        {
            tails = 100;
        }
        noStroke();
    }
    
    void update(float rx, float ry, float rs,
                float ox1, float oy1, float os1,
                float ox2, float oy2, float os2,
                float ox3, float oy3, float os3)
    {
        x += s*cos(a);
        y += s*sin(a);
        
        if (x > WIDTH || x < 0 || y > HEIGHT || y < 0)
        {
            x = random(WIDTH);
            y = random(HEIGHT);
            r = random(200)+55;
            g = 0;
            b = 0;
            glowR = random(200)+55;
            glowG = random(200)+55;
            glowB = random(200)+55;
            glowA = 0;
            glowS = 6;
            tails = 0;
        }
        
        if (x > rx-rs && x < rx+rs && y > ry-rs && y < ry+rs)
        {
            a += PI/30;
            g += 0.1;
            b += 1;
            glowA += 0.5;
            glowS += 0.05;
        }
        
        if (x > ox1-os1 && x < ox1+os1 && y > oy1-os1 && y < oy1+os1)
        {
            a += PI/30;
            g += 0.1;
            b += 1;
            glowA += 0.5;
            glowS += 0.05;
        }
        
        if (x > ox2-os2 && x < ox2+os2 && y > oy2-os2 && y < oy2+os2)
        {
            a += PI/30;
            g += 0.1;
            b += 1;
            glowA += 0.5;
            glowS += 0.05;
        }
        
        if (x > ox3-os3 && x < ox3+os3 && y > oy3-os3 && y < oy3+os3)
        {
            a += PI/30;
            g += 0.1;
            b += 1;
            glowA += 0.5;
            glowS += 0.05;
        }
    }
    
    void changeColor(float r, float g, float b)
    {
        this.r = r;
        this.g = g;
        this.b = b;
    }
}

