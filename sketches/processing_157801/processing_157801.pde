
void setup(){
  size(640, 640);
  noStroke();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int x = -100; x <= 100; x+=10){
    for(int y = -100; y <= 100; y+=10){
      float d = dist(x, y, 0, 0);
      float d2 = sin(radians(d))*d;
      fill(0, 150, 255);
      pushMatrix();
      translate(x, y);
      rotate(radians(d + frameCount));
      ellipse(x, y, 5, 5);
      popMatrix();
    } 
  }
}


