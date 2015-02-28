
float[] x = new float[20];
float[] y = new float[20];

float segLength; 
int a=0;
int wormsize;
int wormgrowthrate;
int b;
void setup() {
  strokeWeight(1);
  size(640, 360);
  
  stroke(204,114,61,100);
  wormsize = 10;
  wormgrowthrate=2;
}


void draw() {
 if (mouseX>=0 && 32>mouseX) { segLength = 1;}
 if (mouseX>=33 && 64>mouseX) { segLength = 2;}
 if (mouseX>=65 && 96>mouseX) { segLength = 3;}
 if (mouseX>=97 && 128>mouseX) { segLength = 4;}
 if (mouseX>=129 && 160>mouseX) { segLength = 5;}
 if (mouseX>=161 && 192>mouseX) { segLength = 6;}
 if (mouseX>=193 && 224>mouseX) { segLength = 7;}
 if (mouseX>=225 && 256>mouseX) { segLength = 8;}
 if (mouseX>=257 && 288>mouseX) { segLength = 9;}
 if (mouseX>=289 && 320>mouseX) { segLength = 10;}
 if (mouseX>=321 && 352>mouseX) { segLength = 11;}
 if (mouseX>=353 && 384>mouseX) { segLength = 12;}
 if (mouseX>=385 && 416>mouseX) { segLength = 13;}
 if (mouseX>=417 && 448>mouseX) { segLength = 14;}
 if (mouseX>=449 && 480>mouseX) { segLength = 15;}
 if (mouseX>=481 && 512>mouseX) { segLength = 16;}
 if (mouseX>=513 && 544>mouseX) { segLength = 17;}
 if (mouseX>=545 && 576>mouseX) { segLength = 18;}
 if (mouseX>=577 && 608>mouseX) { segLength = 19;}
 if (mouseX>=609 && 640>mouseX) { segLength = 20;}
  strokeWeight(b);
  background(0);
  dragSegment(0, wormsize, mouseY);
  
  if (wormsize >= width){
    wormgrowthrate = -2;
  }
  else if (wormsize <= 0){
    wormgrowthrate = 2;
  }
  
  wormsize = wormsize + wormgrowthrate;
  
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
    
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  //stroke(204,114,61);
  line(0, 0, segLength, 0);
  popMatrix();
}

void mouseClicked() {
  b++;
}
