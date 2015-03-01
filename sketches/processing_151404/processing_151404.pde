
void setup(){
size (720, 720);
background(random(255),random(100));
frameRate(25);
}

void draw(){

for (int x = 0; x<36; x++) {
  for (int y = 0; y<36; y++) {
    strokeWeight(random(0,1));
    stroke(random(150,220));
    fill(random(150,255),random(100));
    rect(x*20,y*20,20,20);
    fill(random(0,100),random(40,300));
    noStroke();
    triangle(x*20,y*20+random(20), x*20+random(20),y*20, x*20+random(20),y*20+20);
  }
}
saveFrame("frames/####.tif");
}

