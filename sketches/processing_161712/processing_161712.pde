
/*SIDNEY MCADAMS
 ANIMATION PROGRAM:Pulsing Ellipse
 HELP FROM processing.org
 9/16/14*/

float ellipseSize = 300;
float ellipseSize2 = 200;
float ellipseSize3 = 100;
float r = random(255);
boolean pulse = false;
void setup() {
  size(500, 500);
  smooth();
}
void draw() {
  background(random(255));
  fill(r, random(255), -r);
  strokeWeight(20);
  stroke(random(255), -100, r);
  ellipse(width/2, height/2, ellipseSize, ellipseSize);
  fill(r, random(255), -r);
  ellipse(250, 250, ellipseSize2, ellipseSize2);
  fill(r, random(255), -r);
  ellipse(250,250, ellipseSize3, ellipseSize3);

  if (pulse) {
    ellipseSize = ellipseSize + 1.5;
    ellipseSize2 = ellipseSize2 + 1;
    ellipseSize3 = ellipseSize3 + .5;
    if (ellipseSize > 300) {
      if (ellipseSize2 > 200) 
        if (ellipseSize3 > 100)
        pulse = false;
    }
  } else {
    ellipseSize = ellipseSize - 1.5;
    ellipseSize2 = ellipseSize2 - 1;
    ellipseSize3 = ellipseSize3 - .5;
    if (ellipseSize < 250) { 
      if (ellipseSize2 < 100) 
        if (ellipseSize3 < 50) 
        pulse = true;
    }
  }
}



