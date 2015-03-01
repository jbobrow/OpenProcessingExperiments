
private PVector location;
private PVector velocity;
private PVector acceleration;
 
void setup() {
  size(900,600);
  smooth();
  background(255);
  //set initial values
  location = new PVector(25,25);
  velocity = new PVector(2.5,0);
  acceleration = new PVector(0, .15);
}
  
void draw() {
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  update();
  checkEdges();
  display();
} 

void update() {
  velocity.add(acceleration);
  location.add(velocity);
}

void display() {
  noStroke();
  fill(255,0,0);
  ellipse(location.x,location.y,30,30);
}
  
void checkEdges() { 
  if (location.x > width - 20) {
    velocity.x = velocity.x * -.8; 
    location.x = width-20;
  }
  else if (location.x < 20) {
    velocity.x = velocity.x * -.8;
    location.x = 20;
  }

  if (location.y > height - 20){
    velocity.y = velocity.y * -0.8000;
    velocity.x = velocity.x * .99; 
    location.y = height - 20;
     
  }
  else if (location.y < 20) {
    velocity.y = velocity.y * -0.8000;
    location.y = 20;
  }
    
  if(dist(location.x, location.y, mouseX, mouseY) < 20){
    if (mousePressed == true) {
      location.x = mouseX;
      location.y = mouseY;
      velocity.x = mouseX - pmouseX;
      velocity.y = mouseY - pmouseY;
    }
  }
}



