
float xPos;
float yPos;
float amplitude;
 
void setup(){
  size(300,300);
  xPos = width/2;
  yPos = height/2;
  amplitude = 100;
  colorMode(RGB, 255);
}
 
void draw(){
  smooth();
  noStroke();
 
  float centerX = 150;
  float amplitudeX = random(1,100.0);
  float amplitudeY = 100.0;
 
 
  xPos = centerX + amplitudeX * sin(millis()*.002);
  yPos = centerX + amplitudeY * cos(millis()*.002);
  fill(xPos,amplitudeX, (sin(millis())*100));
  ellipse(xPos, yPos, 40,20);
}                
