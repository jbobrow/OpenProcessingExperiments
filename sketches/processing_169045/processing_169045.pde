
Ball[] sphere= new Ball[3];




void setup() {
  size(600, 600);
  smooth();
  background(255);
  println("The syntax of an ellipse is (x position, y position, DIAMETER X, DIAMETER Y)... I forgot to multiply r by two... I put ellipse (x,y,r,r);"); 
  for (int i=0; i<3; i++) {
    sphere[i]=new Ball();
  }
}

void draw() {



  stroke(0);
  triangle(sphere[0].r+sphere[0].x, sphere[0].y-sphere[0].r, sphere[1].x-sphere[1].r, sphere[1].y-sphere[1].r, sphere[2].x-sphere[2].r, sphere[2].y+sphere[2].r);
  triangle(sphere[0].r-sphere[0].x, sphere[0].y+sphere[0].r, sphere[1].x+sphere[1].r, sphere[1].y+sphere[1].r, sphere[2].x+sphere[2].r, sphere[2].y-sphere[2].r);
  triangle(sphere[0].r-sphere[0].x, sphere[0].y-sphere[0].r, sphere[1].x-sphere[1].r, sphere[1].y+sphere[1].r, sphere[2].x+sphere[2].r, sphere[2].y+sphere[2].r);
  triangle(sphere[0].r-sphere[0].x, sphere[0].y-sphere[0].r, sphere[1].x-sphere[1].r, sphere[1].y+sphere[1].r, sphere[2].x-sphere[2].r, sphere[2].y-sphere[2].r);
 
  for (int i=0; i<sphere.length; i++) {
    sphere[i].display();
    sphere[i].grow();
    //noFill();
  }
  if (sphere[0].intersect(sphere[1])||sphere[0].intersect(sphere[2])||sphere[1].intersect(sphere[2])) { 
    for (int i=0; i<sphere.length; i++) {
      sphere[i].resetMe();
    }
  }
}

class Ball {
  float x;
  float y;
  float r;
  color c;
  float growSpeed;

  Ball() {
    r=0;
    x=random(600);
    y=random(600);
    growSpeed=2;
    c=color(random(255), random(255), random(255));
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

  void resetMe() {
    r=0;
    x=random(600);
    y=random(600);
    background(255);
    c=color(random(255), random(255), random(255));
    
  }
  
  
  
}



