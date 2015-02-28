

Rocket[] r= new Rocket[10];

void setup() {
  size(600, 600); 
  colorMode(HSB);
  noStroke();
  for (int i=0;i<r.length;i++) {
    r[i]=new Rocket();
  }

  background(0);
}

void draw() {
  //  background(0);
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  if (mousePressed) {
    for (int i=0;i<r.length;i++) {
      r[i] = new Rocket();
    }
  }
  for (int i=0;i<r.length;i++) {
    r[i].render();
  }
}
class Rocket {
  Particle[] p = new Particle[100];

  float x=0;
  float y=0;
  int counter=0;

  Rocket() {
    y=0;
    counter=(int)random(20);
    x=random(20)+width/2;
    float xDrift = random(0.1)-0.05;
    int c=(int)random(255);
    for (int i=0;i<p.length;i++) {
      p[i] = new Particle(x, height,counter,xDrift,c);
    }
  }

  void render() {
    for (int i=0;i<p.length;i++) {
      p[i].render();
    }
  }
}
class Particle {

  float xPos=0;
  float yPos=0;
  float a=0;
  float g=0;
  float m=0;
  float xDrag=0;
float xDragInc=0;

  int counter=0;
  int c=0;
  public Particle(float x, float y,int counter, float xDrift,int c) {
    xPos = x;
    yPos = y;
    a = random(360);
    m=random(2);
    this.counter=counter;
    xDragInc = xDrift;
    this.c=c;
  }

  public void render() {
    counter++;
    if (counter > 100) {
      xPos += m*cos(radians(a));
      yPos += m*sin(radians(a));
      yPos += g;
      g+=0.02;
    }
    else {
      yPos-=5;
      
      xPos+=(xDrag+=xDragInc);
    }
    fill(c,map(yPos, 600, 0, 0, 255),map(yPos, 600, 0, 0, 255) );
    ellipse(xPos, yPos, random(5), random(5));
     fill(50,map(yPos, 600, 0, 0, 255),map(yPos, 600, 0, 0, 255));
    ellipse(xPos, yPos, random(2), random(2));
    
  }
}


