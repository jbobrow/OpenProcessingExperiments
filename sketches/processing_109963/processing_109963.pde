
//int[] numbers = {100, 80, 70, 50, 46, 34, 30, 40, 27, 20, 1, 2, 13, 17};
int NUM_BALLS = 8;

float bgColor = 160;
float scSize = 500;

Ball[] balls = new Ball[NUM_BALLS];
void setup() {
  size(500, 500);
  for(int i = 1; i <= NUM_BALLS; i++){
    balls[i-1] = new Ball((scSize/NUM_BALLS * i), (scSize/NUM_BALLS*i), random(20, 30));
  }

}

void draw() {
  background(bgColor);
  
 for(int i = 0; i < balls.length; i++){
   for(int j = i + 1; j < balls.length; j++){
    balls[i].checkCollision(balls[j]);
   } 
  }

  for (Ball b : balls) {
    b.update();
    b.display();
    b.checkBoundaryCollision();
  }
}

void mousePressed(){
 for(Ball b: balls){
  PVector distance = new PVector(b.position.x - mouseX, b.position.y-mouseY);
  if(distance.mag()<b.r){
   b.clickedOn = true;
   System.out.println("a");
  }
 } 
} 
void mouseReleased(){
  for(Ball b: balls){
   b.clickedOn = false;
  } 
 }






class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0, .00);

  float r, m;
  boolean clickedOn = false;
  


  Ball(float x, float y,  double r_) {
    float theta = random(TWO_PI);
    position = new PVector(x, y);
    velocity = new PVector(sin(theta), cos(theta));
    velocity.mult(5);
    r = (float)r_;
    m = (float)r_;
  }

  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    if(clickedOn){
        PVector nu = new PVector(mouseX-position.x, mouseY-position.y);
        velocity = nu;    
    }
  }

  void checkBoundaryCollision() {
    if (position.x > scSize-r) {
      position.x = scSize-r-1;
      velocity.x *= -1;
    } 
    else if (position.x < r) {
      position.x = r+1;
      velocity.x *= -1;
    } 
    else if (position.y > scSize-r) {
      position.y = scSize-r-1;
      velocity.y *= -1;
    } 
    else if (position.y < r) {
      position.y = r+1;
      velocity.y *= -1;
    }
  }

  void checkCollision(Ball other) {
    // get distances between the balls components
    PVector dist = PVector.sub(other.position, position);
    PVector direction = new PVector(dist.x/dist.mag(), dist.y/dist.mag());
    // calculate magnitude of the vector separating the balls
    float distMag = magnitude(dist);
    
    float minRad = r + other.r;
    
   // println(minRad + ", " + distMag);
    
    if (distMag <= minRad+1) {
      
      println(dist.x);
      double avi = velocity.dot(direction);
      double bvi = other.velocity.dot(direction);
     
      double avf = (avi*(m - other.m)+2*other.m*bvi)/(m + other.m);
      double bvf = (bvi*(other.m - m)+2*m*avi)/(m + other.m);
      
      PVector aChange = new PVector(direction.x * (avf-avi),direction.y * (avf-avi));
      PVector bChange = new PVector(direction.x * (bvf-bvi),direction.y * (bvf-bvi));
      
      velocity.add(aChange);
      other.velocity.add(bChange);
      
      
      if(!clickedOn){
        position.add(velocity);
      } 
      
      
      dist.normalize();
      dist.mult(minRad-distMag+2);
      other.position.add(dist);
      
    }
  }


  void display() {
    noStroke();
    fill(220);
    ellipse(position.x, position.y, r*2, r*2);
  }
  
  float magnitude(PVector p){
    return sqrt(p.x*p.x + p.y*p.y);
  }
  
}



