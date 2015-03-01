
void setup() {
  size(500,500);
  smooth();
  noStroke();
  noiseDetail(4);
}

float a = 0;
float s = TWO_PI/120;

void draw() {
  doLines();
  a+=s;
}

void doLines() {
  background(226,210,184);
   for(int j=50;j<450;j+=25) {
     for(int i=50;i<450;i++) {
      if(j!=50 && j!=440) { //grid
      float step = sin(a)*(sin((450-i)*PI/400.0));
       float swing = j+step*(180.0*noise(a+i/300.0, a+j/300.0,a/10.0)-90.0);
       float dx = randomC()/2;
       float dy = randomC()/2;
       float x = i+dx;
       float y = swing+dy;
       fill(20,150-150*sqrt(sq(dx)+sq(dy))); // pencil effect
       ellipse(x,y,2,2);
    }
  }
 }

}

//pseudo
float randomC() {
  float r = random(0,1);
  float ang = sin(TWO_PI*random(0,1));
  return r*ang;
}
