
int ymax;
float g;
float velo;
float xveloint;
float xvelofin;
float oldvx;
float yveloint;
float yvelofin;
float oldvy;
float xaccel;
float ydelta;
float xdelta;
float xpos;
float ypos;
float oldx;
float oldy;
float t;

void setup() 
{
    size(1000,700);
    ymax = 500;
    g = 9.81;
    xpos = (100);
    ypos = (height -(ymax+25));
    xveloint = 0.0;
    xvelofin = 0.0;
    yveloint = 0.0;
    yvelofin = 0.0;
    t = 0.0;
    background(0);
    stroke(255);
    rect(0,height-(ymax),100,ymax+50);
    fill(0,255,0);
    ellipseMode(RADIUS);
}
    
void draw()
{
    ellipse(xpos,ypos,25,25);
    if (mousePressed == TRUE);
    {
        if (mouseButton == LEFT);
        {
            t += .1;
            oldvx = xveloint;
            oldvy = yveloint;
            yvelofin = yveloint + (g * t);
            ydelta = (((yvelofin*yvelofin)-(yveloint*yveloint))/(2*g))
            ypos += ydelta;
            yveloint = yvelofin;
            
            if (ypos > height)
            {
                break;
            }
        }
    }
}
