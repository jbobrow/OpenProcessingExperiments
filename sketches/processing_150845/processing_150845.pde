

void setup() {  //setup function called initially, only once
  size(1000, 400);
  frameRate(15);
  background(0);  //set background white
  noStroke();
  fill(255);
}

void draw() {  //draw function loops 
  background(0);  //set background white
  
  for(float x = 0; x <= 1000; x += 8){
      float y = 200 + 100*sin((0.0001*frameCount)*x+0.1*frameCount);
      ellipse(x,y,16,16);
      }
}
