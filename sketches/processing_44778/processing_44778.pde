
// a flower
// adopted from Pearson (2011), pp.73-74
// schien@mail.ncku.edu.tw

// set the radius and center point
float radius = 100; 
int centX = 250; 
int centY = 150; 

void setup() {
  size(500,300); 
  background(255); 
  strokeWeight(5); 
  smooth();
  noLoop();

  // draw the circle for reference
  stroke(0, 30); 
  noFill(); 
  ellipse(centX,centY,radius*2,radius*2);
}

void draw() {
  // refresh
  background(255);

  strokeWeight(1);

  // repeat a number of times
  float layers = random(5,10);
  for (int i=0;i<layers;i++) {
    // randomize the radius
    radius = random(200);

    // draw the filled circle using "shape"
    stroke(20, 50, 70); 
    float x, y; 
    float noiseval = random(10);
    float radVariance, thisRadius, rad;
    beginShape();
    //fill(20, 50, 70, 50);
    fill(200, 200, 200, 50);
    for (float ang=0; ang<=360; ang+=1) { 
      noiseval += 0.1; 
      //radVariance = 30*customNoise(noiseval);
      radVariance = 30*customNoiseB(noiseval);
      thisRadius = radius+radVariance; 
      rad = radians(ang);                                   
      x = centX + (thisRadius * cos(rad)); 
      y = centY + (thisRadius * sin(rad)); 
      curveVertex(x,y);
    }
    endShape();
  }
}

float customNoise(float value) {
  float retValue = pow(sin(value), 3);
  return retValue;
}

float customNoiseB(float value) {
  int count = int(value%12);
  float retValue = pow(sin(value),count);
  return retValue;
}


void mousePressed() {
  redraw();
  saveFrame("circle####.png");
}


