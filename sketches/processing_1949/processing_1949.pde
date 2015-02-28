
/**
 *    Muster 4
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */

int     grid_size  = 105;      // rastergrˆsse in pixeln


/* ------ variablen f¸r einstellungen ------ */

boolean save_pdf   = false;    // pdf sichern? true oder false

boolean scale_h    = true;     // horizontal skalieren? true oder false
boolean scale_v    = false;    // vertikal skalieren? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";



/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );      // grˆsse der zeichenfl‰che und pdf
    
    smooth();               // kantengl‰ttung an!
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-4-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss f¸llen (lˆschen)
    
    float grid_w = (width/grid_size);                      // anzahl rasterelemente in der hˆhe
    float grid_h = (height/grid_size);                     // anzahl rasterelemente in der hˆhe
        
    for ( int ix = 0; ix < grid_w; ix = ix+1 )             // von links nach rechts
    {
        
        for ( int iy = 0; iy < grid_h; iy++ )              // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                translate( grid_size/2, grid_size/2 );     // nullpunkt in die mitte vom rasterfeld
                
                                                           // elementMalen aufrufen
                elementMalen( ix*grid_size/grid_w, iy*grid_size/grid_h );
                
            popMatrix();                                   // nullpunkt auf alten zur¸cksetzen
        }
    }
    
    if ( save_pdf ) endRecord();                           // pdf schreiben? dann fertig!

    noLoop();                                              // loop anhalten
}



/* ------ mouse abfrage ------ */

void mousePressed ()     // wird aufgerufen wenn die mouse gedr¸ckt wurde / ist
{
    redraw();            // einmal neu zeichnen
}



/* ------ muster funktionen ------ */

void elementMalen ( float w, float h )
{
    fill( w );
    strokeWeight (12);
    stroke (h+100);
   // rectMode(CENTER);
    rect (0,0,h,w);
}


