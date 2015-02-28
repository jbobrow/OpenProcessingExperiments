
float x;
float y;
float px;
float py;
float easing = .05;

void setup(){
  size(700,700);
  background(#60E674);
  smooth();
  stroke(#FFB031);
}

void draw(){
  float targetX = mouseX;
  x+=(targetX - x) * easing;
  float targetY = mouseY;
  y+=(targetY - y) * easing;
  int weight = 10;
  strokeWeight(weight);
  line(x,y,px,py);
  if (mousePressed) {
 stroke(#3199FF);
      
  }else{
    stroke(#FFB031);
    
  }
  }

                
                
