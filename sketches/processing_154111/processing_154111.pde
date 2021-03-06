
Ripple[] r = new Ripple[10];

int t = 0;
int ripplePtr=0;
void setup() {
  size(700, 400);
  background(255);
  smooth();
}

void draw() {
  t++;
noStroke();
  fill(255, 255, 255, 10);
  rect(0, 0, width, height);

  for (int i=0;i<r.length;i++) {
    if (r[i] !=null) {
      r[i].render();
    }
  }

  if (t==1000) {
    t=0;
    newRipple(random(0, width), random(0, height));
  }
}

void mousePressed() {
  t=0;
  newRipple(mouseX, mouseY);
}

void newRipple(float x, float y) {
  if (ripplePtr > r.length-2) {
    ripplePtr=0;
  }
  else {
    ripplePtr++;
  }
  r[ripplePtr]=new Ripple(x, y, 0);
}

class Ripple {
  float x=0;
  float y=0;
  float d=0;
  float a=3;
  float aInc=0;
  color c;

float aAtStart=0;
  public Ripple(
  float x, 
  float y, 
  float d
    ) {
    this.x=x;
    this.y=y;
    this.d=d;
    aInc = 0.01;//random(0, .01);
    a = random(.5,3);
    aAtStart = a;
  }


  public void render() {
    noFill();
    
    if(a>0 && a< aAtStart){
    stroke(50, 50, 50, map(a, 0, aAtStart, 255, 20));
    }
    stroke(c);
    strokeWeight( 0.1 );
    ellipse(x, y, d, d);

    d+=(a-=aInc);
    
    
  }
}

