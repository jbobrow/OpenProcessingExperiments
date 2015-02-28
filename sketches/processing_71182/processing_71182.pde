
//Increase/Decrease Particle Numbers, default 5000.
int num = 800;
 
 
Ball[] ball = new Ball[num];
 
void setup() {
  size(400,455);
  smooth();
 
 
//Particle Veriable
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball();
  }
}
 
void draw() {
   
  //Traceline
  noStroke();
  fill(255);
  rect(0,0,width,height);
 
  for (int i = 0; i < ball.length; i++) {
    ball[i].update();
    ball[i].display();
 
  }
}
 
  
class Ball {
 
  //Varibles
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
 
// creating new "voids" \\
 
  Ball() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 11;
  }
 
//Particle Attraction.
 
  void update() {
 
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location); 
    dir.normalize();   
    acceleration = dir; 
     
//Mouse Controls.
 
  if(mouseButton == LEFT){
      dir.mult(-2);
    }
 
    else if (mouseButton == RIGHT) {
      dir.mult(1);
    }
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
 
 
//Particle Effect | Color | Stroke | Location.
  void display() {
    //strokeWeight(1);
    fill(0,random(60));
    //stroke(255,20);
    ellipse(location.x,location.y,5.5,5.5);
 
        
  }
 
 

 
}
