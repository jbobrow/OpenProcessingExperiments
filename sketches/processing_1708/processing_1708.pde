
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 105;      // rastergrösse in pixeln
boolean save_pdf   = false;    // pdf sichern? true oder false
float sk = 0.5;
float betrag = 0.1;

                               // name des PDFs
String  pdf_name   = "beispiel";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( screen.width, screen.height );      // grösse der zeichenfläche und pdf
    frameRate(3); 
    smooth();
    noStroke();
}


void draw ()                // hauptschleife vom programm, loopt
{
      translate(-(grid_size/2), 0);
    if ( save_pdf ) 
        beginRecord( PDF, "muster-1-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss füllen (löschen)
    
    for ( int ix = 0; ix <= ((width/grid_size)+1); ix = ix+1 )  // von links nach rechts
    {
        for ( int iy = 0; iy <= (height/grid_size); iy++ )  // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            if((iy%2)<1){
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
            }
            else{
                translate( ix*grid_size-grid_size/2, iy*grid_size );
            }
                elementMalen();                            // elementMalen aufrufen
                
            popMatrix();                                   // nullpunkt auf alten zurücksetzen
        }
    }
    
    if ( save_pdf ) endRecord();                            // pdf schreiben? dann fertig!
    sk += betrag;
    if(sk<0.5 | sk>2) betrag = betrag * -1;
   // noLoop();                                              // loop anhalten
}


/* ------ mouse abfrage ------ */

void mousePressed ()     // wird aufgerufen wenn die mouse gedrückt wurde / ist
{
    redraw();            // einmal neu zeichnen
}


/* ------ muster funktion ------ */

void elementMalen ()
{
  pushMatrix();
    scale(sk);
    fill( random( 0 ), random( 255 ), random( 255 ), 50 );
    translate(grid_size/2, 0);
    triangle( 0, 0, grid_size, 0, grid_size/2, grid_size  );
    rotate(PI);
    fill( random( 255 ), random( 0 ), random( 0 ), 50 );
    triangle( 0, 0, grid_size, 0, grid_size/2, grid_size  );
    popMatrix();
}

