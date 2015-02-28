
int count = 500;
float radius = 180;

PVector[] sites = new PVector[count];
float[] radii = new float[count];
int[] colors = new int[5]{ 0xA6F5B7,0xFC6E00,0x8E0626,0x00EAE8,0xE6EA00 };

void setup()
{
    size(700, 700);
    reset();
}

void draw()
{
    if( sites == null ) return;
    noStroke();

    for( int i = 0; i < count; i++ )
    {
        int col = colors[ (int) ( i+1 ) % colors.length ];
        fill( col >> 16 & 0xFF, col >> 8 & 0xFF, col & 0xFF );
        ellipse( sites[i].x, sites[i].y, radii[i], radii[i] );
        radii[i]--;
        
    }
    
    if ( radii[ 0 ] <= 0 )
    {
        noLoop();
    }
}

void reset()
{
    for( int i = 0; i < count; i++ )
    {
        sites[i] = new PVector( random(width), random(height) );
        radii[i] = radius;
    }
}

void mousePressed()
{
    reset();
    loop();
}                       
