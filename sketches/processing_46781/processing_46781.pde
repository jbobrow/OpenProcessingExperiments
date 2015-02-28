
int     grid_size  = 55;      // Kugel größe
float x = 0;
float y = 0;
 
 


// Einimalige Ausführung 
void setup () {
    size(900,800);      // grösse der zeichenfläche 
    smooth();               // kantenglättung an!
    }
 
 
 
// Die Schleife 
void draw () {    
    background(0); 
     
    float anzahl_x = (width/grid_size);                      // anzahl rasterelemente in der Weite
    float anzahl_y = (height/grid_size);                     // anzahl rasterelemente in der Höhe


    for ( int i = 0; i <= anzahl_x; i = i+1 )             // von links nach rechts (width)
    {
         
        for ( int j = 0; j <= anzahl_y; j++ )              // von oben nach unten (height)
        {
          pushMatrix();                                  // nullpunkt merken
             
          translate( i*grid_size, j*grid_size );   
   
                if((i+j)%2 == 0){
                  x = (grid_size-abs(anzahl_x-2*i)*grid_size/anzahl_x);     // elementMalen aufrufen

               noFill();
               stroke(15*x, 0, 0);
               strokeWeight(0.5);
                  KugelMalen(x, y);        
                }
         
          popMatrix();                 // nullpunkt  zurücksetzen
     
        }
      }
  }
 
 
 

 
 
//Kugel funktionen 
 
void KugelMalen ( float x, float y ) {

    float anzahl_x = (width/grid_size);                      // anzahl rasterelemente in der Weite

  
 
        for ( float i = anzahl_x; i > 0; i=i-2 ) {             // von oben nach unten
            
                x = i*(grid_size/anzahl_x);
                y = (grid_size);               // elementMalen aufrufen
                            
                ellipse( 4,4, 1/x, 1/y );                 
                ellipse( 4,4, 1*y, 1*x );                    
        }  
  }
  
  
  
  
  
   
void mouseMoved() {
   float anzahl_x = (width/grid_size);                      
    float anzahl_y = (height/grid_size);                    

for ( int i = 0; i <= anzahl_x; i = i+1 )             // von links nach rechts (width)
    {
         
        for ( int j = 0; j <= anzahl_y; j++ )              // von oben nach unten (height)
        {
          pushMatrix();                                  // nullpunkt merken
             
          translate( i*grid_size, j*grid_size );   
   
                if((i+j)%4 == 0){
                  x = (grid_size-(abs(anzahl_x-2*i))*grid_size/anzahl_x);     // elementMalen aufrufen

               stroke(15*x, random(200), 0);
               strokeWeight(0.2);
               KugelMalen(x, y);        
                }
         
          popMatrix();                 // nullpunkt  zurücksetzen
     
        }
      }
  
  }

