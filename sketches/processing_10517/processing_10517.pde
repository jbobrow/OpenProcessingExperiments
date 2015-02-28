
// --------------------------------------------------------------- //
//    nur für besonders neugierige ..
// --------------------------------------------------------------- //

import processing.pdf.*;   // PDF export library ("erweiterung")


int grid_size  = 105;      // rastergrösse in pixeln
boolean savePDF = false;   // pdf sichern? true oder false


void setup ()               // einstellungen machen
{
    size( 1260, 840 );      // grösse der zeichenfläche und pdf
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( savePDF ) beginRecord( PDF, "muster_01.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss füllen (löschen)
    
    for ( int ix = 0; ix < (width/grid_size); ix = ix+1 )  // von links nach rechts
    {
        for ( int iy = 0; iy < (height/grid_size); iy++ )  // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                
                elementMalen();                            // elementMalen aufrufen
                
            popMatrix();                                   // nullpunkt auf alten zurücksetzen
        }
    }
    
    if ( savePDF ) endRecord();                            // pdf schreiben? dann fertig!

    noLoop();                                              // loop anhalten
}


void mousePressed ()     // wird aufgerufen wenn die mouse gedrückt wurde / ist
{
    redraw();            // einmal neu zeichnen
}

