
float disperX, disperY, x, y;
void setup() {
  size (700, 700);
  background(255);

  smooth();
  disperX=1*width;
  disperY=1*height;
  x=width/2;
  y=height/2;
}

void draw() {
  noFill();
  strokeWeight(0.5);
  stroke(random(255));
  float dsprt=1.8;
  
  //calculates the parameters to the bezier
  float a=dispers(-width/8, width/8);
  float b=dispers(-height/8, height/8);
  float c=dsprt*dispers(-width/2, width/2);
  float d=dsprt*dispers(-height/2, height/2);
  float e=dsprt*dispers(-width/2, width/2);
  float f=dsprt*dispers(-height/2, height/2);
  

  translate(width/2, height/2);
  bezier(a, b, c, d, e, f, a, b);
}

float dispers(float rangeF, float rangeT) { 
  // calculates random normally distributed
  int iter=4;
  float disper=0;
  for (int i=0; i<iter; i++) {
    disper+=random(rangeF, rangeT);
  } 
  return disper/iter;
}

void keyPressed() {
  if (key=='a') {
    background(255);
  }
  else {
   if (key=='s') save("bezier"+second()+".jpg");
  }
}

