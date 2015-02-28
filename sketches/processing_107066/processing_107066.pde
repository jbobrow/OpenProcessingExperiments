
class Ball {
  float x, y;
  PVector v;
  color c;    //color
  float a;
  
  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.v = new PVector(0,0);
    this.c = color(randomColor(), randomColor(), randomColor());
    this.a = random(TWO_PI);
  }

  int randomColor() {
    return(int(random(4))*63);
  }

  void update() {
    //get velocities from the field
    v.x = fField.field[fField.cellX(x)][fField.cellY(y)].x;
    v.y = fField.field[fField.cellX(x)][fField.cellY(y)].y;
    
    //diffusion
    v.x+=cos(a)*0.7;
    v.y+=sin(a)*0.7;
    
    //update positions
    x+=v.x;
    y+=v.y;

    if (x>width) { 
      x-=width;
    }
    if (y>height) { 
      y-=height;
    }
    if (x<0) { 
      x+=width;
    }
    if (y<0) { 
      y+=height;
    }
    a+=random(-0.1, 0.1);
  }
  
  void draw() {
    ellipseMode(CENTER);
    fill(c, 100);
    noStroke();
    rect(x,y,3,3);
  }
}


