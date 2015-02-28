
int count = 1000;
float radius = 60;

PVector[] sites = new PVector[count];
float[] radii = new float[count];
int[] colors = new int[5]{ 0x0B4A4B,0x196559,0xFF9E37,0xFF782D,0xFA4C2D };

void setup()
{
    size(500, 500);
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
