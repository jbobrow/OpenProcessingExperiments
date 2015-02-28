
//one ship refferance
Ship s;

//an array of 10 target referances
int T=10;
Target[] t = new Target[T];

void setup() {
  smooth();
  size(800, 800);
  
  //instanciate a ship object
  s = new Ship(width/2, height/2);

  //instanciate 10 target objects
  for (int i=0;i<T;i++) {
    t[i] = new Target((int)random(width), (int)random(height), (int)random(50)+40);
  }
  
  //set the frame rate
  frameRate(60);
  background(50);
}

void draw() {
  //refreash the background
  background(50);
  
  //update the ships motion
  s.render();

  //for each target
  //  draw the target
  //  and check if a collision has taken place
  
  for (int i=0;i<T;i++) {
    t[i].render();
    t[i].collision(s.getX(), s.getY());
  }
}

class Target {
  int x=0;
  int y=0;
  int d=0;
  int c=0;
  //target constructor
  public Target(int x, int y, int d) {
    this.x=x;
    this.y=y;
    this.d=d;
    c=(int)random(100);
  }
  //render function draws the tatget when it is called
  public void render() {
    colorMode(HSB, 100);
    fill(c, 100, 100);
    ellipse(x, y, d, d);
  }
  //collision function tests whether the point passed it is contained in the target
  // if it is the size of the target is collapsed to 0
  public boolean collision(int x, int y) {
    if (dist(this.x, this.y, x, y) < d/2) {
      d=0;
      return true;
    }
    else {
      return false;
    }
  }
}

class Ship {
  int s=50;
  int x=0;
  int y=0;
  int m=5;
  int a=0;
  // ships constructor
  public Ship(int x, int y) {
    this.x=x;
    this.y=y;
  }
  //getter funcitons
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  //render functinos deals with keyboard input to modify position and drawing the ship
  public void render() {
    if (keyPressed) {
      println(keyCode);
      if (keyCode == 37) {
        a-=1;
      }
      if (keyCode == 39) {
        a+=1;
      }

      if (keyCode == 38) {
        m+=1;
      }

      if (keyCode == 40) {
        m-=1;
      }
      if (keyCode ==0) {
        m=0;
      }
    }


    if (x>width) {
      x=0;
    }
    if (x<0) {
      x=width;
    }
    if (y>height) {
      y=0;
    }
    if (y<0) {
      y=height;
    }



    x+=cos(radians(a+270))*m;
    y+=sin(radians(a+270))*m;

    //2d transforms used to allow rotation
    pushMatrix();
    translate(x, y);
    rotate(radians(a));
    colorMode(RGB, 255);
    fill(255);
    drawRocket(0, 0, s);
    popMatrix();
  }
  private void drawRocket(int x, int y, int s) {
    x=x-s/2;
    y=y-s/2;
    stroke(255);
    strokeWeight(2);
    triangle(x, y, x+s, y, x+s/2, y-s/2);
    strokeWeight(3);
    rect(x, y, s, s);
  }
}


