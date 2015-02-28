

Vehicle v;

void setup ()
{
    size( 450, 450 );

    v = new Vehicle(0,0);

    noStroke();
}

void draw ()
{
    background(100);

    fill( 200 );
    rect(0,0,15,15);

    if ( !v.step() )
    {
        v.turn();
    }

    v.drawVehicle();
}

int mx, my;

void mousePressed ()
{
    mx = mouseX/10; 
    my = mouseY/10;
}

void mouseReleased ()
{
    int d = 0;
    if ( mx > mouseX/10 ) d = 2;
    if ( abs(my-(mouseY/10)) > abs(mx-(mouseX/10)) )
    {
        if ( my > mouseY/10 ) d = 3;
        else if ( my < mouseY/10 ) d = 1;
    }
    v.set(mx*10, my*10, d);
}

class Vehicle
{
    float x, y;
    float dir=0;

    Vehicle ( float _x, float _y )
    {
        x = _x; 
        y = _y; 
    }

    void drawVehicle ()
    {
        fill( 255 );
        rect( x, y, 10, 10 );
    }

    boolean step ()
    {
        float xo = x; 
        float yo = y;

        if ( x == 0 && y == 0 ) return true;

        if ( dir == 0 ) x += 10; // right
        if ( dir == 1 ) y += 10; // down
        if ( dir == 2 ) x -= 10; // left
        if ( dir == 3 ) y -= 10; // up

        if ( x < 0 || x+10 > width || y < 0 || y+10 > height )
        {
            x = xo; 
            y = yo;
            return false;
        }

        return true;
    }

    void turn ()
    {
        dir += 1;
        dir %= 4;
    }

    void set ( float _x, float _y, int _d )
    {
        x = _x; 
        y = _y; 
        dir = _d;
    }
}





