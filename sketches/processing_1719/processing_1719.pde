
/**
 *    Muster 4
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */

int     grid_size  = 11;      // rastergrösse in pixeln
float x = 0;
float y = 0;


/* ------ variablen für einstellungen ------ */

boolean save_pdf   = false;    // pdf sichern? true oder false

boolean scale_h    = true;     // horizontal skalieren? true oder false
boolean scale_v    = false;    // vertikal skalieren? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";



/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size(screen.width, screen.height);      // grösse der zeichenfläche und pdf
    noStroke();
    smooth();               // kantenglättung an!
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-4-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss füllen (löschen)
    
    float grid_w = (width/grid_size);                      // anzahl rasterelemente in der höhe
    float grid_h = (height/grid_size);                     // anzahl rasterelemente in der höhe
        
    for ( int ix = 0; ix <= grid_w; ix = ix+1 )             // von links nach rechts
    {
        
        for ( int iy = 0; iy <= grid_h; iy++ )              // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                translate( grid_size/2, grid_size/2 );     // nullpunkt in die mitte vom rasterfeld
                
                  
                x = (grid_size-(abs(grid_w-2*ix))*grid_size/grid_w);
                y = (grid_size-(abs(grid_h-2*iy))*grid_size/grid_h);               // elementMalen aufrufen
                elementMalen(x, y);
                
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

void elementMalen ( float w, float h )
{
    fill( random( 255 ) );
    ellipse( 0,0, w, h );
}

