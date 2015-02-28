
// Flowering Flowers
// random flowers
// lin wenyu  (ken3101462@gmail.com)

void setup() {
  size(600, 600);
  frameRate(3);
  background(0); 
  //noLoop();
}

void draw() {

  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);

  strokeWeight(5); 
  float x1=random(600);
  float y1=random(600);
  float radius1=random(50, 100);

  float s=second();
  float posx=random(10);
  float posy=random(10);

  //pushMatrix();
  //translate(posx, posy);
  //rotate(PI/60*s);
  drawFlowers(radius1, x1, y1);
  //popMatrix();
}

// flowers
void drawFlowers(float radius, float centX, float centY) {

  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;

  float c1=random(240, 245);
  float c2=random(165, 190);
  float c3=random(230, 240);


  float s=second();
  float posx=centX-radius*random(1,2);//
  float posy=centY-radius*random(1,2);//

  pushMatrix();
  //translate(posx, posy);
  //rotate(PI/60*s);
  beginShape();
  for (float ang=0; ang<=360; ang+=1.15) { 
    noStroke();
    fill(c1, c2, c3);

    noiseval += .1; 
    radVariance=90*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 

    x = centX + (thisRadius * cos(rad)/3); 
    y = centY + (thisRadius * sin(rad)/3); 
    curveVertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}

float customNoise(float value) {
  float retValue=pow(sin(value), 3);
  return retValue;
}

void mousePressed() {
  redraw();
  saveFrame("circle####.png");
}



