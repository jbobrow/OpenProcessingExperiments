
float xPos, yPos;

void setup () {
  size (800, 800);
  xPos=width/2;
  yPos=0;
  smooth();
}

void draw () {
  background (100);
  for (int i=1; i<50; i++) {
    float centerX=400;
    float amplitudeX=90+i*mouseX/100;
    float amplitudeY=50.0+i*3;
    float periodX=0.003;
    float periodY=periodX*i/40.0;
    float rx=random (20, 25);

    xPos=centerX +amplitudeX*sin(millis()*periodX);
    yPos=centerX +amplitudeY*cos(millis()*periodY);
    
    colorMode (HSB, 100);
    fill (random (20, 80),mouseY/8, 100);
    //    fill ((mouseY/100)*255, (mouseY/100)*random(100, 150), random (80, 120));
    rect (xPos, yPos, rx, rx);
    fill (100,5);
    rect (0, 0, 800, 800);
  }
}      
                
