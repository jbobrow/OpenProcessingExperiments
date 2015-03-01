
void setup() {
  size(300, 300);

  colorMode(RGB,256);
  background(250, 250, 210);
  frameRate(12);
}
//side 
void draw() {

for(int i=0 ; i < 5 ; i++) {
  noFill();
  smooth();
  stroke(0, 128, 128, 95);
  ellipse(random(300), random(300), 150, 150);
  
}
//center
  noStroke();
  fill(152, 251, 152, 95);
  smooth();
  ellipse(150, 150, 150, 150);
  textSize(24);
  textAlign(CENTER);
  color(0, 0, 0);
  text("hello world", 150, 250);
  
for(int i=0 ; i < 20 ; i++) {
  fill(random(0), random(256), random(256), random(50));
  
  int x = 50;
  int y = 80;
  ellipse(random(300), random(300), y, y);
  ellipse(random(300), random(300), x, x);
  
  } 
}


