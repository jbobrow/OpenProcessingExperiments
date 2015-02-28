
void setup(){
  size(400, 400);
  frameRate(10);
  
}

void draw(){
  background(0);
  stroke ((random(0, 50)), (random(0, 50)), (random(0, 50)));
  line (0, (random(200,215)), 400, (random(200,215)) );
}
