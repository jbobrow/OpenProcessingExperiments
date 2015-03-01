
void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  for(int a = 0; a < 100; a++){
    stroke(random(255),random(255),random(255));
    line(250, 250, a*20, 0);
    line(250, 250, 0, a*20);
  }
}


