
void setup ()
{
    size( 400, 400 );

    background( 255 );
    smooth();

    float w9 = width/9.0;
    float h8 = height/8.0;
    int steps = 10;

    // dunkle flächen (oben)
    stripedDiamond( 4*w9, 0, 6*w9, h8, -2*w9, h8, steps, 0.05 );
    stripedDiamond( 2*w9, 3*h8, 4*w9, 4*h8, -2*w9, h8, steps, 0.05 );
    stripedDiamond( 6*w9, 3*h8, 8*w9, 4*h8, -2*w9, h8, steps, 0.05 );
    stripedDiamond( 4*w9, 6*h8, 6*w9, 7*h8, -2*w9, h8, steps, 0.05 );

    // mittel-dunkle flächen (links)
    stripedDiamond( 2*w9, h8, 2*w9, 3*h8, 2*w9, h8, steps, 0.25 );
    stripedDiamond( 6*w9, h8, 6*w9, 3*h8, 2*w9, h8, steps, 0.25 );
    stripedDiamond( 0, 4*h8, 0, 6*h8, 2*w9, h8, steps, 0.25 );
    stripedDiamond( 4*w9, 4*h8, 4*w9, 6*h8, 2*w9, h8, steps, 0.25 );

    // helle flächen (rechts)
    stripedDiamond( 0, 2*h8, 2*w9, h8, 0, 2*h8, steps, 0.40 );
    stripedDiamond( 4*w9, 2*h8, 6*w9, h8, 0, 2*h8, steps, 0.40 );
    stripedDiamond( 2*w9, 5*h8, 4*w9, 4*h8, 0, 2*h8, steps, 0.40 );
    stripedDiamond( 6*w9, 5*h8, 8*w9, 4*h8, 0, 2*h8, steps, 0.40 );
}


void stripedDiamond ( float x1, float y1, float x2, float y2, float w, float h, int steps, float strokeW )
{
    //
    // schwarze flächen
    //
    
    fill( 0 );
    noStroke();
    
    diamond( x1, y1, x2, y2, w, h );
    
    
    //
    // weisse linien füllung
    //
    
    fill( 255 );
    noStroke();
    
    for ( int i = 0; i < steps; i++ )
    {
        float xx1 = map( 0.5 + i+strokeW, 0, steps, x1, x2 );
        float xx2 = map( 0.5 + i-strokeW, 0, steps, x1, x2 );
        
        float yy1 = map( 0.5 + i+strokeW, 0, steps, y1, y2 );
        float yy2 = map( 0.5 + i-strokeW, 0, steps, y1, y2 );

        beginShape();
        vertex( xx2, yy2 );
        vertex( xx1, yy1 );
        vertex( xx1+w, yy1+h );
        vertex( xx2+w, yy2+h );
        endShape(CLOSE);
    }
    
    //
    // schwarze linien umrandung
    //
    
    noFill();
    stroke( 0 );
    strokeWeight( 3 );
    strokeJoin(ROUND);
    
    diamond( x1, y1, x2, y2, w, h );
}

void diamond ( float x1, float y1, float x2, float y2, float w, float h )
{
    beginShape();
    vertex( x1, y1 );
    vertex( x2, y2 );
    vertex( x2+w, y2+h );
    vertex( x1+w, y1+h );
    endShape(CLOSE);
}


