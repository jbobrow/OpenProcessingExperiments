
// pattern 0002
// fjenett 20100523

float w25;

void setup ()
{
    size( 350, 500 );
    
    w25 = width / 25.0;
}

void draw ()
{
    background( 255 );
    fill( 0 );
    noStroke();
    smooth();
    
    float x1 = 0;
    
    for ( int i = 0; i < 25; i++ )
    {
        // producing values that climb to the middle and fall back off towards the end ..
        // .. like a very flat parabola or hill
        float v = map(i, 0, 24, 0, PI); // map i to 0 - PI, half a circle
        v = sin( v );                   // sinus of 0 - PI will give 0 - 1 - 0
        v = map( v, 0, 1, 0.4, 1.39 );  // map 0 - 1 to 0.4 - 1.39
        
        // scale next step using the value above and add to previous position
        float xn = x1 + v * w25;
        
        triangle( x1, height,
        x1, 0,
        xn, height );
        
        x1 = xn;
    }
    
    noLoop();   
}

