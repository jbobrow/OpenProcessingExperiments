
/*
1030 class wrong way to draw a circle
random filling the canvas
and some of the flower will follow the mouse
press mouse to clear the canvas

by kokfu lok
*/
void setup() {
  size(600, 600);
  //noLoop();
  background(255); 
  frameRate(5);
}

void draw() {
 flower(random(width),random(height),random(15));
  flower(random(width),random(height),random(15));
  flower(mouseX,mouseY,random(255));
 if (mousePressed==true){
    fill(255);
   rect(0,0,width,height);}

  
}
 void flower(float centX,float centY,float color1){
 // strokeWeight(5); 
  float radius = random(50,100); 
  //stroke(0, 30); 
//  noFill(); 
  //ellipse(centX, centY, radius*2, radius*2);
  // draw the filled circle using "shape"
  
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  stroke(20, random(50), 70,random(5,30));
   strokeWeight(random(0.1,3));
  beginShape();
  fill(random(50),30 , color1, random(10));
  for (float ang=0; ang<=360; ang+=1) { 
    noiseval += 1; 
    radVariance=30*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 
    x = centX + (thisRadius * cos(rad)); 
    y = centY + (thisRadius * sin(rad)); 
   
   curveVertex(x, y);
  }
  endShape(CLOSE);

}
// customed noise function
float customNoise(float value) {
  int count = int(value%12);
  float retValue=pow(sin(value), count);
  return retValue;
  }



