
float xPos;
float yPos;
float amplitude;
float r=random(0, 255);
float g=random(0, 255);
float b=random(0, 255);
 
void setup(){
  size(300,300);
  xPos = width/2;
  yPos = height/2;
  amplitude = 100;
}
 
void draw(){
  smooth();
  //background(127;
  
  float centerX = 150;
  float amplitudeX = 100.0;
  float amplitudeY = 100.0;
  float periodX = 0.003;
  float periodY = periodX * 3;
 
  xPos = centerX + amplitudeX * sin(millis()*periodX/2);
  yPos = centerX + amplitudeY * cos(millis()*periodY);
  line(xPos, yPos, 30,20);
}

