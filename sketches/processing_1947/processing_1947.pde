
/**
 *    Muster 3
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */

int     grid_size  = 105;      // rastergrˆsse in pixeln

boolean flip       = false;    // flipflop variable zum wechseln zw. den methoden aufrufen
boolean flop       = false;    // noch eine f¸r die kolumnen


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
        beginRecord( PDF, "muster-3-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 255 );                                     // hintergrund weiss f¸llen (lˆschen)
    
    float grid_w = (width/grid_size);                      // anzahl rasterelemente in der hˆhe
        
    for ( int ix = 0; ix < grid_w; ix = ix+1 )             // von links nach rechts
    {
        flip = flop;                                       // setzen flip auf den wert von flop
        
        flop = !flop;                                      // flop umkehren (negieren)
        
        float grid_h = (height/grid_size);                 // anzahl rasterelemente in der hˆhe
        
        for ( int iy = 0; iy < grid_h; iy++ )              // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                translate( grid_size/2, grid_size/2 );     // nullpunkt in die mitte vom rasterfeld
                
                float sy = 0.5, sx = 0.5;                  // variablen f¸r skalierungen
                
                if ( scale_v )
                    sy = map( iy, 0, grid_h, 1.1, 0.1 );   // y-position in skalierung ¸bersetzen
                    
                if ( scale_h )
                    sx = map( ix, 0, grid_w, 1.1, 0.1 );   // x-position in skalierung ¸bersetzen
                
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

void elementMalen1 ()
{
  smooth();
for (int i = 0; i<50; i++){
noFill();
stroke (255-i*5);
rectMode(CENTER);
ellipse (0,0,i,i);
}
}

void elementMalen2 ()
{
      smooth();
for (int i = 0; i<50; i++){
  noFill();
stroke (i*5);
ellipse (0,0,i,i);
}
}


