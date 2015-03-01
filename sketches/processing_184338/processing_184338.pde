
planet sun;
planet mercury;
planet earth;
planet mars;

void setup() {
  size(640, 360);
  noStroke();

  frameRate(30);
  background(0);
  
  sun = new planet(color(255,255,0),50,0,0);
  mercury = new planet(color(128),10,30,0.01);
  earth = new planet(color(0,0,255),30,50,0.05);
  mars = new planet(color(255,0,0),40,80,0.01);
  
}

void draw() {
  background(0);
  
  translate(width/2,height/2);

  sun.move();
  mercury.move();
  earth.move();
  mars.move();

}

class planet{
  color c;
  int size;
  int dist;
  float speed;
  float angle;  
  
  planet(color tempc, int tempsize, int tempdist, float tempspeed){
    c=tempc;
    size=tempsize;
    dist=tempdist;
    speed=tempspeed;
  }
  
  void move(){
    angle = angle +speed;
    rotate(angle);  
    fill(c);
    ellipse(dist,dist, size, size);   
  }
  
}


