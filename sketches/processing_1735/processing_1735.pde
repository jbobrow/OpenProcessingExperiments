
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 105;      // rastergrösse in pixeln
boolean save_pdf   = false;    // pdf sichern? true oder false

                               // name des PDFs
String  pdf_name   = "eicheka1";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );      // grösse der zeichenfläche und pdf
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf ) 
        beginRecord( PDF, "muster-1-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 150 );                                     // hintergrund weiss füllen (löschen)
    
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

void elementMalen ()
{
    smooth();
    //noStroke();
    rectMode(CENTER);  
    translate( grid_size/2, grid_size/2 );
    
    //hinteres rechteck
    fill( random(100), random(0), random(255), random(255) );
    rect( 0,0, grid_size-6, grid_size-6 );
    
    //kleines vorderes rechteck
    rotate( random(360) );
    fill( random(255), random(0), random(200), random(255));
    rect(0,0, grid_size/2, grid_size/2 );
    
    
    //----KREISE----
    //mitte
    fill(random(200),random(200),random(0));
    ellipse(0,0, 20,20);
   
    //links oben
    fill(random(255),random(0),random(0));
    ellipse(-50,0, 10,10);
    
    //rechts unten
    fill(random(255),random(0),random(0));
    ellipse(50,0, 10,10);
    
    //rechts oben
    fill(random(255),random(0),random(0));
    ellipse(0,-50, 10,10);
    
    //links unten
    fill(random(255),random(0),random(0));
    ellipse(0,50, 10,10);
    
    noFill();
    bezier(-50,0, -75,-25,   25,0, 0,-50);
    bezier(0,-50, -75,-25,   25,0, 50,0);
    bezier(50,0, 50,50,   -30,10, 0,50);
    bezier(0,50, 50,25,   -50,50, -50,0);
}

