
float xPos;
float yPos;

void setup () {
  size (300, 300);
  xPos = width/2;
  yPos = 0;
}

void draw () {
  smooth ();
  //background (#E2FA86); 

    float centerX = 150; 
    float amplitudeX = 100;
    float amplitudeY = 100;
    float periodX = 0.003;
    float periodY = periodX * 3;

    xPos = centerX + amplitudeX * sin(millis()*periodX);
    yPos = centerX + amplitudeY * cos(millis()*periodY);


    fill (#50B1F0);
    
    ellipse (yPos, xPos, 10, random(0,20));
    fill (#D450F0);
    ellipse (yPos, xPos+50, random(0,10), 10);
    
    fill (#5069F0);
    ellipse (xPos, yPos, random (0, 10), random (0, 20)); 
    
  }

                
                                
