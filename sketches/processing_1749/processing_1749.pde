
/**
*    fjenett 20090418
*
*    Boris Müller:
*    http://www.esono.com/boris/projects/poetry04/visualpoetry04/index.html
*/

String word = "Gestalten mit Code macht Spass";
PFont fnt;

void setup ()
{
    size( 300, 300 );
    
    //println( PFont.list() );
    fnt = createFont( "Simple-Bold", 24 );
    textFont( fnt );
    textAlign( CENTER );
    
    noStroke();
    smooth();
}

void draw ()
{
    background( 100 );
    translate( width/2, height/2 );

    float tw = textWidth( word );
    float[] x = new float[word.length()];
    float[] y = new float[word.length()];
    
    for ( int i = 0, n = 0; i < tw; n++ )
    {
        char cr = word.charAt(n);
        float c = int(cr);
        
        float r = -HALF_PI + map( i, 0, tw, 0, TWO_PI );
        
        x[n] = cos(r)*c;
        y[n] = sin(r)*c;
        
        i += textWidth( cr );
    }
    
    fill( 200 );
        
    beginShape();
    for ( int i = 0; i < x.length; i++ )
        vertex( x[i], y[i] );
    endShape(CLOSE);
    
    fill( 0 );
    
    for ( int i = 0; i < x.length; i++ )
        text( word.charAt(i), x[i]*1.15, y[i]*1.15+6 );
}

void keyPressed ()
{
    if ( word.length() > 0 && (keyCode == BACKSPACE || keyCode == DELETE) )
    {
        word = word.substring( 0, word.length()-1 );
    }
    else if ( key != CODED )
    {
        word += key;
    }
}

