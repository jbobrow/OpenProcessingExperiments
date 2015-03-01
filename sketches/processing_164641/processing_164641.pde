
int width = 800;
int height = 800;
int sSize = 250;
int mSize = 175;
int hSize = 75;

void setup() {
  background(#000000);
  size(width, height);
  smooth();
}


void draw() {
  float s = map(second(), 0, 59, 0, 360);  
  float h = map(hour(), 0, 24, 0, 360);
  float m = map(minute(), 0, 59, 0, 360);
  background(#000000);
  float sLineAngle = map(second(), 0, 60, 0, 360);
  float mLineAngle = map(minute(), 0, 60, 0, 360);
  float hLineAngle = map(hour()%12, 0, 12, 0, 360);


  // night or day

  if (hour() >= 19 && hour() <= 7) {
    // night
    background(0);
    fill(255);
    ellipse(110,100,75,75);
    ellipse(600,40,5,5);
    ellipse(300,787,5,5);
    ellipse(87,490,5,5);
    ellipse(150,700,5,5);
    ellipse(750,720,5,5);
    ellipse(721,250,5,5);
    ellipse(10,390,5,5);
  }
  else {
    background(92,152,240);
    ellipse(680,100,75,75);
  }



  // base second() flower
  pushMatrix();
  strokeWeight(40);
  translate(width/2, height/2);
  for (int i = 0; i < 60; i++) {
    stroke(int(random(230,260)),167,167,100);
    float sLineAngleBase = (360/60);
    line(0, 0, sSize*cos(radians(sLineAngleBase*i)), sSize*sin(radians(sLineAngleBase*i)));
  }
  popMatrix();

  // second hand
  pushMatrix();
  stroke(255,255,255,50);
  translate(width/2, height/2);
  rotate((3*PI)/2);
  line(0, 0, sSize*cos(radians(sLineAngle)), sSize*sin(radians(sLineAngle)));
  popMatrix();

  // base minute() flower
  pushMatrix();
  strokeWeight(40);
  translate(width/2, height/2);
  for (int i = 0; i < 60; i++) {
    float mLineAngleBase = (360/60);
    stroke(int(random(220,240)),167,167,60);
    line(0, 0, mSize*cos(radians(mLineAngleBase*i)), mSize*sin(radians(mLineAngleBase*i)));
  }
  popMatrix();

  // minute hand
  pushMatrix();
  stroke(255,255,255,50);
  translate(width/2, height/2);
  rotate((3*PI)/2);
  line(0, 0, mSize*cos(radians(mLineAngle)), mSize*sin(radians(mLineAngle)));
  popMatrix();

  // base hour() flower
  pushMatrix();
  strokeWeight(40);
  translate(width/2, height/2);
  for (int i = 0; i < 12; i++) {
    float hLineAngleBase = (360/12);
    stroke(255,255,255,40);
    line(0, 0, hSize*cos(radians(hLineAngleBase*i)), hSize*sin(radians(hLineAngleBase*i)));
  }
  popMatrix();

  // hour hand
  pushMatrix();
  stroke(255,255,255,90);
  translate(width/2, height/2);
  rotate((3*PI)/2);
  line(0, 0, hSize*cos(radians(hLineAngle)), hSize*sin(radians(hLineAngle)));
  popMatrix();
}

