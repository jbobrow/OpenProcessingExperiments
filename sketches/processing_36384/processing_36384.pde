
int num = 200;


Ball[] ball = new Ball[num];

void setup() {
  size(700,400);
  smooth();



  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  noStroke();
  fill(255,3);
  rect(0,0,width,height);

  for (int i = 0; i < ball.length; i++) {
    ball[i].update();
    ball[i].passthrough();
    ball[i].display(); 

  }
}

 
class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Ball() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 8;
  }

  void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  
    dir.normalize();    
    acceleration = dir;  
    

  if(mousePressed){
      dir.mult(-1);
    }

    else{
      dir.mult(1);
    }

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    strokeWeight(1);
    fill(0,random(60));
    ellipse(location.x,location.y,10,10);

       
  }

  void passthrough() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }

  }

}



                
                
