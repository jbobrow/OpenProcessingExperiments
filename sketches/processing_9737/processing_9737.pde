
Ball b = new Ball();
void setup(){
  size(200,200);
    smooth();
  background(100);
}
void draw(){
  if(mousePressed){
    saveFrame("ball-####.jpg");}
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  b.update();
  b.edges();
  b.display();
  
}


 class Ball{
  PVector location;
  PVector velocity;
  Ball(){
    location = new PVector(100,100); 
    //location = new PVector(random(width),random(height));
    velocity = new PVector(1,3.3);
    // velocity = new PVector(random(1),random(3.3));
  }

  void update(){
    location.add(velocity);
  }
  void edges(){
    if (location.x > width) {
     // location.x = 0;
     velocity.x=velocity.x* -1;
    } else if (location.x < 0) {
      location.x = width;
    } if (location.y < 0) {
      location.y = height;
    }else if (location.y > height) {
      //location.y = 0;
      velocity.y=velocity.y* -1;
    } 
  }
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
}


