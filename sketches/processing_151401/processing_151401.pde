
void setup(){
  frameRate(25);
size (720, 720);
}

void draw(){

for (int x = 0; x<36; x++) {
  for (int y = 0; y<36; y++) {
    rect(x*20,y*20,20,20);
    triangle(x*20,y*20+random(20), x*20+random(20),y*20, x*20+random(20),y*20+20);
  }
}
}
