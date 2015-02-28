

int numballs = 60;
Ball[] balls = new Ball[numballs];
float diameter = 1;
float radius = diameter/2;

void setup(){
  smooth();
  colorMode(HSB, 255);
  size(450, 450);
  background(0);
  for(int i=0; i<numballs; i++){
    balls[i] = new Ball(int(random(100, width-100)), int(random(100, height-100)));
  }
  ellipseMode(CENTER);
  //frameRate(1);
  noStroke();
  //smooth();
}

void draw(){
  //background(0)
  fill(255, 6);
  strokeWeight(.1);
  //rect(0, 0, width, height);
  
  for(int i=0; i<numballs; i++){
    //println(balls[i].location);
    balls[i].render();
    balls[i].update();
    line(balls[i].location.x, balls[i].location.y, balls[(i+1)%numballs].location.x, balls[(i+1)%numballs].location.y); 

  }
  for(int i=0; i<numballs-1; i++){
    for(int j=i+1; j<numballs; j++){
      repel(balls[i], balls[j]);
    }
  }
}

int valance(float num){
  if(num >= 0){
    return 1;
  }
  else return -1;
}

void repel(Ball b1, Ball b2){
  PVector diff = b2.location.get();
  diff.sub(b1.location);
  
  float magnitude = constrain(diff.mag(), 0, radius);
  
  PVector normDiff = diff.get(); 
  normDiff.normalize();
  
  PVector repulsion = normDiff.get();
  repulsion.mult(1 / sq(magnitude*20));
  
  b1.velocity.add(repulsion);
  b2.velocity.sub(repulsion);
}

class Ball{
  int ballHue;
   
  int ballValue;
  PVector velocity;
  PVector location;
  PVector lastLocation;
  Ball(float x, float y){
    ballHue = int(random(255));
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    lastLocation = new PVector(x, y);
  }
  void update(){
    lastLocation = location.get();
    location.add(velocity);
    ballValue = int(constrain(map(velocity.mag(), 0, 10, 55, 255), 0, 255));
  }
  void render(){
    //fill(ballHue, 255-ballValue, ballValue);
    noFill();
    stroke(ballHue, 255-ballValue, ballValue);
    ellipse(location.x, location.y, diameter, diameter);
    line(lastLocation.x, lastLocation.y, location.x, location.y);
  }
}

