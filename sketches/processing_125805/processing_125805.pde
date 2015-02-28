
float R;
float g;
float b;
float r = 0;
int value;
float t = 0;
void setup()
{
  rectMode(CENTER);
  size(800,800);
  value = 0;
  R = random(1,100);
  b = random(1,100);
  g = random(1,100);
  background(R,g,b);
}
void draw()
{
  noStroke();
  smooth();
  DrawRect();
 translate(width / 2, height / 2);
rotate(r);
rotate(t);
fill(value);
for (int i = 0; i < 100; i = i+10) {
  ellipse(i,i,10,10);
  r = r + .01;
  t = t - .02;
}

}
void DrawRect()
{
 fill(R,g,b,50);
 rect(width/2,height/2,width,height);
}
void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
void keyPressed() {
  if (t == 0) {
    t = 0;
  } else {
    t = 255;
  }
}

