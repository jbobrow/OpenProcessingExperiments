
int space=50;
void setup(){
  size(200,400);
  smooth();
  noStroke();
}

void draw(){
  background(182,183,198);
  for(int x = 0; x < 200; x = x + 1){
    for(int y = 0; y < 400; y = y + 1){
      fill(129,27,31);
      ellipse(x*space,y*space/2,20,20);
    }
  }
}

