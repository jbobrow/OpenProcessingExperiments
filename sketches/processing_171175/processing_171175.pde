
void setup()                                               
{
 size(500,500); 
}

void draw()
{
background(0,0,0);
fill(0,0,0);
stroke(255,255,255);









                                                              //Funktionen der Uhr

float durchmesser = 400;
float radius =durchmesser/2;

 
  translate(width/2,height/2);                                //Nullpunkt festlegen 
 


  
 
 
  ellipse(0,0,durchmesser,durchmesser);                        //Uhrrahmen
  
  
 
  
  
  
  
  
  
      for(int i = 0; i < 4; i++)                               //Viertelstriche
      {        
        line(0,radius,0,radius-20);   
        rotate(PI/2);   
      }
  
  
  
  
                                                               //Zeiger

  


    stroke(255,0,0);                                           //Sekunde
    float winkel = map(second(),0,60,0,2*PI);
    rotate(PI+winkel);
    line(0,0,0, radius-15);
    stroke(255,255,255);
  
    
  

 
rotate(-(PI+winkel));                                           //Koordinatensystem zurück drehen            

  
  

    winkel = map(minute(),0,60,0,2*PI);                         //Minute
    rotate(PI+winkel);
    line(0,0,0,radius-25);
  
  
  
  
rotate(-(PI+winkel));                                           //Koordinatensystem zurück drehen
    
    
    
  
    winkel = map(minute()+hour()*60,0,12*60,0,2*PI);            //Stunde
    rotate(PI+winkel);
    line(0,0,0,radius-60);
  
  

}
  
