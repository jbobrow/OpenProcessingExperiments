

// 18_1966-benkert4.jpg

size( 300, 300 );

background( 255 );
noStroke();
fill( 0 );

float s = 6;
float h = height/(s-1.0);
float y = h;
float d = 10, dd = 2;

for( int i = 0; i < s; i++ )
{
    // diese form läuft im uhrzeiger sinn,
    // beginnend vom rand links
    
    beginShape();
    // rand links oben
    vertex(0,y);
    // knick nach oben
    vertex(d-dd,y);
    vertex(d-dd,y-(1.25*h));
    // knick nach unten
    vertex(width-d+dd,y-(1.25*h));
    vertex(width-d+dd,y);
    // rand rechts oben
    vertex(width,y);
    vertex(width,y+h);
    // knick hoch
    vertex(width-d-dd,y+h);
    vertex(width-d-dd,y+h-(1.25*h));
    // knick runter
    vertex(d+dd,y+h-(1.25*h));
    vertex(d+dd,y+h);
    vertex(0,y+h);
    endShape(CLOSE);
    
    d = d + (15 * 0.55);
    y = y + h;
    h = h * 0.7;
    y = y + h;
}


