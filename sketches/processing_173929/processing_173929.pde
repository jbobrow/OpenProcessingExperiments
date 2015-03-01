
void setup ()
{
 size(500,700); 

}



void draw()
{
 
  background (255);
  

  
  if (mousePressed == true )
  {
     zeichneStreichholz(width/2, 200, 50, 150, 0.8);
  }
  else
  {
  zeichneStreichholz(width/2, 200, 50, 150, 0);
  }
}
     
   
  
 void zeichneStreichholz(int feuerposX, int feuerposY, int feuerbreite, int feuerhoehe, float transparenz)
 {
  
   
   //Flamme
  int feuerKreisAnzahl = 200;
  
  float feuerKreisDurchmesser =20;
    
  int topOffset = 5;
  
  //Flammenfarbe außen     
   int maxRed = 255;
   int maxGreen = 226;
   int maxBlue = 59;
   
  //Flammenfarbe innen     
   int minRed = 224;
   int minGreen = 60;
   int minBlue = 0;
  
  
  noStroke();  
  
  for (int i = 0; i<=feuerKreisAnzahl; i++)
  {
    if( i > topOffset)
    {   
        
       float verschiebungY = map(i, 0, feuerKreisAnzahl, 0, feuerhoehe);
                 
       float maxVerschiebungX = 0;
       float verschiebungX = 0;
      
       if (i<feuerKreisAnzahl/3)
       {
         maxVerschiebungX = map(i, 0, feuerKreisAnzahl/3, 0, feuerbreite/2);
       }
       else if(i < feuerKreisAnzahl*2/3)
       {
         maxVerschiebungX = feuerbreite/2;
       }   
       else
       {
         maxVerschiebungX = map(i, feuerKreisAnzahl*2/3, feuerKreisAnzahl,  feuerbreite/2, 0);
       }
       
       if(maxVerschiebungX == 0)
         continue;
         
       verschiebungX = random (-maxVerschiebungX, maxVerschiebungX);
       
         
       float actRed = map(abs(verschiebungX/maxVerschiebungX), 0, 1, maxRed, minRed);
       float actGreen = map(abs(verschiebungX/maxVerschiebungX), 0, 1, maxGreen, minGreen);
       float actBlue = map(abs(verschiebungX/maxVerschiebungX), 0, 1, maxBlue, minBlue);
          
       fill(color(actRed,actGreen,actBlue, 255*transparenz)); 
       ellipse(feuerposX+feuerbreite/2+verschiebungX , feuerposY+verschiebungY, feuerKreisDurchmesser, feuerKreisDurchmesser);
          
     }
     
     fill(#FF0303);
     ellipse(feuerposX+feuerbreite/2, feuerposY +feuerhoehe, feuerKreisDurchmesser, feuerKreisDurchmesser);
   }
  

  
  
  //Streichholz
 
  fill(#FFDA7C);
  float streichholzlaenge = 170;

  rect(feuerposX+feuerbreite/2-feuerKreisDurchmesser/2, feuerposY+feuerhoehe, feuerKreisDurchmesser, streichholzlaenge );
         
         
  stroke(0);
 }
  
