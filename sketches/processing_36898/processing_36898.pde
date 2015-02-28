
float xPos; 
float yPos;

void setup() {
  size (500, 500);
  smooth();
  xPos = width;
  yPos = height;
  colorMode (HSB, 100);
}

void draw () {
  noStroke();
  float centerX = 0.85*(width/2) + .15*mouseX;
  float amplitudeX = 5+mouseX/2;
  float amplitudeY = 10+mouseY/2;
  float periodX = .001456;
  float periodY = .002;

  float rr = random (0, 50);
  float rg = random (0, 100);
  float rb = random (50, 100);

  xPos = centerX + amplitudeX*sin(millis()*periodX); // xPos = center point + amplitude(width of sin wave)*sin(millis()*period);
  yPos = centerX + amplitudeY*cos(millis()*periodY); 
  rect (xPos, yPos, 10+mouseX/10, 10+mouseY/10);
  fill (rr, rg, rb);




  if (xPos > width) {
    xPos = 0;
  }
  if (yPos>height) {
    yPos = 0;
  }
}
              
                                
