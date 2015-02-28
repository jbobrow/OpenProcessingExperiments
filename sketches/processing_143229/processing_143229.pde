
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

void setup() {
  size(600, 300);
  smooth();
  background(255);
  frameRate(1);
}

void draw() { 
  background(255);
  
  stroke(0);
  strokeWeight(1);
  // black lines for second and minute
  for(int i=0; i<width; i+=10){
    line(i,100,i,height);
  }
  // black lines for hour
  stroke(0);
  for(int i=0; i<width; i+=25){
    line(i,0,i,100);
  }
  
  noStroke();
  // blue hour bar
  fill(0, 0, hour()*4);  
  rect(0, 0, hour()*25, 100);
  // green minute bar
  fill(0, minute()*4, 0);  
  rect(0, 100, minute()*10, 100);
  // red second bar
  fill(second()*4, 0, 0);
  rect(0, 200, second()*10+10, 100);

  stroke(255);
  strokeWeight(2);
  // white horizontal lines
  line(0,100,width,100);
  line(0,200,width,200);
}


