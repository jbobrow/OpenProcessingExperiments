
void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
  background(#eeeeee);

  translate(width/2, height/2);

  int num = 12; //number of circles
  float sz = width*.75; //start size for the left series of circles
  float incr = sz/num*2; // value the circles decrease each step
  float sz2 = sz-incr/2; //start size for the right series of circles
  float dif = incr/4; //value added to x to get the center for the right series of circles 
  float sw = dif*.60; //strokeWeight

  strokeWeight(sw);

  for (int i=0; i<num;  i++) {
    float col=(360/num)*i;
    float b = 100-(100/num)*i;
    stroke(360, 10, 22);
    if (i%2==0) {
      fill(col, b, 100);
      ellipse(0, 0, sz, sz);
      sz -= incr;
    } 
    else {
      fill(col, b, 100);
      ellipse(0+dif, 0, sz2, sz2);
      sz2 -=incr;
    }
  }
}
