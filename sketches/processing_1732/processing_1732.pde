
/**
 *    Muster 2
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 50;      // rastergrösse in pixeln

boolean flip       = false;    // flipflop variable zum wechseln zw. den methoden aufrufen
boolean flop       = false;    // noch eine für die kolumnen

boolean save_pdf   = false;    // pdf sichern? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );      // grösse der zeichenfläche und pdf
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-2-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( #DDFFCE );                                     // hintergrund weiss füllen (löschen)
    
    for ( int ix = 0; ix < (width/grid_size); ix = ix+1 )  // von links nach rechts
    {
        flip = flop;                                       // setzen flip auf den wert von flop
        
        flop = !flop;                                      // flop umkehren (negieren)
        
        for ( int iy = 0; iy < (height/grid_size); iy++ )  // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                
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
    
    if ( save_pdf ) endRecord();                            // pdf schreiben? dann fertig!

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
   
    smooth ();
    noStroke ();
    fill (#7B167C, random (255));
    bezier( 0, 0, 0+60, 20-60, 100-70, 100-5, 180, 20); 
    bezier (0, 0, 5+40, 20-45, 100+5, 100-140, 180, 20);
}

void elementMalen2 ()
{   
    fill (#6ADE3A, random (255));
    bezier (0, 0, 0-10, 0+20, -30, 0, -30, 0-5); //untere
    bezier (0, 0, 0+10, 0-20, -30, 0, -30, 0-5);

    fill (#95F76B, random (255));
    bezier (0, 0, 0+10, 0+20, +30, 0, 30, 0-5); //untere
    bezier (0, 0, 0-10, 0-20, +30, 0, 30, 0-5);
 
}

