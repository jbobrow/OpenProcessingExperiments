
Worm worm;

void setup() {
  size(640,360);
  smooth();
  noStroke();
  colorMode(HSB,255);
  worm = new Worm(random(50,430),random(50,750),random(0,2*PI));
}

void draw() {
    fill (20, 40);
    noStroke ();
    rect (0, 0, width, height);
    fill(map(noise(0.01*worm.loc.x,0.01*worm.loc.y),0,1,0,255),255,255);
    ellipse(worm.loc.x,worm.loc.y,10*noise(frameCount),10*noise(frameCount));
    worm.move();
}
void keyPressed(){ // This function is called everytime a key is pressed.
  if(key == CODED){
    if (keyCode == RIGHT) {
      worm.turn(1);
    }
    else if (keyCode == LEFT) {
      worm.turn(-1);
    }
  }
}

class Worm {
  PVector dir;
  PVector loc;
  float angle;
  float speed=3;
  float agility = 0.2;
 
  public Worm(float x, float y, float angle) {
    this.angle = angle;
    loc = new PVector(x,y);
    dir = new PVector(cos(angle),sin(angle));
    dir.normalize();
    dir.mult(speed);
  } 
  void turn(float d) {
    angle += d*agility;
  }
  void move() {
    //angle += random(-agility,agility);
    updateDir();
  }
  void updateDir() {
    dir = new PVector(cos(angle),sin(angle));
    dir.normalize();
    dir.mult(speed);
    if (loc.x+dir.x<0 || loc.x+dir.x>width) { 
      angle = PI-angle;
      //move();
    }
    else if (loc.y+dir.y<0 || loc.y+dir.y>height) { 
      angle = 2*PI-angle;
      //move();
    }
    else 
      loc.add(dir);  
  } 
}


