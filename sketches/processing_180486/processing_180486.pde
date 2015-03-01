
float phaseAngle = 0.0;
float phaseAngleIncrement = -5.0;

float samples = 360.0;

color backgroundColor = color(242, 200, 62);
color ringColor = color(67, 115, 60);
color blobColor = color(141, 166, 50);


void setup() {
  size(400, 400);
  frameRate(24);
  smooth(4);

  noFill();
  noStroke();
}

// this function acts like a filter.
// TODO(bbossard) : Replace this with a better behaved filter.
float getRange(float amplification, float rads) {
    float phase = radians(phaseAngle);
    float rangeFilter = map(cos(rads + phase), -1, 1, 0, 1);
    rangeFilter = amplification * pow(rangeFilter, 2.7);
    return rangeFilter;
}

void drawCircle(float amplification, float frequency, float radius){
  float x = 0;
  float y = 0;
  float rad = 0;
  float rangeFilter;
  float angle;
  float perturbation;
  float displacement;
  
  float phase = radians(phaseAngle);
  
  amplification *= cos(2*phase);
  
  beginShape();
  for (int i = 0; i < samples; i++) {
    angle = i / samples * 360;
    rad = radians(angle);

    rangeFilter = getRange(amplification, rad);

    perturbation = cos(frequency * rad + phase);
    
    displacement = radius * (1 + rangeFilter * perturbation);

    x = displacement * cos(rad);
    y = displacement * sin(rad);
    vertex(x, y);
  }
  endShape(CLOSE);
}

void draw() {
  // draw background
  fill(backgroundColor);
  rect(0, 0, width, height);

  pushMatrix();
  translate(width/2, height/2);

  // draw ring
  strokeWeight(5);
  stroke(ringColor);
  noFill();  
  drawCircle(0.05, 30, 120);
  
  // draw blob
  fill(blobColor);
  noStroke();
  drawCircle(0.4, 7, 60);
  
  popMatrix();
  
  phaseAngle += phaseAngleIncrement;
}

