
//Experiment Exercise Xiaofeng Lin
//One ball using the path of the bezier?


int x, xspd = 3;
float step = 0.0f;

void setup(){
  size(400, 400);
  frameRate(5);
}

void draw(){
  background(255);
  fill(random(255));
  xspd = (mouseX + mouseY)/2;
  
  for (int i = 0; i < 50; i++){
    
    if (step >= 1.0f){
      step = 0.0f;
      fill(random(255),random(255),random(255));
    }
    float x = bezierPoint(85, 10, 90, 15, step);
    float y = bezierPoint(20, 10, 90, 80, step);
    
    ellipse (x + random(50) * i, y + i * 13, 10, 10);
  }
  
  x += xspd;
  step += 0.01f;
}
