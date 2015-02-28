
int numCircles;
int steps;
superCircle[] circles;

void setup() {
    size(800, 400);
    smooth();
    frameRate(20);
    strokeWeight(1);
    
    noFill();
    Inicialize();
    background(255);
}

void draw() {
  //clear(0);
  for(int i=0; i< circles.length; i++){
    circles[i].draw();
  }
}

void mousePressed(){
  clear();
  Inicialize();
}

///custom functions
void Inicialize(){
    numCircles = random(3, 7);
    steps = (width / numCircles);
    circles = new superCircle[numCircles];
    
    int step = 0; 
    for(int i=0; i<circles.length; i++){
        step+=steps;
        int randomCenter = random((height/2)-20, (height/2)+20);
        circles[i] = new superCircle(step, randomCenter, 3, width/6);
    }
}

///custom classes
class superCircle{
    int x, y, innerCircles, radius;
    int noiseVal = 3;
    
    superCircle(px, py, pinnerCircles, pradius){
      x = px;
      y = py;
      innerCircles = pinnerCircles;
      radius = pradius;
    }
    
    void move(){
      x +=random(-noiseVal, noiseVal);
      y +=random(-noiseVal, noiseVal);

      //follow the mouse
      x += (x > mouseX) ? random(-1) : random(1);
      y += (y > mouseY) ? random(-1) : random(1);
    }
    
    void draw(){ 
      move(); 
      noFill();
      stroke(random(x), random(x), random(x), 100);
      ellipse(x, y, radius, radius);
    
      fill(random(y), random(y), random(y), 50);
      for(int i=0; i<innerCircles; i++){
        int innerRaidus = radius/(i+2)
        ellipse(x, y, innerRaidus, innerRaidus);
      }
    }
}
