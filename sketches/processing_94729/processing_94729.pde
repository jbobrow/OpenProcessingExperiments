
void setup(){

  size(1200,700);
  frameRate(10);
}
void draw(){
    background(255);
  float a = 0.0;
float inc = TWO_PI/mouseX*4;

for (int i = 0; i < 1200; i=i+4) {
  line(i, mouseY, i, 350+sin(a)*40.0);
  a = a + inc;
}

}


