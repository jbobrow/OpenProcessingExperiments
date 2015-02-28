

sinWave w1;
cosWave w2;

// always positive
sinWave w3;
cosWave w4;

// time starts from 0
sinWave w5;
cosWave w6;

tanWave t1;
tanWave t2;

sawWave s1;
sawWave s2;

ArrayList<Circle> facePoints;

float frequency = 0.05;
float frequencyL = 0.1;
float time = PI/2;
float timeO = 0;
float amplitude = 10;
float offset = 0;
float offsetP = 5;

int directionX = 1;
int directionY = 1;

int timeSec;

void setup() {
  size(700,700);
  smooth();
  
  w1 = new sinWave(time, frequency, amplitude, offset);
  w2 = new cosWave(time, frequency, amplitude, offset);
  
  w3 = new sinWave(time, frequencyL, amplitude, offsetP);
  w4 = new cosWave(time, frequencyL, amplitude, offsetP);

  w5 = new sinWave(timeO, frequency, amplitude, offset);
  w6 = new cosWave(timeO, frequency, amplitude, offset);
  
  t1 = new tanWave(time, frequencyL, amplitude, offset);
  t2 = new tanWave(timeO, frequencyL, amplitude, offset);
  
  s1 = new sawWave(time, frequencyL, amplitude, offsetP);
  s2 = new sawWave(timeO, frequencyL, amplitude, offsetP);
  
  facePoints = new ArrayList<Circle>();



  mouthHeight = height/7;
  

  // spider
  for (int i=0; i<50; i++) {
    float x = random(width/2-10, width/2+10);
    float y = random(height/2-10, height/2+10);
    facePoints.add(new Circle(x, y, 1));
  }  
}

float w1v, w2v, w3v, w4v, w5v, w6v, t1v, t2v, s1v, s2v;

void draw() {
  background(0);
  
  w1v = w1.run();
  w2v = w2.run();
  w3v = w3.run();
  w4v = w4.run();
  w5v = w5.run();
  w6v = w6.run();
  t1v = t1.run();
  t2v = t2.run();
  s1v = s1.run();
  s2v = s2.run();
  
  // second  
  timeSec = int(frameCount/60);

  stageOne();
  rightEyeScale = (abs(w2v)+1)*5;
  leftEyeScale = abs(w1v)*3;
  
  // show frame rate
  fill(255);
  text(int(frameRate), 20, 20);
  text(timeSec, width-50, 20);
  
  if (timeSec >= 20)
    stageTwo();

}

float leftEyeChange = 0;
float leftEyeScale;
float rightEyeChange = 0;
float rightEyeScale;
float mouthHeight;
float mouthWeight = 0;

void stageOne() {
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  
  if (timeSec>10 && timeSec<21) {
    leftEyeChange = lerp(leftEyeChange, w4v*5, 0.1);
    
    mouthHeight = lerp(height/7, height/4, 0.1);
    rightEyeChange = lerp(rightEyeChange, PI, 1);
    rightEyeScale = lerp(rightEyeScale, (abs(w2v)+1)*8, 1);
    leftEyeScale = lerp(leftEyeScale, abs(w1v)*6, 1);
    mouthWeight = lerp(0, 100, 0.5);
  }
  
  
  if (timeSec>21 && timeSec<35) {
    leftEyeChange = random(w2v*5);
    
    mouthHeight = random(-10,10);
    rightEyeChange = lerp(PI, -PI, 1);
    rightEyeScale = lerp((abs(w2v)+1)*8, (abs(w2v)+1)*4, 1);
    leftEyeScale = lerp(abs(w1v)*6, abs(w1v)*3, 1);
    mouthWeight = lerp(100, 500, 1);
  }
  
  if (timeSec>35 && timeSec<40) {
    mouthHeight = lerp(mouthHeight, height/7, 0.1);
    mouthWeight = lerp(500, 50, 0.1);
  }
  
  if (timeSec>40 && timeSec<50) {
    leftEyeChange = lerp(0, w4v*5, 0.1);
    
    mouthHeight = lerp(height/7, height/3, 0.5);
    rightEyeChange = lerp(0, PI, 1);
    rightEyeScale = lerp((abs(w2v)+1)*4, (abs(w2v)+1)*8, 0.5);
    leftEyeScale = lerp(abs(w1v)*3, abs(w1v)*6, 0.5);
    mouthWeight = lerp(mouthWeight, 100, 0.5);
  }
  
    if (timeSec>50) {
    leftEyeChange = lerp(w4v*5, w4v*7, 0.5);
    
    mouthHeight = lerp(height/3, height/2, 0.5);
//    rightEyeChange = lerp(PI, PI/2*3, 1);
    rightEyeScale = lerp((abs(w2v)+1)*8, (abs(w2v)+1)*12, 0.5);
    leftEyeScale = lerp(abs(w1v)*6, abs(w1v)*10, 0.5);
    mouthWeight = lerp(mouthWeight, 150, 0.1);
  }
  
  // mouth
  fill(255,18,145);
  triangle(w3v*3+rightEyeChange+mouthWeight, w1v+height/8, 
           -w3v*3+rightEyeChange-mouthWeight, w2v+height/8, 
           w4v+rightEyeChange, w4v+mouthHeight);

  
  // nose
  fill(255);
  ellipse(w1v, w2v+leftEyeChange, w1v, w1v);

  
  // left eye
  fill(0,255,255);
  rectMode(CENTER);
  rect(width/4+leftEyeChange, 0, leftEyeScale, leftEyeScale);
  
  
  // eyebrows
  fill(150);
  rect(width/4-leftEyeChange, -(height/4+w6v)+rightEyeChange*6, w3v*4, w4v/2);
  rect(-width/4+leftEyeChange, -(height/4+w6v)+leftEyeChange*5, w4v*4, w3v/2);
  
  
  // right eye
  fill(211,255,70);
  arc(-width/4+leftEyeChange/2, 0, rightEyeScale, rightEyeScale, 
      PI/4, w2v-rightEyeChange, PIE);
//  if (timeSec>10) {
//    leftEyeChange = lerp(0, w2v*5, 0.5);
//    rightEyeChange = lerp(0, PI, 1);
//  }
  
  popMatrix();
  
  if (timeSec >= 20)
    stageTwo();
}



float strokeW = 0.01;

// 20" spider shows up, 30" p disgusts at spider
void stageTwo() {
  
  // golden spider
  if (strokeW<0.3)
    strokeW += 0.001;
    
  strokeWeight(strokeW);
  stroke(255,255,0);
  noFill();
  beginShape();
  
  for(int i=0; i<facePoints.size(); i++) {
    //fill((int)random(240,250), (int)random(245,255), (int)random(0,40), 50);
    vertex(facePoints.get(i).loc.x, facePoints.get(i).loc.y);
    
    if (i%3 == 0) {
      facePoints.get(i).update(w1v, w2v);
    } else if (i%3 == 1) {
      facePoints.get(i).update(w3v, w4v);
    } else {
      facePoints.get(i).update(w5v, w6v);
    }
    
    facePoints.get(i).detectEdge(0, width, 0, height);
    facePoints.get(i).detectEdge(sV, sV);
  }
  endShape();
  
  
  if (timeSec >= 35)
    stageThree();
}








float sV, sV2, sV3;

// 45" bully spider HIGH -> end
void stageThree() {
  // bad_rect
  strokeWeight(1);
  stroke(96,255,18);
  noFill();
  rectMode(CORNER);
  sV = w1.run()*50;
  sV2 = t1.run()*50;
  sV3 = w6.run()*50;
  rect(0, 0, sV, sV);
  rect(0, 0, sV+5, sV+5);
  
  if (timeSec >= 40) {
    rectMode(CORNERS);
    rect(width, height, width-sV/8, height-sV/8);
  }
  
  if (timeSec >= 40) {
    rectMode(CORNERS);
    rect(width, height, width-sV, height-sV);
  }
  
  if (timeSec >= 45) {
    rect(width, 0, width-sV3, sV3);
  }
  
  if (timeSec >= 50) {
    rect(0, height, sV2/5, height-sV2/7);
  }
}

class Circle {
  PVector loc;
  float radius;
  int change;


  Circle(float x, float y, float r) {
    loc = new PVector(x, y);
    radius = r;
    change = 1;
  }

  void display() {
    noStroke();
    fill(200);
    ellipse(loc.x, loc.y, radius, radius);
  }

  void update(float _x, float _y) {
    loc.x += _x * change;
    loc.y += _y * change;
  }
  
  void detectEdge(float x1, float x2, float y1, float y2) {

    if (loc.y >= y2 || loc.y < y1 || loc.x >= x2 || loc.x < x1)
      change *= -1;
  }
  
  void detectEdge(float x1, float y1) {

    if (loc.y < y1 && loc.x < x1){
      loc.y = y1+5;
      loc.x = x1+5;
      change *= -1;
    }
  }
}


class Wave{
  
  float time, frequency, amplitude, offset;

  Wave(float _time, float _frequency, float _amplitude, float _offset){
    time = _time;
    frequency = _frequency;
    amplitude = _amplitude;
    offset = _offset;
  }
  
  float run(){
    time += frequency;
    return sin( time ) * amplitude + offset;
  }

}

class sinWave extends Wave {
  sinWave(float time, float frequency, float amplitude, float offset) {
    super(time, frequency, amplitude, offset);
  }
  
  float run() {
    time += frequency;
    return sin( time ) * amplitude + offset;
  }
  
}

class cosWave extends Wave {
  cosWave(float time, float frequency, float amplitude, float offset) {
    super(time, frequency, amplitude, offset);
  }
  
  float run() {
    time += frequency;
    return cos( time ) * amplitude + offset;
  }
  
}

class tanWave extends Wave {
  tanWave(float time, float frequency, float amplitude, float offset) {
    super(time, frequency, amplitude, offset);
  }
  
  float run() {
    time += frequency;
    return tan( time ) * amplitude + offset;
  }
  
}


class sawWave extends Wave {
  float m;
  
  sawWave(float time, float frequency, float amplitude, float offset) {
    super(time, frequency, amplitude, offset);
    
    m = (amplitude+offset)/TWO_PI;
  }
  
  float run() {
    time += frequency;
    return ( time%TWO_PI) * m;
  }
  
}


