
PVector position;
PVector velocity;

PImage star;
PImage circle;

float rotation;
float rotationSpeed;

void setup() {
  background(0,0,0);
  size(400, 400);
  smooth();
  position = new PVector(width/2,height/2);
  velocity = new PVector(0,0);

  velocity.x = random(-1,1);
  velocity.y = random(-1,1);

  rotation = 0;
  rotationSpeed = random(-0.01, 0.01);
  
  star = loadImage("star.png");
  circle = loadImage("circle.png");
  imageMode(CENTER);
  

}


void draw() {
  background(0,0,0);

  position.x += velocity.x;
  position.y += velocity.y;
  
  velocity.x += random(-0.07,0.07);
  velocity.y += random(-0.07,0.07);

  if(position.x < 0 || position.x > width) {
    velocity.x = -1 * velocity.x;  
  }
  
  if(position.y < 0 || position.y > height) {
    velocity.y = -1 * velocity.y;  
  }
  
  rotation += rotationSpeed;

  pushMatrix();
  translate(position.x, position.y);
  rotate(rotation);
  image(star, position.x, position.y, 20,20);
  popMatrix();

  pushMatrix();
  translate(position.x, position.y);
  rotate(rotation);
  image(circle, width/2, height/2, 20,20);
  popMatrix();
  

 


}

