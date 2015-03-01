
float phaseAngle = 360.0;
float phaseAngleIncrement = -2.0;

float samples = 90.0;

color backgroundColor = color(255, 237, 122);
color ringColor = color(255, 255, 255);
color blobColor = color(245, 152, 22);


void setup() {
  size(400, 400);
  frameRate(90);
  smooth(15);

  noFill();
  noStroke();
}

// this function acts like a filter.
// TODO(bbossard) : Replace this with a better behaved filter.
float getRange(float amplification, float rads) {
    float phase = radians(phaseAngle);
    float rangeFilter = map(cos(rads + phase), -1, 1, 0, 1);
    rangeFilter = amplification * pow(rangeFilter, 1);
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
  noStroke();
  fill(ringColor);
  drawCircle(0.035, 10, 150);
  
  // draw blob
  fill(blobColor);
  noStroke();
  drawCircle(0.08, 3, 60);
  
  popMatrix();
  
  phaseAngle += phaseAngleIncrement;
}

