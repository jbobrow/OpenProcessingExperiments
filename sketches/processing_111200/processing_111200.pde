
void setup(){
  size(800, 600);
  background(255);
  noStroke();
  frameRate(30);
  smooth();
}
void draw(){
  for(int i=0; i<=30; i = i + 1){
    float j = random(10);
    fill(random(200),random(10),random(100), random(100));
    ellipse(random(800),random(600),j,j);
  }
    for(int i=0; i<=30; i = i + 1){
    float j = random(45);
    fill(random(80),random(240),random(80), random(100));
    ellipse(random(800),random(600),j,j);
  }
}
