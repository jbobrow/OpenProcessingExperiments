
float[] spiral;
int divisions = 256;
float meanGap = 6;
float gapNoise = 0;
int index = divisions;
void setup() {
  size(800, 600);
  background(0);
  stroke(255);
  smooth();
  spiral = new float[divisions];
  for (int i=0;i<divisions;i++) {
    spiral[i] = meanGap*i/divisions;
    if (i>0) {
      float startAngle = (i-1)*TWO_PI/divisions;
      PVector start = new PVector(spiral[i-1]*cos(startAngle),spiral[i-1]*sin(startAngle));
      float endAngle = (i)*TWO_PI/divisions;
      PVector end = new PVector(spiral[i]*cos(endAngle),spiral[i]*sin(endAngle));
      line(width/2+start.x,height/2+start.y,width/2+end.x,height/2+end.y);
    }
  }
}
void draw() {
  for(int j=0;j<4;j++){
    stroke(random(127,255),random(127,255),random(127,255));
    gapNoise += 0.7*random(-1,1);
    gapNoise -= 0.02*gapNoise;
    spiral = (float[]) append(spiral,spiral[index-divisions]+meanGap+gapNoise);
    float startAngle = (index-1)*TWO_PI/divisions;
    PVector start = new PVector(spiral[index-1]*cos(startAngle),spiral[index-1]*sin(startAngle));
    float endAngle = (index)*TWO_PI/divisions;
    PVector end = new PVector(spiral[index]*cos(endAngle),spiral[index]*sin(endAngle));
    line(width/2+start.x,height/2+start.y,width/2+end.x,height/2+end.y);
    index++;
  }
}



