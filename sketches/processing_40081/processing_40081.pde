
float angle = 0.0;

void setup() {
  size(200,200);
  //fill(0);
  smooth();
}

void draw() {
  background(0);
translate(width/2,height/2);
for (int i = 0; i<15; i++) {
  scale(1.0);
  rotate(angle);
  fill(0,255,255);
  rect(0,0,50,50);
  fill(255,255,0);
  ellipse(0,0,40,40);
}
angle-=0.1;

}               
