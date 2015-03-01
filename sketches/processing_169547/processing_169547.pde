
Ball[] sphere= new Ball[2];

void setup() {
  size(900, 900);
  smooth();
  background(25);
  for (int i=0; i<sphere.length; i++) {
    sphere[i]=new Ball(random(width),random(height));
    frameRate(20);
  }
}

void mousePressed(){
Ball b= new Ball(mouseX,mouseY);
sphere= (Ball[]) append(sphere, b)
}
void draw() {


 for (int i=0; i<sphere.length; i++) {
    noStroke();
    sphere[i].display();
    sphere[i].grow();
  }

  for (int i=0; i<sphere.length; i++) {
    for (int j=i+1; j<sphere.length; j++) {
      stroke(255);
      strokeWeight(.05);
      line(sphere[i].x, sphere[i].y, sphere[j].x, sphere[j].y);
      if (sphere[i].intersect(sphere[j])){
        color c=color(random(255));
        sphere[i].resetMe(c);
        sphere[j].resetMe(c);
      }
    }
  }
 
}

class Ball {
  float x;
  float y;
  float r;
  color c;
  float growSpeed;

  Ball(tempx,tempy) {
    r=0;
    x=tempx;
    y=tempy;
    growSpeed=1;
    c=color(random(255));
  }

  void display() {
    fill(c);
    ellipse(x, y, 2*r, 2*r);
  }


  void grow() {  
    r=r+growSpeed;
  }


  boolean intersect(Ball b) {
    float distance;
    distance=dist(x, y, b.x, b.y);

    if (r+b.r>distance) {
      return true;
    } else {
      return false;
    }
  }

  void resetMe(color tempc) {
    r=0;
    x=random(width);
    y=random(height);
    c=tempc;
    background(25);
  }
}



