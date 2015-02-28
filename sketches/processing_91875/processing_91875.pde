
float d1 = 0;
float d2 = 0;

final int SPEED = 50;

void setup(){
  size(600, 600);
  stroke(255, 4);
  background(0);
}

void draw(){
  for(int i = 0; i < SPEED; i++){
      float p1x = cos(radians(d1)) * 250 + width / 2;
      float p1y = sin(radians(d1)) * 250 + width / 2;
    
      float p2x = cos(radians(d2)) * 200 + width / 2;
      float p2y = sin(radians(d2)) * 200 + width / 2;
      
      line(p1x, p1y, p2x, p2y);
      
      d1 += 0.49;
      d2 += 1.01;
    }
}
