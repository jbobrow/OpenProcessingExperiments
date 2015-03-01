
void setup(){
size (720, 720);
background(20,100);
frameRate(25);
}
void draw(){
for (int x = 0; x<36; x++) {
  for (int y = 0; y<36; y++) {
    strokeWeight(random(0,1));
    stroke(random(200,255));
    fill(random(0,50),random(400));
    rect(x*20,y*20,20,20);
    fill(255,random(100,400));
    noStroke();
    triangle(x*20,y*20+random(20), x*20+random(20),y*20, x*20+random(20),y*20+20);
  }
}
}

