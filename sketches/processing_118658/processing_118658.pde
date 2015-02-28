
// Wobble Circles
// let lines form circle
// lin wenyu  (ken3101462@gmail.com)

void setup() {
  size(600, 600);
    //background(0);
    frameRate(3);
  //noLoop();
}

void draw() {
  background(0); 
  strokeWeight(1); 
  float radius = 100; 
  int centX = 250; 
  int centY = 150; 
//  stroke(0, 30); 
//  noFill(); 
//  ellipse(centX, centY, radius*2, radius*2);

  // draw the filled circle using "shape"
  //stroke(20, 50, 70); 
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  
  float c1=random(255);
  float c2=random(255);
  float c3=random(255);
  beginShape();
  fill(20, 50, 70, 50);
  for (float ang=0; ang<=360; ang+=random(0.1)) { 
    fill(c1,c2,c3);
    
    noiseval += random(2); 
    radVariance=80*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 
    x = centX + (thisRadius * cos(rad)); 
    y = 2*centY + (thisRadius * sin(rad)); 
    curveVertex(x, y);
  }
  endShape(CLOSE);
    
    fill(0, 30);
  noStroke();
  rect(0,0,width,height);
}

// customed noise function
float customNoise(float value) {
  float retValue=pow(sin(value), 3);
  return retValue;
}



