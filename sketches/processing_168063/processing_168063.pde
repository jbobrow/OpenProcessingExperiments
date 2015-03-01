
particle[] p = new particle[200] ;

void setup() {
  size(1000, 400);
      background(0);
  for (int i=0;i<p.length;i++) {
    p[i] = new particle(0, 0);
  }
}
float xShift=0;

void draw() {

  if (!mousePressed) {
  translate(xShift+=1, 0);

  if (xShift>width+100) {
    xShift=-100;
    background(0);
  }
   // background(0);

    for (int i=0;i<p.length;i++) {
      p[i].render();
    }
  }
}

class particle {
  float x;
  float y;
  float a=0;

  float m    = 1.5;
  float aInc = 1;
  color c;
  public particle(int x, int y) {
    this.x=x;
    this.y=y;
    m=random(0.5, 2 );
    aInc= random(0.5, 1);
    float shade = random(255);
    c = color( shade,shade,shade,40 );
  }

  public void render() {
    noStroke();
    fill(c);
    float xMove = cos( radians(a) )*m;
    float yMove = sin( radians(a) )*m;
    this.x+=xMove;
    this.y+=yMove;
    stroke(c);
    strokeWeight(0.8);
   // for(int i=0;i<5;i++){
   // point(x+random(-7,7), y+random(-7,7));
   // }
     point(x,y);
    //    ellipse(x, y, 5, 5);
    a+=aInc;
  }
}

