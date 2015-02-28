
float xPos;
float yPos;
float amplitude;
void setup() {
  size(800, 800);
}
void draw() {
  smooth();
//  background(255);
  
  for (int i=1;i<500;i++) {
    
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));

    float centerX=width/2;
    float amplitudeX=25+i*2;
    float amplitudeY=10*i*2;
    float periodX=0.0007;
    float periodY=periodX*i/40.0;
    xPos=centerX+amplitudeX*sin(millis()*periodX);
    yPos=centerX+amplitudeY*cos(millis()*periodY);

    ellipse(xPos, yPos, 20, 20);
  }
}

                
