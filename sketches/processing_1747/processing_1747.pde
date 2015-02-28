
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 70;      // rastergrösse in pixeln
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
   
smooth ();
  noStroke ();
  
  fill (#FF007C, random (40));
  beginShape ();
  vertex (90,30);
  bezierVertex (0, 35, -10, 140,     100, 130);
  bezierVertex (160, 120, 160, 80,     125, 65);
  bezierVertex (80, 50, 80, 110,     110, 105);
  bezierVertex (105, 105, 110, 110,     80, 110);
  bezierVertex (30, 110, 20, 40,     90, 30);
  endShape ();
  
  fill (random (120), random (120));
  beginShape ();
  vertex (100,40);
  bezierVertex (0, 35, -10, 140,     100, 130);
  bezierVertex (160, 120, 160, 80,     125, 65);
  bezierVertex (80, 50, 80, 110,     110, 105);
  bezierVertex (105, 105, 110, 110,     80, 110);
  bezierVertex (30, 110, 20, 40,     100, 40);
  endShape ();
  
  fill (#FF007C, random (255));
  ellipse (105, 80, 12, 12);
  ellipse (115, 80, 12, 12);
  
  fill (#FF007C, random (120));
  triangle (105, 80, 110, 100, 115, 80);
  
  
  fill (255, 255, 255);
  ellipse (105, 80, 4, 4);
  ellipse (115, 80, 4, 4);
    
}

