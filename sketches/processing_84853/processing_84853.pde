

float noisenoisehit;

void setup() {
  size(700, 400);
  
  noisenoisehit = random(10); 
  frameRate(20);
}

void draw() {
  float circleX = 200;
  float circleY = 200;
  float circleRadius  = 100;
  stroke(#000000, 30);
  
  background(#FFFFFF);
  
  float stepy = 2;
  
  float noisehit = noisenoisehit;
  
  for(int y = 0; y < height; y += stepy) {
    float sine = (y - circleY) / circleRadius;
    
    float endX;
    if(abs(sine) > 1) {
      endX = width;
    } else {
      float angle = asin(sine) + PI;
      float cosine = cos(angle);
      endX = cosine * circleRadius + circleX;
      
      pushMatrix();
      translate(endX, y);
      rotate((noise(noisehit) - .5)  * PI/3);
      line(0, 0, width, 0);
      popMatrix();
      
      noisehit += 0.01;
    }
    

    
    line(0, y, endX, y);
  }
  
  noisenoisehit +=0.01;
}


