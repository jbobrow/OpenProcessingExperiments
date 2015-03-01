
class drawbot
{
    float d=0;
    float x, y, t, tc;
    boolean swig = false;
    int stcc = 0;
    float tAngle = 0.01 + random()*0.1; // try 0.
    bool Marker;
    int strkR = 100+random(155);
    int strkG = 100+random(155);
    int strkB = 100+random(155);
     
    public drawbot(bool mrk)
    {
        Marker = mrk;
        x = width /2;
        y = height /2;
        t = 0;
        tc = 100
        d = random(6);
        if(random() > 0.5)
        {
            tAngle = 0-tAngle;
        }
    }
    
    void update()
    {
        float vx = sin(d);
        float vy = cos(d);
        if(Marker) {
            vx *= 2;
            vy *= 2;
        }
        x += vx;
        y += vy;

        if(Marker)
        {
            stroke(strkR, strkG, strkB, 100);
            strokeWeight(3);
        }
        else
        {
            strokeWeight(1);
            stroke(0);
        }
     
        float nx = x+vx;
        float ny = y + vy;

        if(get(nx,ny) != color(255))
        {
            d -= 2; // 1.65;
            stcc ++;
        }
        else
        {
            stcc = 0;
            point(x,y);
        }
        
        float m = tAngle;
        if (swig) d += m;

        t +=0.1;
        tc -=1;

        if(stcc > 2)
        {
             x = random(width);
             y = random(height);
             stcc = 0;
        }

        if(tc<0)
        {
            tc = 30 + random(30);
            swig = !swig;
        }

        if(x < 0 || x > width || y < 0 || y > height)
        {
            x = width /2;
            y = height /2;
            stcc = 0;
        }
    }
}
 
 
var drawbots = [];
void setup()
{
    // setup() runs once
    size(800, 600);
    //smooth();
    background(255);
    frameRate(180);
    strokeWeight(2);

    for(var i = 0; i < 5; i++)
    {
        drawbots.push(new drawbot(true));
    }

}

void draw()
{
    for(var bot : drawbots)
    {
    bot.update();
    }
}

