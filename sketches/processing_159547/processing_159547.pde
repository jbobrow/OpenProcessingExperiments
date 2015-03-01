
ball[] balls;
stick[] sticks;


int stickLen = 80;
int nBalls = 10;
int nSticks = nBalls -1;







void setup(){
  size(500, 500);
  background(255);
  
  
  
  float r = 20;
  balls = new ball[nBalls];
  sticks = new stick[nSticks];
  for( int i = 0; i < nBalls; i ++){

    balls[i] = new ball( new PVector(width/2 + stickLen *i, height/2), r, color(0));
    if (i > 0){
    sticks[i-1]= new stick(balls[i-1], balls[i]);
    }
  }
  
}

void draw(){
  background(255);
  for(int i = 0; i < nSticks; i ++){
  sticks[i].update();
  sticks[i].display();
  }
}
class ball{
  color ballColor;
  float radius;
  PVector location;
  PVector oldLocation;
  PVector nudge;
  
  ball(){
    this(new PVector(random(width), random(height)), random(20), color(random(255)));
  }
    
  ball(PVector loc, float r, color c){
    location = loc;
    radius = r;
    ballColor = c;
    ballColor = color(0);
    
    oldLocation   = location.get();
    nudge = new PVector (random(1,3), random(1,3));
    
    location. add(nudge);  
  }


void display(){
  fill(ballColor);
  ellipse(location.x, location.y, radius, radius);
}

void move(){
  PVector temp = location.get();
  location.x += (location.x - oldLocation.x);
  location.y += (location.y - oldLocation.y);
  
  oldLocation.set(temp);
  bounce();
  
}
void bounce(){
  if(location.x > width-radius){
    location.x = width -radius;
    oldLocation.x = location.x;
    location.x -= nudge.x;
  }
  
  
  if(location.x < radius){
    location.x = radius;
    oldLocation.x = location.x;
    location.x += nudge.x;
  }
  
    if(location.y > height-radius){
    location.y = height -radius;
    oldLocation.y = location.y;
    location.y -= nudge.y;
  }
  
  
    if(location.y < radius){
    location.y = radius;
    oldLocation.y = location.y;
    location.y += nudge.y;
    }
  
  }
}
  
  
class stick{
  ball b1, b2;
  
  float r;
  stick(ball b1, ball b2){
    this.b1 = b1;
    this.b2 = b2;
    r = b1.location.dist(b2.location);
    
  }
  
  
  
  void constrainLength(){
   float k = 0.1;
   PVector delta = PVector.sub(b2.location, b1.location);
   float deltaLength = delta.mag();
   float d =((deltaLength - r) /deltaLength);
   
   b1.location.x += delta.x * k * d/2;
   b1.location.y += delta.y * k * d/2;
   
   
   b2.location.x -= delta.x * k * d/2;
   b2.location.y -= delta.y * k * d/2;
   
  
  
  }
  
  void display(){
    b1.display();
    b2.display();
    stroke(0);
    strokeWeight(3);
    line(b1.location.x, b1.location.y, b2.location.x, b2.location.y);
  }
  
  void update(){
    b1.move();
    b2.move();
    constrainLength();
  }
  
}
  


