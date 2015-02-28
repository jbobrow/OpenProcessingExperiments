
/**
 *    Muster 1
 */

import processing.pdf.*;       // PDF library (Plugin) laden


/* ------ variablen anlegen ------ */
 
int     grid_size  = 150;      // rastergrösse in pixeln
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
noFill();
for ( int d = 150; d > 0; d -= 10) {
  stroke(255);
  ellipse (50,50,d,d);
  fill (100,10);
}
stroke(1);
smooth();
noLoop();    
fill(0);
triangle (10,50,25,60,50,50);


fill(0);
triangle (20,9,30,50,60,50);


fill (255);
ellipse (50,50,60,60/grid_size);
fill(0);
stroke(1);
ellipse (50+10,50,30,30);
fill(200);
ellipse (50+10,45,26,26);
fill(255);
stroke(1);
ellipse (50+16,45,6,6);



fill(255);
triangle (10,9,30,50,60,50);

}

  
  



 
 

  

  //fill(174, 221, 60, 160);
  // rect (0,0, 10, 10);






 
 
  




