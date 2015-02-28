
float xPos;
float yPos;
float amplitude;
 
void setup(){
  size(300,300);
  background(000);
  xPos = width/2;
  yPos = height/2;
  amplitude = 100;
}
 
void draw(){
  smooth();
  stroke(0,0,0,50);
  fill (255, 255, 255, 250);
  rect (0, width, 0, height);
 
  float centerX = 150;
  float amplitudeX = 100.0 ;
  float amplitudeY = 100.0 ;
  float periodX = 0.003;
  float periodY = periodX ;
 
 
  xPos = centerX + amplitudeX  * sin(millis()*periodX-1);
  yPos = centerX + amplitudeY  * cos(millis()*periodY);
  
  for (int time = 1; time < 20 ; time ++){
    
  xPos = xPos + time*2;
  yPos = yPos + time*2;
  
  fill (255/time, 255/time, 255/time);
  ellipse(xPos/time, yPos/time, 30/time,30/time);
  }  
}

                
