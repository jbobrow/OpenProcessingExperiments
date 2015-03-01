
float k = 2/7.0;
 float i = 0;

void setup() {
  size(400, 400);
  background(0,190,90);
}
void draw() {
  translate(width/2, height/2);
  float t = frameCount / 70.0;
  float x = 200*cos(k*t) * sin(t);
  float y = 200*cos(k*t) * cos(t);
 if (i > 100){
 i=-1;
 }
  stroke(155+i,10+i,80+i);
  i += .1;
  line(0, 0, x, y);
 
}
