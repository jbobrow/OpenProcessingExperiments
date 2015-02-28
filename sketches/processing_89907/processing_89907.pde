

Ball myBall; // a variable to store my own object
ArrayList bucket = new ArrayList(); // make a new arraylist

void setup() {
  size(800,800);
  background(255);
}


void draw() {
 //background(255);
  fill(255,0,0);
  noStroke();
  for (int i=0; i<bucket.size(); i++){ // loop through the arraylist
    Ball tempBall = (Ball) bucket.get(i); // get each ball out and store it
    tempBall.render(); // draw my object
    tempBall.move();
    tempBall.bounce();
  }
 
}

void mousePressed(){
 
 for (int i=0; i<20; i++){
  PVector newpos = new PVector(mouseX,mouseY);
  myBall = new Ball( newpos, 60  ); // make the new Ball
  bucket.add(myBall); // add the new ball to the bucket
 }
}


class Ball{ // my new object - a template

  float diam; // diameter of the ball
  PVector pos; // position (as a PVector)
  PVector vel; // velocity
  color col;


  Ball( PVector _pos, float _diam ){ // constructor - make a new object
  // this function runs once, when the object is made
  // my private setup function
    pos = _pos; // assign our internal pos
    diam = _diam; // assign our internal diam
    vel = new PVector(random(-3,3),random(-3,3)); // initial velocity
    col =  color(random(255),random(255),random(255));
  }
  
  void render(){ // draw yourself on the screen
  fill(col);
    ellipse( pos.x, pos.y, diam,diam );
  }
  
  void move(){ // animate!
    pos.add(vel); // add velocity to position
    vel.y = vel.y + 0.05; // gravity!
    //vel.mult(0.995); // friction
    diam = diam * 0.95;
    if (diam == 0) {
      bucket.remove(this); // remove myself from the list
    }
    
  }
  
  void bounce(){
    if (pos.x < 0){ // left edge 
      vel.x = vel.x * -1; // reverse the x velocity
    }
    
    if (pos.x > width){ // right edge 
      vel.x = vel.x * -1; // reverse the x velocity
    }
    
    if (pos.y < 0){ // top edge 
      vel.y = vel.y * -1; // reverse the y velocity
    }
    
    if (pos.y > height){ // bottom edge 
      vel.y = vel.y * -1; // reverse the y velocity
    }
  
  
  }

}


