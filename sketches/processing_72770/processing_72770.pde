
int lineColor;
float ellSize;
float lineSize;

void setup(){
  size(600,500);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(360);
  lineColor = 0;
  ellSize = 0;
  lineSize =1;
  
}

void draw(){
   stroke(ellSize/2, random(360), random(360), 20); 
   line(ellSize, 0, ellSize, height);
  if(mousePressed){
  lineColor += 1;
  stroke(random(lineColor), random(lineColor), random(lineColor), 50);
  line(mouseX, mouseY, pmouseX, pmouseY);
  ellSize++;
  strokeWeight(++lineSize);
  if(lineSize > 10){
    lineSize = 1;
  }
  if(ellSize > 600){
    ellSize = 0;
}
  }
}

