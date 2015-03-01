
void setup() {
  size(500,500);
  smooth();
  noStroke();
  noise(4);
}
 
float a = 0;
float s = TWO_PI/180;
 
void draw() {
  Lines();
  a+=s;
}

 float randomC() {
  float r = random(0,1);
  float ang = sin(TWO_PI*random(0,1));
  return r*ang;}

void Lines() {
  background(42,156,255);
   for(int j=50;j<450;j+=25) {
     for(int i=50;i<450;i++) {
      if(j!=50 && j!=440) { //grid
      float step = sin(a)*(sin((i)*PI/40.0));
       float swing = j+step*(noise(a+i/300, a+j/300,a/10)-90.0);
       float dx = randomC()/2;
       float dy = randomC()/2;
       float x = i+dx;
       float y = swing+dy;
       ellipse(x,y,2,2);
     
    }
  }
 }
 
}

