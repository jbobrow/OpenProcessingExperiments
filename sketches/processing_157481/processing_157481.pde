
void setup() {
 size(500,500);
 colorMode(HSB,100);
 background(0);
 noFill(); 
}

void draw() {
  translate(width/2,height/2);
  float zoom = frameCount*.01%3;
  scale(zoom);
  for(int i = 0 ; i < 100 ; i++) {
    stroke(0,0,100-i);
    line(0,0,0,i);
    rotate(second()*i/TWO_PI);
  }
}
