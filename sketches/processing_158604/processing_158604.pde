
Explosion e[] = new Explosion[100];
void setup() {
  size(800, 400);
  background(255);
  noStroke();

  float direction=0;
  float x=0;
  for (int i=0;i<e.length;i++) {
    direction += 5;
    e[i] = new Explosion(20, x+=10, height/2, direction, int(random(100, 300) ));
  }
}

void draw() {
  for (int i=0;i<e.length;i++) {
    e[i].render();
  }
}
void keyPressed() {
  background(255); 
   float direction=0;
  float x=0;
  for (int i=0;i<e.length;i++) {
    direction += 5;
    e[i] = new Explosion(20, x+=10, height/2, direction, int(random(100, 300) ));
  }
}

class Explosion {
  Spark[] spark;

  int t=0;
  int epoc=0;

  color c;

  public Explosion( int n, float x, float y, float a, int t) {
    c=  color(random(0, 255), 100, 50, 20);
    spark = new Spark[n];
    this.t=t;
    for (int i=0;i<spark.length;i++) {
      spark[i] = new Spark(x, y, a);
    }
  }
  void render() {
    epoc++;

    for (int i=0;i<spark.length;i++) {

      if (epoc>t) {
        spark[i].diverge=true;
      }

      spark[i].render(c);
    }
  }
}
class Spark {
  float x;
  float y;
  float a;
  boolean diverge=false;

  public Spark(float x, float y, float a) {
    this.x=x;
    this.y=y;
    this.a=a;
  }

  void render( color c) {

    if (diverge) {
      fill(c);
      noStroke();
      a+=random(-10, 10);
      x+=cos( radians(a) );
      y+=sin( radians(a) );
      ellipse(x, y, 1, 1);
    }
    else {
      //noFill();

      a+=random(-3, 3);
      x+=cos( radians(a) )*0.5;
      y+=sin( radians(a) )*0.5;

      stroke(c);
      point(x, y);
    }
  }
}

