
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

PFont x1;
PFont x2;
PFont x3;
PFont x4;
PFont x5;

/*


*/

/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );      // grˆsse der zeichenfl‰che und pdf
    //println( PFont.list());
x1 = createFont ("Comic Sans MS", 32);
x2 = createFont ("Georgia", 32);
x3 = createFont ("Impact", 32);
x4 = createFont ("Sylfaen", 32);
x5 = createFont ("Verdana", 32);
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf )
        beginRecord( PDF, "muster-2-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
   textMode(SHAPE);
    background( 255 );                                     // hintergrund weiss f¸llen (lˆschen)
    
    for ( int ix = 0; ix < (width/grid_size); ix = ix+1 )  // von links nach rechts
    {
        flip = flop;                                       // setzen flip auf den wert von flop
        
        flop = !flop;                                      // flop umkehren (negieren)
        
        for ( int iy = 0; iy < (height/grid_size); iy++ )  // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
                


                    elementMalen();                       // elementMalen1 aufrufen


                
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


void elementMalen ()
{
fill(0);
PFont[] fonts = {x1,x2,x3,x4,x5};
for (int i = 0; i<5; i++){
int rand = round (random(4));
textFont(fonts[rand]);
//text ("0So36",5,50*i+50);
text ("processing",5,50*i+50);
}
}


