
float w=200;
float r=100;
float g=100;
float b=100;

void setup(){
  size(200,200);
  background(255);
}
void draw(){
  ellipseMode(CENTER);
  while(w<=10)
  {
    frameRate(3);
    noStroke();
    fill(r,g,b);
    ellipse(100,100,w,w);
    w=w-10;
    r=random(255);
    g=random(255);
    b=random(255);
  }}
