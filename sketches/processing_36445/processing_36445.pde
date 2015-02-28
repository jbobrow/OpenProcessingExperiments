
//change The value of num to increase/decrease amount of particles\\
int num = 200;


Ball[] ball = new Ball[num];

void setup() {
  size(700,400);
  smooth();


// array variable to add particles\\
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  
  //changes the colour of the trace and fade\\
  noStroke();
  fill(255,random(150,250),random(150,250),3);
  rect(0,0,width,height);

  for (int i = 0; i < ball.length; i++) {
    ball[i].update();
    ball[i].passthrough();
    ball[i].display(); 

  }
}

 
class Ball {

  // listing variables \\
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

// creating new "voids" \\

  Ball() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 8;
  }

// controls where the particles attract towards \\

  void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  
    dir.normalize();    
    acceleration = dir;  
    
// mouse interaction \\

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


// asthetics of the ellipse \\
  void display() {
    strokeWeight(2);
    fill(0,random(60));
    stroke(255,20);
    ellipse(location.x,location.y,10,10);

       
  }


// makes the particles passthrough the page to the opposite of the application \\
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

////////courtesy of code from "http://murderandcreate.com/physics/" and "http://processing.org/learning/pvector/"

