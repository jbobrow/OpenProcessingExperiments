
/* draw a circle in wiggle shapes
 base code from Proh. Nick.
 reference:web and classmates in this program
 project:flower
 by juichi lin
 */

void setup() {
  size(500, 500);
  frameRate(8) ;
  background(138, 206, 168);
}

void draw() {
  int s=second();
  if (s<=5) {
    background(138, 206, 168);
    strokeWeight(random(2));
    fill(138, 206, 168);
    flower(random(width), random(height));
    flower(random(width)-2, random(height)-2);
    flower(random(width)-4, random(height)-4);
  }
  if (s<=10) {
    background(236, 232, 133);
    strokeWeight(random(2));
    fill(199, 77, 92);
    flower(random(width), random(height));
    flower(random(width)+2, random(height)+2);
    flower(random(width)+4, random(height)+4);
  }
  if (s<=15) {
    background(232, 187, 97);
    strokeWeight(random(2));
    fill(30, 49, 73);
    flower(random(width), random(height));
    flower(random(width)-2, random(height)-2);
    flower(random(width)-4, random(height)-4);
  }
  if (s<=25) {
    background(77,73,55);
    strokeWeight(random(2));
    fill(255);
    flower(random(width), random(height));
    flower(random(width)+2, random(height)+2);
    flower(random(width)+4, random(height)+4);
  }
  if (s>=30) {
    //background(0);
    strokeWeight(random(2));
    fill(255);
    flower(random(width), random(height));
    flower(random(width)+2, random(height)+2);
    flower(random(width)+4, random(height)+4);
  }
}


void flower(float A, float B) {  
  float radius = random(10, 100); 

  stroke(random(20, 200)); 
  //noFill();
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  beginShape();
  noFill();
  //fill(20, 50, 70, 50);
  for (float ang=0; ang<=360*5; ang+=5) { 
    noiseval += 0.2; 
    radVariance=random(30, 70)*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 
    x = A+(noise(100))+ (thisRadius * cos(rad)); 
    y = B+(thisRadius * sin(rad)); 
    curveVertex(x, y);
  }
  endShape(CLOSE);
}

// customed noise function
float customNoise(float value) {
  float retValue=pow(sin(value), 3);
  return retValue;
}



