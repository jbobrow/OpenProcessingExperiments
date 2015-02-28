
int     grid_size  = 100;      // rastergrösse in pixeln

boolean flip       = false;    // flipflop variable zum wechseln zw. den methoden aufrufen
boolean flop       = false;    // noch eine für die kolumnen


void setup ()               // einstellungen machen
{
    size( 600,600 );      // grösse der zeichenfläche und pdf
    frameRate(8);
    smooth();
    noStroke();
    background(255);
    rectMode(CENTER);
}

void draw ()                // hauptschleife vom programm, loopt
{
    for ( int ix = 0; ix < (width/grid_size+grid_size); ix = ix+1 )  // von links nach rechts
    {
        flip = flop;                                       // setzen flip auf den wert von flop
        
        flop = !flop;                                      // flop umkehren (negieren)
        
        for ( int iy = 0; iy < (height/grid_size+grid_size); iy++ )  // von oben nach unten
        {
            pushMatrix();                                  // alten nullpunkt merken
            
                translate( ix*grid_size, iy*grid_size );   // nullpunkt ins rasterfeld
             
                    elementMalen1();                       // elementMalen1 aufrufen
               
                    elementMalen2();                       // elementMalen2 aufrufen   
                                
            popMatrix();                                   // nullpunkt auf alten zurücksetzen
        }
    }
    noLoop();                                            
}

void elementMalen1 () 
{
  fill(0,80);  
  rect(0,0,130,130);
    }


void elementMalen2 ()
{
  fill(0,60);
  ellipse(50,50,150,150);  
  fill(0,100);
  ellipse(30,30,150,150);
 
}





