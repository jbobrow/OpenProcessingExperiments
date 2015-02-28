
/*
an implementation of a relative neighborhood graph
by Isaac Dykeman
May 5, 2013
*/

ArrayList<Point> gPoints;
boolean paused = false;

void setup() {
  size(600, 400);
    gPoints = new ArrayList<Point>();

  
    for (int i=0;i<120;i++) {
    gPoints.add(new Point(new PVector(random(width), random(height))));
  }
  
}
void draw(){
  if(!mousePressed){
    background(200,200,200);
  }
  
  if(frameCount<180){
    
    text("click to leave trails \nP to pause",30,20);
  }
  
  
  smooth();

  for (Point test : gPoints) {

    test.draw();
  }

  for (int i=0;i<gPoints.size();i++) {
    for (int j=i+1;j<gPoints.size();j++) {
      if (gPoints.get(i) != gPoints.get(j)) {
        if (shouldConnect(gPoints.get(i), gPoints.get(j))) {

          connect(gPoints.get(i), gPoints.get(j));
        }
      }
    }
  }



  for (Point test : gPoints) {
    test.draw();
  }
  frameRate(40);
}



boolean shouldConnect(Point p1, Point p2) {
  float distance = gDist(p1.loc, p2.loc);

  for (Point test : gPoints) {
    if (test != p1 && test !=p2) {
      if (gDist(p1.loc, test.loc)<distance &&
        gDist(p2.loc, test.loc)<distance) {
        return false;
      }
    }
  }
  return true;
}


void connect(Point p1, Point p2) {
  p1.points.add(p2);
  p2.points.add(p1);
}

float gDist(PVector one, PVector two) {
  return dist(one.x, one.y, two.x, two.y);
}


void keyPressed() {
  if (key == 'p' || key == 'P') {
      paused = !paused;
      if(paused){
        noLoop();
      }
      else{
        loop();
      }
    }

}

class Point extends Wanderer {
  //PVector loc;
  ArrayList<Point> points;

  Point(PVector nLoc) {
    loc = nLoc;
    points = new ArrayList<Point>();
  }

  void draw() {
    if (points.size()>0) {

    }
    

    if(maxSpeed<1){
      maxSpeed =1;
    }

    display();
    ellipse(loc.x, loc.y, 9, 9);
    for (Point test: points) {
      line(loc.x, loc.y, test.loc.x, test.loc.y);
    }
    points = new ArrayList<Point>();
  }
}

class Wanderer {
  PVector loc;
  PVector momentum;
  float randStep = .1;
  float maxSpeed = 1;
  float radius = 4;

  float minRadius=maxSpeed;
  float maxRadius = 6;


  Wanderer(PVector start) {

    loc = start;
    momentum = new PVector();
    strokeWeight(0);
    momentum.x+=random(-randStep, randStep);
    momentum.y+=random(-randStep, randStep);
    stroke(255);
  }
  Wanderer() {
    momentum = new PVector();
    strokeWeight(0);
    momentum.x+=random(-randStep, randStep);
    momentum.y+=random(-randStep, randStep);
    stroke(255);
  }


  void display() {
    
    
    random(100);

    //radius+=random(-1.,.1);
    if (radius<minRadius) {
      //radius = minRadius;
    }
    else if (radius>maxRadius) {
      // radius = maxRadius;
    }

    momentum.x+=random(-randStep, randStep);
    momentum.y+=random(-randStep, randStep);
    loc.x += momentum.x;
    loc.y += momentum.y;

    boolean collided = false;

    if (loc.x<0 || loc.x>width) {
      momentum.x=-momentum.x;
      collided = true;
      if (loc.x<0) {
        loc.x=1;
      }
      else if (loc.x>width) {
        loc.x=width-1;
      }
    }
    if (loc.y<0 || loc.y>height) {
      momentum.y=-momentum.y;
      collided = true;
      if (loc.y<0) {
        loc.y=1;
      }
      else if (loc.y>height) {
        loc.y=height-1;
      }
    }
    if (momentum.mag()>maxSpeed) {
      momentum.normalize();
      momentum.x*=maxSpeed;
      momentum.y*=maxSpeed;
    }



    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
}



