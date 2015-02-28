
// from my 2004 sketchbook ...
// fjenett 20090407

Ball ball;
int W_HALF, H_HALF;

void setup()
{
    size(200,200);
    ball = new Ball(1,1);
    W_HALF = width/2;
    H_HALF = height/2;
    
    stroke( 50 );
    fill( 10 );
    background( 255 );
    smooth();
}

void draw()
{
    ball.move();
    ball.draw();
}

void keyReleased()
{
    kick();
}

public void kick()
{
    ball = new Ball((int)random(width), (int)random(height));
}

class Ball
{
    int x,y;
    Ball (int _x, int _y)
    {
        x = _x;
        y = _y;
    }
    void move()
    {
        int xd=-1, yd=-1;

        if (x!=W_HALF)
        {
            xd = int( (W_HALF-x)/6.0 );
            x += xd;
        }
        
        if (y!=H_HALF)
        {
            yd = int( (H_HALF-y)/6.0 );
            y += yd;
        }
        
        if ( xd == 0 && yd == 0 )
        {
            x = (int)random(width);
            while ( x == W_HALF )
                x = (int)random(width);
            y = (int)random(height);
            while ( y == H_HALF )
                y = (int)random(height);
        }
    }
    void draw()
    {
        ellipseMode(CENTER);
        ellipse(x,y,3,3);
    }
}


