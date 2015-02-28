
/**
 *    Muster 2
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 105;      // rastergrˆsse in pixeln

boolean flip       = false;    // flipflop variable zum wechseln zw. den methoden aufrufen
boolean flop       = false;    // noch eine f¸r die kolumnen

boolean save_pdf   = false;    // pdf sichern? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );      // grˆsse der zeichenfl‰che und pdf
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-2-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss f¸llen (lˆschen)
    
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
                
            popMatrix();                                   // nullpunkt auf alten zur¸cksetzen
        }
    }
    
    if ( save_pdf ) endRecord();                            // pdf schreiben? dann fertig!

    noLoop();                                              // loop anhalten
}


/* ------ mouse abfrage ------ */

void mousePressed ()     // wird aufgerufen wenn die mouse gedr¸ckt wurde / ist
{
    redraw();            // einmal neu zeichnen
}


/* ------ muster funktionen ------ */

void elementMalen1 ()
{   
    noStroke();
    fill( random (120,200) );
    rectMode(CENTER);
    rect( 0,0-2, grid_size+77, grid_size-25 );
}

void elementMalen2 ()
{
  strokeWeight(20);
  stroke(random (20,100));
  line (0,50,-100,50);
  line (0,-50,0,50);
    fill( 0 );
     //rect( 0,0, random(grid_size), grid_size );
}


