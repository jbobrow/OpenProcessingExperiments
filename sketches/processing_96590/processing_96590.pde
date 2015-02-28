
float msc=0;
int minute;
int hour;
void setup() {
  size(800, 800);
  smooth();
}
  
void draw() { 
  int second = second();
  if(!mousePressed){
  minute = minute();
   hour = hour();   
   
  }
  background(0,84,255);
  translate(width / 2, height / 2); 
   
  // clock
  strokeWeight(10);
  fill (0,84,255);
  stroke(255);
  ellipse(0, 0, 500, 500); 
    
  //second needle  
  stroke(0,84,255);
  strokeWeight(20);
  float sy=map(millis(),0,1000,0,10); 
  float radSec = (360 / 60000 *second())+0.6*sy;  
  pushMatrix();
  rotate(radians(radSec));
  line(0, 0, 0, -300);
  popMatrix();
   
   
    
  // minute needle  
  stroke(0,84,255);
  strokeWeight(50);
  float radMin = 360 / 60 * minute;
  pushMatrix();
  rotate(radians(radMin));
  line(0, 0, 0, -300);
  popMatrix();
    
  // hour minute 
  strokeWeight(80);
  float radHour = 360 / 12 * hour;
  pushMatrix();
  rotate(radians(radHour));
  line(0, 0, 0, -300);
  popMatrix(); 
    
}
void mouseDragged(){
  minute=(mouseX*2);
  hour=(mouseX*2)/60;
}
