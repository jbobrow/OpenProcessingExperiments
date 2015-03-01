
public class LiveCircle
{
  int dotNumbers;      // The amount of ellipces
  
  float k;             // Angle between dots
  float freq;          // Frequency of Radius
  float phi;           // The amount of shifting
  float phiShift;      // Speed of change phi

  float Amp;          // Amplitude of the radius
  float AmpShift;     // Speed of chang Amp
  float AmpMax;       // Max Amplitude
  
  // Create Live Circle.
  LiveCircle(int dotNum, float AM, float ph)
  {
    dotNumbers = dotNum;
    k = 2*PI/dotNumbers;
    freq = 5;
    phi = 0;
    phiShift = ph;

    AmpMax = AM;
    Amp = AmpMax;
    AmpShift = -0.3;
    
    phiCount = 0;
    AmpCount = 0;
    FrqCount = 0;

  }
  
  void Draw(color col)
  {
    fill(col);
    float R;
    for (int i = 0; i < dotNumbers; i++)
    {
      R = Amp*sin(freq *i*k + phi) + 200;                            // Radius is not constatnt. It is sine;
      ellipse(R*cos(i*k) + width/2 , height/2 - R*sin(i*k), 4, 4);   // Create circle with sine Radius
    }  
  
    phi += phiShift;                                                  // Move Radius
    
    Amp = Amp + AmpShift;                                            // Change amplitude of radius

    if ( Amp > AmpMax || Amp < -AmpMax)                              // If Amplitude is maximum 
    {
       AmpShift = -AmpShift;                                         // flip the value
    }
    
    PhiChecked();                                                    // Check shifting
    AmpChecked();                                                    // Check Amplitude
    FrqChecked();                                                    // Check Freq
  }
 
   
   

   int phiCount;
   void PhiTrig()
   {
       phiCount = 90;                                               // change phiCount
   }
   
   void PhiChecked()
   {
     //if phiCount > 0, change phiShift value
     
     if (phiCount > 60)                                              
     {
         phiShift = 0.2 * ((phi > 0) ? 1 : -1);
     }
     else if (phiCount > 30)
     {
        phiShift = 0.5* ((phi > 0) ? 1 : -1);
     }
     else if (phiCount > 15)
     {
        phiShift = 0.2* ((phi > 0) ? 1 : -1);
     }
     else if (phiCount > 0)
     {
        phiShift = 0.05* ((phi > 0) ? 1 : -1);
     }
     phiCount--;
   }
   
   // Other function same 
   
   
   int AmpCount;
   void AmpTrig()
   {
       AmpCount = 90;
   }
   
   void AmpChecked()
   {
     if (AmpCount > 60)
     {
         AmpShift = 1 * ((AmpShift > 0) ? 1 : -1);
     }
     else if (AmpCount > 30)
     {      
        AmpShift = 1.5 * ((AmpShift > 0) ? 1 : -1);
     }
     else if (AmpCount > 15)
     {
        AmpShift = 1 * ((AmpShift > 0) ? 1 : -1);
     }
     else if (AmpCount > 0)
     {
        AmpShift = 0.3 * ((AmpShift > 0) ? 1 : -1);
     }
     AmpCount--;
   }
   
   
   
   
   int FrqCount;
   void FrqTrig()
   {
       if (FrqCount < 0)
       {
         FrqCount = 90;
       }
   }
   
   void FrqChecked()
   {
     
     if (FrqCount > 45 && FrqCount % 5 == 0)
     {
         freq ++;
         
     }

     else if (FrqCount > 0 && FrqCount % 5 == 0)
     {
        freq -- ;
     }
     FrqCount--;
   }
   
   
}
   
  

