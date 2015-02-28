
int numFrames = 64*4;

void setup() {
  size(400, 400);
  frameRate(60);

  smooth(8);
  colorMode(HSB);

  vectorField = new PVector[(width*2/vectorSpacing)][(height*2/vectorSpacing)];

  background(249);
  for (int i=0; i<height*2/vectorSpacing; i++) {
    for (int j=0; j<width*2/vectorSpacing; j++) {
      toCenter = new PVector(width/2, height/2);
      toCenter.sub(new PVector(-width/2+j*vectorSpacing+vectorSpacing/2, -height/2+i*vectorSpacing+vectorSpacing/2));

      vectorField[j][i] = toCenter;
      vectorField[j][i].normalize();
    }
  }
  fill(255, 255, 255);
}

void draw() {
  sample();
}

PVector vectorField[][], toCenter;
int vectorSpacing = 40;

float animFrame, a, colour;
void sample() {  
  noStroke();
  fill(249, 77);
  rect(0, 0, width, height);

  animFrame = (frameCount%(numFrames)+1);
  a = animFrame/(numFrames)*TWO_PI;

  pushMatrix();
  strokeWeight(2);
  translate(width/2, height/2);
  //if (degrees(a) < 360)
  //rotate(-a);
  for (int i=0; i<height*2/vectorSpacing; i++) {
    for (int j=0; j<width*2/vectorSpacing; j++) {



      colour = map(sin(a+atan2(vectorField[j][i].y, vectorField[j][i].x)), -1, 1, 0, 255);
      stroke(colour, 255, 154);
      pushMatrix();
      translate(-width+vectorSpacing*j+vectorSpacing/2, -height+vectorSpacing*i+vectorSpacing/2);
      rotate(atan2(vectorField[j][i].y, vectorField[j][i].x));
      //if (degrees(a) >= 360)
      //rotate(-a);
      //else
      rotate(a);
      line(0, 0, 8, 8);
      //fill(255,255,255);
      //ellipse(0,0,5,5);
      popMatrix();
    }
  }
  popMatrix();
}

