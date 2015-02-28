

Flock[] f;

void setup(){
  size(500, 500);
  background(255);
  smooth();
  //initialize our flock guys
  f = new Flock[100];
  for (int i=0; i< f.length;i++) {
    f[i] = new Flock();
  }
}

void draw(){
  background(255);

  for (int i=0; i< f.length;i++){
    f[i].move();                //move all boids
  }
}


void mouseClicked(){            //target point
  for (int i=0; i< f.length;i++){
    f[i].setTarget(mouseX, mouseY);
  }
}

class Flock {

  PVector position, velocity, acceleration;
  PVector target;
  float startx, starty;

  //Variables to calculate our starting position.
  //The s will be the size of the Flock.
  int w, h, s;


  Flock() {

    w = width;
    h = height;
    //the size of our boid
    s = 4;

    //temporary x and y position to start flying
    startx = random(s, w-s);
    starty = random(s, h-s);

    position =new PVector(startx, starty);
    //start with no velocity, acceleration will take care of that
    velocity=new PVector(0, 0);
    //start with no accelartion, our target function will take care of that
    acceleration=new PVector(0, 0);
    //target position starts with the center.
    target=new PVector(w/2, h/2);
  }

 
  void move(){
    //We call the targetFunction() to calculate the acceleration     
    targetFunction();

    velocity.add(acceleration);
    velocity.limit(9);
    position.add(velocity);

    noStroke();
    fill(0);
    ellipse(position.x, position.y, s, s);      //boid
  }


  //This function will be used to change the vector with the target location.
  void setTarget(int inX, int inY){
    //We recieve x and y and set the vector with those values.
    target.set(inX, inY);
  }

 
  void targetFunction(){
    //desired vector to calculate a vector from our position towards the target
    PVector desired = PVector.sub(target, position);
    desired.normalize();
    desired.mult(0.5);
    // desired.setMag(maxspeed);

    acceleration = desired;
  }
}



