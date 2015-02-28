


void setup(){

  size(1200,700);

}
void draw(){
    background(0);
    stroke(255);
  float a = 0.0;
  float b ;
float inc = PI/random(10);
 
for (int i = 0; i < 1200; i=i+4) {
  line(i, random(700), i, mouseY+sin(a)*400.0);
  a = a + inc;
  b = mouseX/80;
    frameRate(5+b);
}
 
}
