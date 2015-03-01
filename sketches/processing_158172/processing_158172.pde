
class synesthete
{
    float rtim = 0;
    float x, y, xv, yv;
    int colR, colG, colB;
    float rLimit = 0;
    
    boolean isCirc = false;
    
    public synesthete()
    {
        colR = random(255);
        colG = random(255);
        colB = random(255);
        x = random(width);
        y = random(height);
        rLimit = 100 + random(100);
        xv = 0-2 + random(3);
        yv = 0-2 + random(3);
        if(random() > 0.5)
        {
            isCirc = true;
        }
    }
    
    void draw()
    {
        rtim++;
        if(rtim > rLimit)
        {
            rLimit = 100 + random(100);
            xv = 0-2 + random(3);
            yv = 0-2 + random(3);
            x = random(width);
            y = random(height);
            rtim = 0;
        }
        
        x+= xv;
        y+= yv;
        
        fill(colR, colG, colB, rLimit-rtim);
        noStroke();
        float sz = max(0,120+ (0-((rLimit-rtim)/4)));
        
        if(isCirc)
        {
            ellipse(x, y, sz, sz);
        }
        else
        {
            rect(x, y, sz, sz);
        }
    }
}

PImage bg;

var syns = Array();

void setup()
{
    bg = loadImage("http://www.close-up-art.com/wp-content/uploads/2013/08/140sarahmain797web.jpg");
    size(500,700);
    for(var i = 0; i < 7; i++)
    {
        syns.push(new synesthete());
    }
}

void draw()
{
    image(bg,0,0,width,height);
    for(var sy : syns)
    {
        sy.draw();
    }
}
