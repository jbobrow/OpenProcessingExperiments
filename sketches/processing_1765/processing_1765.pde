
/**
 *    Muster 3
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */

int     grid_size  = 105;      // rastergrösse in pixeln

boolean flip       = false;    // flipflop variable zum wechseln zw. den methoden aufrufen
boolean flop       = false;    // noch eine für die kolumnen


/* ------ variablen für einstellungen ------ */

boolean save_pdf   = false;    // pdf sichern? true oder false

boolean scale_h    = true;     // horizontal skalieren? true oder false
boolean scale_v    = true;    // vertikal skalieren? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";



/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( screen.width, screen.height );      // grösse der zeichenfläche und pdf
    
    smooth();               // kantenglättung an!
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-3-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 70 );                                     // hintergrund weiss füllen (löschen)
    
    float grid_w = (width/grid_size);                      // anzahl rasterelemente in der höhe
        
    for ( int ix = 0; ix < grid_w; ix = ix+1 )             // von links nach rechts
    {
        flip = flop;                                       // setzen flip auf den wert von flop
        
        flop = !flop;                                      // flop umkehren (negieren)
        
        float grid_h = (height/grid_size);                 // anzahl rasterelemente in der höhe
        
        for ( int iy = 0; iy < grid_h; iy++ )              // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                
                
                float sy = 4, sx = 3;                  // variablen für skalierungen
                
                if ( scale_v )
                    sy = map( iy, 0, grid_h, 1.1, 0.1 );   // y-position in skalierung übersetzen
                    
                if ( scale_h )
                    sx = map( ix, 0, grid_w, 1.1, 0.1 );   // x-position in skalierung übersetzen
                
                scale( sy+sx );                            // skalieren
                
                if ( flip )                                // flip? dann..
                {
                    elementMalen1();                       // elementMalen1 aufrufen
                }
                else                                       // ... ansonsten
                {
                    elementMalen2();                       // elementMalen2 aufrufen   
                }
                
                flip = !flip;                              // flip umkehren (negieren)
                
            popMatrix();                                   // nullpunkt auf alten zurücksetzen
        }
    }
    
    if ( save_pdf ) endRecord();                           // pdf schreiben? dann fertig!

    noLoop();                                              // loop anhalten
}



/* ------ mouse abfrage ------ */

void mousePressed ()     // wird aufgerufen wenn die mouse gedrückt wurde / ist
{
    redraw();            // einmal neu zeichnen
}



/* ------ muster funktionen ------ */

void elementMalen1 ()
{
    fill( random (255), random (255), random (255) );
    triangle( 0,200, 30,30, 60,60 );
    noStroke ();
}

void elementMalen2 ()
{
    fill( random (60) );
    line( 10,40, 80,40);
    noStroke ();
}

