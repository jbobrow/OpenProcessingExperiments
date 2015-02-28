
int step = 12;
float startSize, startHue, startSat, startAngle, endAngle, rotateAngle, lineHue;
float x1,y1,x2,y2, rainbow;

void setup(){
  size(250,250);
  smooth();
  colorMode(HSB, 2*PI, 100, 100);
}

void draw(){
  background(0,0,20);
 
  rotateAngle = atan2(mouseY-height/2, mouseX-width/2);
  startAngle = rotateAngle - PI/step;
  endAngle = rotateAngle + PI/step;
  startHue = rotateAngle+PI;
  startSize = 200;
  startSat = 95;
  lineHue = 0;
  
  translate(width/2, height/2);
  
  for(int j=0; j<1500; j++){
  rainbow = lineHue + PI;
  x1 = 102 * cos(rainbow);
  y1 = 102 * sin(rainbow);
  x2 = 122 * cos(rainbow);
  y2 = 122 * sin(rainbow);
  
  stroke(lineHue, 100, 90);
  line(x1, y1, x2, y2);
  
  lineHue = lineHue + TWO_PI/1500;
  }
     
  for(int i=0; i<step; i++){
    stroke(0,0,20);
    fill(startHue, startSat, 100);
    arc(0, 0, startSize, startSize, startAngle, endAngle);
    startSize = startSize - 240/step;
    startSat = startSat - 120/step;
  }
  
}
    
    
  

