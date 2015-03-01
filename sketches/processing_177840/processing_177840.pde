
void setup(){
  size(320, 320);
  noStroke();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int x = -50; x <= 50; x+=20){
    for(int y = -50; y <= 50; y+=20){
      float d = dist(x, y, 0, 0);
      float d2 = sin(radians(d))*d;
      fill(0, 150, 255);
      pushMatrix();
      translate(x, y);
      rotate(radians(d + frameCount * 5));
      ellipse(x, y, 5, 5);
      popMatrix();
    } 
  }
}


