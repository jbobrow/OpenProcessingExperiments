
void setup (){
size (400,400);
smooth();
}
void draw(){
  background(120);
  frameRate(20);
  for (int i=0; i<width; i+=20) {
    stroke(random(200));
    line(i, random(0,400), i, random(0,400));
    fill(255,10);
    ellipse(i, random(0,400),random(4), i);

  }
}

