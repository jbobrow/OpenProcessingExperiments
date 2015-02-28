
int num = 11; //number of circles
float angle, destx, desty, dif;
float[] px = new float[num];
float[] py = new float[num];
float[] psz = new float[num];
float scal = 1.2;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(#eeeeee);
  //frameRate(20);

  destx = width/2;
  desty = height/2;

  float sz = width*.75; //start size for the left series of circles
  float incr = sz/num*1.7; // value the circles decrease each step
  float sz2 = sz-incr/2; //start size for the right series of circles
  dif = incr/4; //value added to x to get the center for the right series of circles 
  float sw = dif*.60; //strokeWeight
  
  strokeWeight(sw);

  for (int i=0; i<num;  i++) {
    float x = destx + sin(angle)*width*scal;
    float y = desty + cos(angle)*height*scal;
    px[i] = x; 
    py[i] = y; 
    angle -= TWO_PI/num;
    if (i%2==0) {
      sz -= incr;
      psz[i] = sz;
    } 
    else {
      sz2 -= incr;
      psz[i] = sz2;
    }
  }
  
}
void draw() {
  background(255);

  for (int i=0; i<num; i++) {
    float col=(360/num)*i;
    float s = 100-(100/num)*i;
    stroke(360, 10, 15);
    py[i] = lerp(py[i], desty, 0.05);
    if (i%2==0) {
      fill(col, s, 90);
      px[i] = lerp(px[i], destx, 0.05);
      ellipse(px[i], py[i], psz[i], psz[i]);
    } 
    else {
      fill(col, s, 90);
      px[i] = lerp(px[i], destx+dif, 0.1);
      ellipse(px[i], py[i], psz[i], psz[i]);
    }
  }
  
}

