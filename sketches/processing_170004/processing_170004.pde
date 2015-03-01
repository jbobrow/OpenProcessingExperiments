
void setup()
{
 size(500,500); 
}

void draw()
{
background(0,0,0);
fill(0,0,0);
stroke(255,255,255);

float durchmesser = 400;
float radius =durchmesser/2;

 //Nullpunkt festlegen  
  translate(width/2,height/2);
 

//Uhrrahmen
////
//
    
    
  ellipse(0,0,durchmesser,durchmesser);
  
  //Viertelstriche
  //
  

      
      
      
      for(int i = 0; i < 4; i++)
      {        
        line(0,radius,0,radius-20);   
        rotate(PI/2);   
      }
     
    
  //

//
////

//Zeiger
//

  

  //Sekunde
  //
    stroke(255,0,0);
    float winkel = map(second(),0,60,0,2*PI);
    rotate(PI+winkel);
    line(0,0,0, radius-15);
    stroke(255,255,255);
  //
  
  //Koordinatensystem zurück drehen
  rotate(-(PI+winkel));
  
  //Minute
  //
  
    winkel = map(minute(),0,60,0,2*PI);
    rotate(PI+winkel);
    line(0,0,0,radius-25);
   //
    
  //Koordinatensystem zurück drehen
  rotate(-(PI+winkel));
  
  //Stunde
  //
    winkel = map(hour(),0,60,0,2*PI);
    rotate(PI+winkel);
    line(0,0,0,radius-60);
   //
   
 //
 ////
  
  

}
  
