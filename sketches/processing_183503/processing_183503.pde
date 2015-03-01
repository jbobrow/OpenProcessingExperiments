
Whisp[] w             = new Whisp[2];
Ossilator[] ossilator = new Ossilator[2];

float globalX=0, globalY=0;

void setup() {
  size(600, 600);
  stroke(0.01);
  background(255);
  reSet();
}

float a=0;
float xProgresion=0;
float yProgression=30;


void draw() {
  clearTop();

  drawWhisps();

  drawWhispIntercection();

  drawCurveAtTop();
}

void clearTop() {
  fill(255);
  noStroke();
  rect(0, 200, width, height);
  stroke(0);
}
void drawWhisps() {
  pushMatrix();
  translate(width/2, height);
  w[0].render( ossilator[0].getVal() );
  translate( (width/2) *(-1), (height/2)*(-1));
  rotate( radians(90) );  
  w[1].render( ossilator[1].getVal() );
  popMatrix();
}

void drawWhispIntercection() {
  pushMatrix();
  translate(width/2, height/2);
  ellipse(  w[0].getX(), w[1].getX(), 10, 10 );
  popMatrix();
}
void drawCurveAtTop(){
  pushMatrix();
  fill(100, 100, 100, 150);
  noStroke();
  if (xProgresion>width) {
    reSet();
    yProgression+=50;
  }
  translate(xProgresion+=1, yProgression );
  ellipse(  w[0].getX()/4, w[1].getX()/4, 3, 3 );
  popMatrix();
}
void mousePressed() {
  reSet();
}

void reSet() {
  if (yProgression >200) {
    background(255);
    yProgression = 30;
  }
  xProgresion=0;

  for (int i=0;i<w.length;i++) {
    w[i]         = new Whisp(0, 0);
    ossilator[i] = new Ossilator( random(1, 2), random(2, 4), random(0.01, 0.005) );
  }
}


class Whisp {

  float x=0, y=0;
  float len = 0;

  float publicX=0;
  float publicY=0;

  public Whisp(float x, float y) {
    this.x=x;
    this.y=y;
    len = 400;
  } 

  public void render(float a) {
    float localX = this.x;
    float localY = this.y;

    float n=0;
    float n2=0;
    ellipse(localX, localY, 5, 5);

    for (int i=0;i<len;i++) {
      point(localX, localY);

      localY-=( tan( radians(n2+=0.1) ) );
      localX+=( sin( radians(n+=a) ) );
    }
    ellipse(localX, localY, 5, 5);
    publicX = localX;
    publicY = localY;
  }

  public float getX() {
    return publicX;
  }
  public float getY() {
    return publicY;
  }
}

class Ossilator {
  float value=0;
  float max;
  float min;
  float incriments;

  public Ossilator(float min, float max, float incriments) {
    this.max        = max;
    this.min        = min;
    value = min;
    this.incriments = incriments;
  }
  public float getVal() {
    if ( value > max || value < min) {
      incriments*=(-1);
    }
    value+=incriments;
    return value;
  }
}

