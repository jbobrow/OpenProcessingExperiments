
// leyli guliyeva
// project 2

// press the mouse down for the speed of the circles to increase exponentially and create nice illusions

Circle [] circles = new Circle[400];

void setup(){
    background(100, 5, 5);
  size (400, 600);
  smooth();
  frameRate(100);
  
  for (int i = 0; i < circles. length; i++){
    circles[i] = new Circle (i*6, i+10);
  }
}

void draw() {

  pushMatrix();
  translate(width/2, height/2);
  
  for (int i=0; i < circles.length; i++){
    circles[i].update();
    circles[i].display();
  }
  
  popMatrix();
}

class Circle {
  float theta;
  float diameter;
  float distance;
  float speed;
  
  Circle(float distance_, float diameter_){
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    speed = random(0.005, 0.02);
  }
  
  void update() {
    theta +=speed;
  }
  
  void display(){
  
    pushMatrix();
    rotate(-theta);
    translate(distance, 0);
    fill(0);
    ellipse(0, 0, diameter, diameter);
    fill(100, 5, 5);
    ellipse(0, 0, diameter/3, diameter/3);
    popMatrix ();
    
    pushMatrix();
    rotate(theta*1.3);
    translate(distance+10, 0);
    noStroke();
    fill(150);
    ellipse(0, 0, diameter/1.6, diameter/1.6);
    fill(100, 5, 5);
    ellipse(0, 0, diameter/5, diameter/5);
    popMatrix();
    
    pushMatrix();
    rotate(-theta*3);
    translate(distance+30, 0);
    noStroke();
    fill(200);
    ellipse(0, 0, diameter/1.2, diameter/1.2);
    fill(100, 5, 5);
    ellipse(0, 0, diameter/5, diameter/5);
    popMatrix();
    
    pushMatrix();
    rotate(theta*1.7);
    translate(distance+30, 0);
    noStroke();
    fill(100);
    ellipse(0, 0, diameter/2, diameter/2);
    fill(100, 5, 5);
    ellipse(0, 0, diameter/4, diameter/4);
    popMatrix();
  
  if (mousePressed == true){
    speed +=  .002;  
  }
  
  if (mousePressed == false){
    speed = random(0.005, 0.02);
    theta +=speed;
  }
  }
} 

