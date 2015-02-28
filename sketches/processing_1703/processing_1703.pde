
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 105;      // rastergrösse in pixeln
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
    
    if ( save_pdf ) endRecord();                            // pdf schreiben? dann fertig!

    noLoop();                                              // loop anhalten
}


/* ------ mouse abfrage ------ */

void mousePressed ()     // wird aufgerufen wenn die mouse gedrückt wurde / ist
{
    redraw();            // einmal neu zeichnen
}


/* ------ muster funktion ------ */

PShape galaxy = loadShape ("Musterolg01.svg");

void elementMalen ()
{
  noStroke();
  shape (galaxy,0,0, grid_size, grid_size);
  fill (random(255), random(255), random(255), 150);
  rect (0,0, grid_size, grid_size);
  
}

