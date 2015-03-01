
particle[] p = new particle[50] ;

void setup() {
  size(1000, 700);
  colorMode(HSB, 100);
  background(0);
  for (int i=0;i<p.length;i++) {
    p[i] = new particle(0, 0);
  }
  stroke(random(100), 80, 90, 30);
}
float r=0;

void draw() {

  if (r > 720 || mousePressed ) {
    r=0;
    background(0);
      for (int i=0;i<p.length;i++) {
    p[i] = new particle(0, 0);
  }
    stroke(random(100), 80, 100, 40);
  }
    translate(width/2, height/2);
    rotate(radians(r+=0.05) );

  for (int i=0;i<p.length;i++) {
    p[i].render();
  }
}


class particle {
  float x;
  float y;
  float a=0;

  float m    = 1.5;
  float aInc = 1;
  color c;
  float s=0;
  public particle(int x, int y) {
    this.x=x;
    this.y=y;
    m=random(0.1, 1 );
    aInc= random(0.05, 0.3);
    float shade = random(255);
    s=shade;
    c = color( shade, shade, shade, 40 );
  }

  public void render() {
   // noStroke();
    fill(c);
    float xMove = cos( radians(a) )*m*1.5;
    float yMove = sin( radians(a) )*m*0.1;
    this.x+=xMove;
    this.y+=yMove;
    //stroke(s,s,s,map(x,0,300,60,255) );
    // stroke(c);
    strokeWeight(0.6);
    // for(int i=0;i<5;i++){
    // point(x+random(-7,7), y+random(-7,7));
    // }
    point(x, y);
    //    ellipse(x, y, 5, 5);
    a+=aInc;
  }
}

