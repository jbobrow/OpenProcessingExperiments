
void setup ()
{
 size(500,700); 

}



void draw()
{
 
  background (255);
  

  
  if (mousePressed == true )
  {
    
     zeichneStreichholz(mouseX -25, mouseY -225, 50, 150, 0.8);
  }
  else
  {
  zeichneStreichholz(mouseX -25, mouseY -225, 50, 150, 0);
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
       textSize(10);
       text("Feuer", (feuerposX+feuerbreite/2+verschiebungX)-13 , feuerposY+verschiebungY);//, feuerKreisDurchmesser, feuerKreisDurchmesser);
       //ellipse(feuerposX+feuerbreite/2+verschiebungX , feuerposY+verschiebungY, feuerKreisDurchmesser, feuerKreisDurchmesser);
      
    
     }
     
      if(transparenz == 0)
      {   
        fill(#FF0303);
      }
      else
      {
        fill(color(224,60,0));
      }
      
      textSize(8);
      text("KOPF", (feuerposX+feuerbreite/2)-10, feuerposY +feuerhoehe, feuerKreisDurchmesser, feuerKreisDurchmesser);
      
      //ellipse(feuerposX+feuerbreite/2, feuerposY +feuerhoehe, feuerKreisDurchmesser, feuerKreisDurchmesser);
      
   }
  

  
  
  //Streichholz
 
  
  fill(#FFDA7C);
  
    rotate(-PI/2);

  float streichholzlaenge = 170;

  textSize(20);
  
  
  text("STREICHHOLZ", -feuerposY-2*feuerhoehe, (feuerposX+feuerbreite/2-feuerKreisDurchmesser/2)+16); //, feuerKreisDurchmesser, streichholzlaenge);
  //rect(feuerposX+feuerbreite/2-feuerKreisDurchmesser/2, feuerposY+feuerhoehe, feuerKreisDurchmesser, streichholzlaenge );
         
    rotate(PI/2);
         
  stroke(0);
 }
  
