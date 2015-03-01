
Particle[] p = new Particle[2000];

void setup() {
  background(255);
  smooth();
  size(600, 600);
  noStroke();
  for (int i=0;i<p.length;i++) {
    p[i]= new Particle(random(width), random(height));
  }
}
int ptr=0;
void draw() {
//  background(255);
 fill(255,255,255,10);
 //rect(0,0,width,height);
  for (int i=0;i<p.length;i++) {
    p[i].render();
  }
  p[ptr++].rePosition();
  
  if(ptr==p.length){
    ptr=0;
  }
}

class Particle {

  private float x=0;
  private float y=0;
  private float d=100;
  private float size=0;

  public Particle(float x, float y) {
    this.x=x;
    this.y=y;
    d=random(50,100);
  }
  private void move() {

    if ( dist(mouseX, mouseY, x, y) < d/2 ) {
      float xMove = map(mouseX-x, 0, d/2, 0, 3);
      float yMove = map(mouseY-y, 0, d/2, 0, 3);      
      x-=xMove;
      y-=yMove;
      fill(255, 50, 50, 50);
      size+=0.2;
      
    }
    else {
      fill(200, 200, 200);
      size=1;
    }

    if (x>width || x < 0) {
      this.x= random(width);
    }
    if (y>width || y < 0) {
      this.x= random(height);
    }
  }
  public void rePosition() {
    this.x= random(width);
    this.x= random(height);
  }
  public void render() {
    this.move();


    // ellipse(x, y, d, d);
    ellipse(x, y, this.size, this.size);
  }
}

