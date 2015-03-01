
class tracer
{
    float d=0;
    float x, y;
    boolean dead = false;
    int stcc = 0;
    float tAngle = 0;
    int strkR = 0;
    int strkG = 0;
    int strkB = 0;
    drawbot mom;
      
      
    public tracer(drawbot pnt)
    {
        mom = pnt;
        dead = false;
        strkR  = mom.strkR;
        strkG  = mom.strkG;
        strkB  = mom.strkB;
        x = mom.x;
        y = mom.y;
        d = mom.d + PI/2;
        
        float vx = sin(d)*2;
        float vy = cos(d)*2;
        x+=vx;
        y+=vy;
        
    }
     
    void update()
    {
        if(dead)
        {
            dead = false;
            strkR  = mom.strkR;
            strkG  = mom.strkG;
            strkB  = mom.strkB;
            x = mom.x;
            y = mom.y;
            d = mom.d + PI/2;
            float vx = sin(d)*2;
            float vy = cos(d)*2;
            x+=vx;
            y+=vy;
        }
    
        if(x < 0 || x > width || y < 0 || y > height)
        {
            dead = true;
        }
    
        if(strkR >= 255 && strkG >= 255 && strkB >= 255)
        {
            dead =true;
        }
        
        if(dead) return;
    
        float vx = sin(d);
        float vy = cos(d);

        stroke(strkR, strkG, strkB);
        strokeWeight(1);
      
        float nx = x+vx;
        float ny = y+vy;
 
        if(get(nx,ny) != color(255,255,255))
        {
            dead = true;
        }
        else
        {
        
            point(x,y);
        }
        
        if(strkR < 255)
        {
            strkR+=3;
        }
        
        if(strkG < 255)
        {
            strkG+=3;
        }
        
        if(strkB < 255)
        {
            strkB+=3;
        }
        
        x = nx;
        y = ny;
    }
}

class drawbot
{
    float d=0;
    float x, y, t, tc;
    boolean swig = false;
    int stcc = 0;
    float tAngle = 0;
    int strkR = 30+random(155);
    int strkG = 30+random(155);
    int strkB = 30+random(155);
    var tracers = [];
      
    public drawbot(bool mrk)
    {
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
        if(tracers.length < 10)
            tracers.push(new tracer(this));
            
        float vx = sin(d);
        float vy = cos(d);

        x += vx;
        y += vy;
 

        stroke(strkR, strkG, strkB);
        strokeWeight(2);
      
        float nx = x+vx;
        float ny = y + vy;
 
        if(get(nx,ny) != color(255))
        {
            if(random() > 0.4)
            {
              d -= PI/2;
            }
            else
            {
              d+= PI/2;
            }
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
        
        for(var trac : tracers)
        {
           trac.update();
        }
    }
}
  
  
var drawbots = [];
void setup()
{
    // setup() runs once
    size(800,600);
    //smooth();
    background(255);
    frameRate(180);
    strokeWeight(2);
 
    for(var i = 0; i < 3; i++)
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
