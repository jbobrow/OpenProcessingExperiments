
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 200;      // rastergrösse in pixeln
boolean save_pdf   = false;    // pdf sichern? true oder false

                               // name des PDFs
String  pdf_name   = "beispiel";


/* ------ setup und draw ------ */

void setup ()               // einstellungen machen
{
    size( 1260, 840 );    // grösse der zeichenfläche und pdf
}


void draw ()                // hauptschleife vom programm, loopt
{


    
    if ( save_pdf ) 
        beginRecord( PDF, "muster-1-"+pdf_name+"-####.pdf" );    // pdf schreiben? dann beginnen
    
    background( 200 );                                     // hintergrund weiss füllen (löschen)
    
    for ( int ix = 0; ix <= (width/grid_size)+1; ix = ix+1 )  // von links nach rechts
    {
        for ( int iy = 0; iy <= (height/grid_size)+1; iy++ )  // von oben nach unten
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

//void mouseMoved ()
//{
  
//}

/* ------ muster funktion ------ */

void elementMalen ()
{


for (int  i = 0; i< 100; i +=2) {
  stroke(255-i);
  line (i,0,i+300,300);
  

  stroke(255-i);
  line (i,0,i-50,300);
  



 
 
}
  
}
  //fill(174, 221, 60, 160);
  // rect (0,0, 10, 10);






 
 
  




