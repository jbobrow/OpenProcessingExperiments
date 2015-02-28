
int x, y;
float r,g,b,a;
void setup() {
  size(800,800);
  frameRate(5);
  smooth(100);
}
void draw(){
  background(255);
  stroke(150);
  fill(r,g,b,a);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(130);
int dx = 400, dy = 400;
for (int y = 200; y <= height-10; y = y + dy) {
  for (int x = 200; x <= width-10; x = x + dx) {
    ellipse(x, y, 200, 200);
}
}
noStroke();
fill(r,g,b,a);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
line(400,0,400,800);
line(0,400,800,400);
x = floor(random(width));
y = floor(random(height));
if (mouseX < 400 && mouseY < 400){
  rect(0,0,400,400);
}  else 
if (mouseX >400 && mouseY < 400){
  rect(400,0,400,400);
}  else
if (mouseX <400 && mouseY > 400){
  rect(0,400,400,400);
} else
if (mouseX > 400 && mouseY > 400){
  rect(400,400,400,400);
}
  }


