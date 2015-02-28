

class clock{
  
   float seiGradi = PI/30;
   float trentaGradi = PI/6;
 
 clock (int T1, int T2, int posX,int posY)
  {
    
    translate(posX,posY);
    //tint(random(255),20);
    
    int secondi = second();  
    disegnaLancetta( secondi*seiGradi, 25, 1); 

    int minuti = minute()+T2;  
    disegnaLancetta( minuti*seiGradi, 15,2 );
  
  
    int ore = hour()+T1;   
    disegnaLancetta( ore*trentaGradi, 10,3 );
    //noTint();
  }

   
 void disegnaLancetta( float angolo, float lunghezza,int Spessore ) 
  {
    pushMatrix();
    rotate( angolo-HALF_PI );
    strokeWeight(Spessore);
    
    //stroke(random(255),random(255),random(255),255);
    stroke(#AF6204,255);
    line( 0,0, lunghezza,0 );
    popMatrix(); 
   noStroke(); 
   
  }
} 


