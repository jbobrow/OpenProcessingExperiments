
float div = 4;
Fmath fMath = new Fmath();
float step;

final float stepZ = 25;
final int depth=-200;
Boolean stroked=false;
final int radius = 170;

void setup() {
  size(400, 400, P3D);
  colorMode(HSB);
  background(0 );
  noStroke();
}

void draw() {
  background(0);
  //lights();
  step = PI/div;
  translate(width/2, height/2, 0);
    beginShape(TRIANGLE_STRIP);
  for (int i=depth;i<200;i+=stepZ) {
    float x1 = sin(i*0.02+frameCount*0.1)*50;
    float x2 = sin((i+stepZ)*0.02+frameCount*0.1)*50;
    drawStripe(x1, x2, i, stepZ);
  }
  endShape();
  //saveFrame("###.png" );
  text(frameRate, 0, 0);
}

void drawStripe(float x1, float x2, float z, float w/*width*/) {

  float r1 = map(z, depth, 200, 50, 170);
  float r2 = map(z+w, depth, 200, 50, 170);
  for (float i=0;i<TWO_PI; i+=step) {
    float x = fMath.cosine(i)*r1;
    float y = fMath.sine(i)*r1;
    x+=x1;
    fill(map(z, depth, 250, 0, 255), 255, 255);
    vertex(x, y, z);
    x = fMath.cosine(i)*r2;
    y = fMath.sine(i)*r2;
    x+=x2;
    fill(map(z+w, depth, 250, 0, 255), 255, 255);
    vertex(x, y, z+w);
    x = fMath.cosine(i+step)*r1;
    y = fMath.sine(i+step)*r1;
    x+=x1;
    fill(map(z, depth, 250, 0, 255), 255, 255);
    vertex(x, y, z);
    x = fMath.cosine(i+step)*r2;
    y = fMath.sine(i+step)*r2;
    x+=x2;
    fill(map(z+w, depth, 250, 0, 255), 255, 255);
    vertex(x, y, z+w);
  }
}

void keyPressed() {
  if (key=='s') {
    stroked=!stroked;
    if (stroked) stroke(200); 
    else noStroke();
  }

  if (key=='q')  div++;
  if (key=='a') {
    if (div!=2)  div--;
  }
}

class Fmath {
  int cant = 360/4;
  float []cosineVals = new float[cant];
  float []sineVals = new float[cant];
  float []tangVals = new float[cant];
  float step= TWO_PI/cant;

  public Fmath() {
    for (int i=0;i<cant;i++) {
      cosineVals[i]=cos(step*i);
      sineVals[i]=sin(step*i);
      tangVals[i]=tan(step*i);
    }
  }

  private int rightAngle(float val) {
    if (val>=TWO_PI) {
      val-=TWO_PI*floor(val/TWO_PI);
      if (val>TWO_PI) val=TWO_PI;
    }
    return floor(map(val, 0, TWO_PI, 0, cant-1));
  }

  public float cosine(float val) {
    return cosineVals[rightAngle(val)];
  }
  public float sine(float val) {
    return sineVals[rightAngle(val)];
  }
  public float tang(float val) {
    return tangVals[rightAngle(val)];
  }
}



