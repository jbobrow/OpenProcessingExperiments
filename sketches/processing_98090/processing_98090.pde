
float x = 100;   
float y = 0;  

float speed = 0; 
float gravity = 0.1;  

void setup() {
  size(200,200);

}

void draw() {
  background(178, 167);
  fill(25, 255, 5);
  stroke(1);
  rectMode(CENTER);
  rect(x,y,15,15);
  
  y = y + speed;
  speed = speed + gravity;
  if (y > height) {
    speed = speed * -0.95;  
  }
}



