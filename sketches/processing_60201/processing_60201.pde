
Mover[] movers = new Mover[200];

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  background(255);
  // Initializing all the elements of the array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  noStroke();
  background(255);
  fill(255,10);
  rect(0,0,width,height);

  // Calling functions of all of the objects in the array.
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
  }
}

class Mover {

  PVector location;
  PVector velocity;
  // Acceleration is the key!
  PVector acceleration;
  // The variable, topspeed, will limit the magnitude of velocity.
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 2;
  }

  void update() {
    // Velocity change by acceleration and is limited by topspeed.
    PVector mouse= new PVector(mouseX,mouseY);
    
    
    
    if(mousePressed){acceleration= PVector.sub(mouse,location);}
    else {acceleration= PVector.sub(location,mouse);}
    
    //let's see what if we don't normalize
    //acceleration too big causes the velocity allways capped
    //acceleration.normalize();
    acceleration.div(3000);
    
    // to put some randomness in the velocity, this produces better results(more soft) than adding randomness to acceleration
    PVector rand= new PVector(random(-1,1),random(-1,1));
    rand.normalize();
    rand.div(100);
    
    velocity.add(acceleration);
    velocity.add(rand); 
    velocity.limit(topspeed);
    
    location.add(velocity);
  }
  
  void display(){
    
  fill(150,10,30,50);
  noStroke();
  rectMode(CENTER);
  rect(location.x,location.y,10,10);
  ellipseMode(CENTER);
  ellipse(location.x,location.y+5,10,10);
  
  }
  
  
  //not that checkEdges doesn't work, but acceleration way TOO big, so reverse has no implications  
  
  void checkEdges() {

    if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
    if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  }
  
}

