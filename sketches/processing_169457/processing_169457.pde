
class tracer
{
    float d=0;
    float x, y;
    boolean dead = false;
    int stcc = 0;
    int strkR = 0;
    int strkG = 0;
    int strkB = 0;
    drawbot mom;
    boolean invincible = true;
    int invincicounter = 10;
      
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
        if(invincible && invincicounter < 1)
        {
            invincible = false;
        }
        else if(invincible)
        {
            invincicounter = invincicounter-1;
        }
    
        if(dead)
        {
            dead = false;
            invincible = true;
            invincicounter = 10;
            strkR  = mom.strkR;
            strkG  = mom.strkG;
            strkB  = mom.strkB;
            x = mom.x;
            y = mom.y;
            d = mom.d + PI/2;
            float vx = sin(d)*1.5;
            float vy = cos(d)*1.5;
            x+=vx;
            y+=vy;
            return;
        }
    
        if(x < 0 || x > width || y < 0 || y > height)
        {
            dead = true;
        }
    
        if(strkR >= 255 && strkG >= 255 && strkB >= 255)
        {
            if(!invincible)
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
            x = nx;
            y = ny;
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

    }
}

class drawbot
{
    float d=0;
    float x, y, t, tc;
    boolean swig = false;
    int stcc = 0;
    int strkR = 30+random(155);
    int strkG = 30+random(155);
    int strkB = 30+random(155);
    var tracers = [];
      
    float rAngle = random() * TWO_PI/100;
      
    public drawbot(bool mrk)
    {
        x = width /2;
        y = height /2;
        t = 0;
        tc = 100
        d = random(6);
        if(random() > 0.5)
        {
            d= 0-d;
        }
    }
     
    void update()
    {
        if(tracers.length < 20)
            tracers.push(new tracer(this));
            
        float vx = sin(d);
        float vy = cos(d);

        x += vx;
        y += vy;
 

        stroke(strkR, strkG, strkB);
        strokeWeight(1);
      
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
         

        if (swig) d += rAngle;
 
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
    size(400,400);
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
