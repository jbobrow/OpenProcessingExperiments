
//Stores size-3 arrays with r, g, b
ArrayList<float[]> colors;
//timestep
int t = 0;
float freq1 = PI/111;
float freq2 = PI/213;
float freq3 = PI/437;
float phase1 = 0;
float phase2 = 0;
float phase3 = 0;
int sqstep = 6;
int w = 750;
int h = 750;
int sqnum = w/(sqstep*2);
boolean drawn = false;

void setup() {
  smooth();
  size(w,h);
  background(255);
  colors = new ArrayList<float[]>();
  frameRate(60);
}

void draw() {
  for(int i=0;i<sqnum;i++) {
    float[] rgb = getNextColor(i+t);
  
    pushMatrix();
    pushStyle();
  
    int sqsize = i*sqstep;
    translate(sqsize,sqsize);
    noStroke();
    fill(rgb[0],rgb[1],rgb[2]);
    rect(0,0,width-sqsize*2,height-sqsize*2);
  
    popStyle();
    popMatrix();
  
    /*int i = 0;
    for(float[] rgb : colors) {
      pushMatrix();
      pushStyle();
    
      int sqsize = i*sqstep;
      translate(sqsize,sqsize);
      fill(rgb[0],rgb[1],rgb[2]);
      rect(0,0,width-sqsize*2,height-sqsize*2);
    
      popStyle();
      popMatrix();
      i++;
    }*/
  
  }
  t++;
}

float[] getNextColor(int i) {
  float rs = sin(freq1*i + phase1);
  float r = map(rs,-PI,PI,0,255);
  float gs = sin(freq2*i + phase2);
  float g = map(gs,-PI,PI,0,255);
  float bs = sin (freq3*i + phase3);
  float b = map(bs,-PI,PI,0,255);
  float[] rgb = {r,g,b};
  return rgb;
}

