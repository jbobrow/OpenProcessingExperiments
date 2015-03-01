
 float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.001;

float detail = 0.2;

void setup(){
  size(640, 640);
  noStroke();
  background(255);
}

void draw(){
  if(angle < width){
    fill(angle, 0, 0);
    translate(width/2, height/2);
    rotate(angle);
    rect(angle, 0, angle/20, angle/20);
    
    if(aVelocity < detail){
      aVelocity += aAcceleration;
    }
    angle += aVelocity;
  } 
}


