
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 105;      // rastergrösse in pixeln
boolean save_pdf   = false;    // pdf sichern? true oder false
float rot = 0;
                               // name des PDFs
String  pdf_name   = "beispiel";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( screen.width, screen.height );      // grösse der zeichenfläche und pdf
    smooth();
}


void draw ()                // hauptschleife vom programm, loopt
{
  translate(-grid_size/2,-grid_size/2);
    if ( save_pdf ) 
        beginRecord( PDF, "muster-1-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss füllen (löschen)
    
    for ( int ix = 0; ix <= (width/grid_size); ix = ix+1 )  // von links nach rechts
    {
        for ( int iy = 0; iy <= (height/grid_size); iy++ )  // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                translate( grid_size/2, grid_size/2);
                
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

void elementMalen ()
{
  strokeWeight(3);
  fill(random(255));
  rect(0,0, grid_size, grid_size);
  
  strokeWeight(1);
  
  fill(random(255));
  ellipse(0,0,grid_size/1.5, grid_size/1.5);  
  fill(random(255));
  ellipse(0,0,grid_size/2, grid_size/2);
  fill(random(255));
  ellipse(0,0,grid_size/3, grid_size/3);
  fill(random(255));
  ellipse(0,0,grid_size/6, grid_size/6);  
}

