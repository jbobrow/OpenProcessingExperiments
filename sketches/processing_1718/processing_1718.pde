
/**
 *    Muster 3
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */

int     grid_size  = 105/3;      // rastergrösse in pixeln

boolean flip       = false;    // flipflop variable zum wechseln zw. den methoden aufrufen
boolean flop       = false;    // noch eine für die kolumnen
float count_1 = 1;
float count_2 = 1;

/* ------ variablen für einstellungen ------ */

boolean save_pdf   = false;    // pdf sichern? true oder false
                               // name des PDFs
String  pdf_name   = "beispiel";



/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size(screen.width, screen.height );      // grösse der zeichenfläche und pdf
    
    smooth();               // kantenglättung an!
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-3-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss füllen (löschen)
    
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
                translate( grid_size/2, grid_size/2 );     // nullpunkt in die mitte vom rasterfeld
     
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
    count_1 = count_1 + 0.5;
    rotate(PI/4);
    fill( 255 );
    ellipse( 0,0, grid_size/2, grid_size/(count_1%2.1) );    
}

void elementMalen2 ()
{
    count_2 = count_2 + 0.5;
    rotate(PI/4);
    fill( 0 );
    ellipse( 0,0, grid_size/(count_2%2.1), grid_size/2 );
}

