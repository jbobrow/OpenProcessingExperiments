
//code modified from 
// http://www.openprocessing.org/visuals/?visualID=22459
Mover mover;
 
void setup() {
  size(700,700);
  smooth();
  background(255);
  mover = new Mover();
   
}
  
void draw() {
  noStroke();
  fill(255);
  rect(0,0,width,height);
  
    
  mover.update();
  mover.checkEdges();
  mover.display();
  mover.wind();
   
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector wind;
  int size_;
  
  
  Mover() {
     size_ = 16;
    location = new PVector(this.size_+15, this.size_+15);
    velocity = new PVector(3,0);
    acceleration = new PVector(0, .15); 
    wind = new PVector(0, 0);
     
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.sub(wind);
  }
  
  void wind(){
    if(key == 's' || key == 'S'){
      wind.x = 0;
      wind.y = 0;
    }else if(key == 'a' || key == 'A'){
      wind.x = .008;
    }else if(key == 'd' || key == 'D'){
      wind.x = -.008;
    }
  }
  void display() {
    noStroke();
    fill(155,55*(this.velocity.y),55*(this.velocity.x));
    ellipse(location.x,location.y,2*size_,2*size_); //modified by me to get
    //32x32 circle.
  }
  
  void grow(){
   if(size_+16<width/2)
   {
     size_=size_+16;
   } 
  }
  
  void checkEdges() {  //modified by me to simulate basic
  //projectile motion
  
  
    if (location.x > width - size_) {
      velocity.x = velocity.x * -.8; //simulates bounce energy loss
      this.grow();
      location.x = width-size_;
     
        
    }
    else if (location.x < size_) {
      velocity.x = velocity.x * -.8;
      this.grow();
      location.x = size_;
      
    }
  
    if (location.y > height - size_){
      velocity.y = velocity.y * -0.8;
      velocity.x = velocity.x * .99; //this simulates ground friction
      //this.grow();
      location.y = height - size_;
       
       
    }
    else if (location.y < size_) {
      velocity.y = velocity.y * -0.8;
      //this.grow();
      location.y = size_;
       
    }
      
    //This lets you "catch" and "throw" the ball.
    // Original code taken from previous excercises and programs in class.
    if(dist(location.x, location.y, mouseX, mouseY) < size_){
      if (mousePressed == true) {
        location.x = map(mouseX, 0, width, size_, width-size_);
        location.y = map(mouseY, 0, height, size_, height-size_);
        velocity.x = mouseX - pmouseX;
        velocity.y = mouseY - pmouseY;
      }
    }
  }
}


