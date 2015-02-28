
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 90;      // rastergrösse in pixeln
boolean save_pdf   = false;    // pdf sichern? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );     // grösse der zeichenfläche und pdf
   
    
}


void draw ()                // hauptschleife vom programm, loopt
{
    if ( save_pdf ) 
        beginRecord( PDF, "muster-1-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background(0);                                     // hintergrund weiss füllen (löschen)
    
    for ( int ix = 0; ix <= (width/grid_size); ix = ix+1 )  // von links nach rechts bei (statt < (größer) <= (größergleich)einfügen)
    {
        for ( int iy = 0; iy <= (height/grid_size); iy++ )  // von oben nach unten
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
    /*
    //stroke( random( 250 ) );
    smooth ();
    //stroke (random (-120, 120));
    strokeWeight(random (3));
    //rect( 0, 0, grid_size, grid_size );
    
    stroke (#FFFFFF, 30);
    fill (#B2FF00, random (100));
    bezier( 0, 0, 0+60, 20-60, 100-70, 100-5, (120), 120);
    bezier (0, 0, 5+30, 20-30, 100-30, 100-130, 120, 120);

    stroke (#FFFFFF, 60);
    strokeWeight (1);
    fill (#FFFFFF, random (100));
    bezier( 0, 0, 0+60, 20-60, 100-70, 100-5, 80, 180);
    bezier (0, 0, 5+40, 20-40, 100+5, 100-140, 80, 180);
    
    stroke (#FFFFFF, 90);
    strokeWeight (1);
    fill (#FEFF00, random (100));
    bezier( 0, 0, 0+60, 20-60, 100-70, 100-5, 180, 20); 
    bezier (0, 0, 5+40, 20-45, 100+5, 100-140, 180, 20);
    */
   
    //linker flügel
    smooth();
    noStroke ();
    
    //ebene4
    fill (random (233), random (40));
    bezier (0, 80, 0-20, 0+10, 0, 30, 0-5, 110); //untere
    bezier (0, 80, 0+20, 0-10, 0, 30, 0-5, 110);
    
    bezier (0, 80, 0-20, 0+10, 0, -30, 0-5, -110); //untere
    bezier (0, 80, 0+20, 0-10, 0, -30, 0-5, -110);
 
    bezier (0, 80, 0-10, 0+20, -30, 0, -110, 0-5); //untere
    bezier (0, 80, 0+10, 0-20, -30, 0, -110, 0-5);
   
    bezier (0, 80, 0+10, 0+20, +30, 0, 110, 0-5); //untere
    bezier (0, 80, 0-10, 0-20, +30, 0, 110, 0-5);
    
    
    //ebene3
    //fill (random (#6AF4FF), random (70));
    fill (random (#6AF4FF), random (70));
    bezier (0, 40, 0-20, 0+10, 0, 30, 0-5, 70); //untere
    bezier (0, 40, 0+20, 0-10, 0, 30, 0-5, 70);
    
    bezier (0, 40, 0-20, 0+10, 0, -30, 0-5, -70); //untere
    bezier (0, 40, 0+20, 0-10, 0, -30, 0-5, -70);
 
    bezier (0, 40, 0-10, 0+20, -30, 0, -70, 0-5); //untere
    bezier (0, 40, 0+10, 0-20, -30, 0, -70, 0-5);
   
    bezier (0, 40, 0+10, 0+20, +30, 0, 70, 0-5); //untere
    bezier (0, 40, 0-10, 0-20, +30, 0, 70, 0-5);
    
    
    //ebene2
    fill (random (#6AF4FF), random (150));
    bezier (0, 20, 0-20, 0+10, 0, 30, 0-5, 50); //untere
    bezier (0, 20, 0+20, 0-10, 0, 30, 0-5, 50);
    
    bezier (0, 20, 0-20, 0+10, 0, -30, 0-5, -50); //untere
    bezier (0, 20, 0+20, 0-10, 0, -30, 0-5, -50);
 
    bezier (0, 20, 0-10, 0+20, -30, 0, -50, 0-5); //untere
    bezier (0, 20, 0+10, 0-20, -30, 0, -50, 0-5);
   
    bezier (0, 20, 0+10, 0+20, +30, 0, 50, 0-5); //untere
    bezier (0, 20, 0-10, 0-20, +30, 0, 50, 0-5);
    
    
    //ebene 1
    fill ( random (#6AF4FF), random (200));
    bezier (0, 0, 0-20, 0+10, 0, 30, 0-5, 30); //untere
    bezier (0, 0, 0+20, 0-10, 0, 30, 0-5, 30);
    
    bezier (0, 0, 0-20, 0+10, 0, -30, 0-5, -30); //untere
    bezier (0, 0, 0+20, 0-10, 0, -30, 0-5, -30);
 
    bezier (0, 0, 0-10, 0+20, -30, 0, -30, 0-5); //untere
    bezier (0, 0, 0+10, 0-20, -30, 0, -30, 0-5);
   
    bezier (0, 0, 0+10, 0+20, +30, 0, 30, 0-5); //untere
    bezier (0, 0, 0-10, 0-20, +30, 0, 30, 0-5);

    
}

