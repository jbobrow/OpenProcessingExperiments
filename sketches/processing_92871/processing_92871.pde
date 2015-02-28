
float xstart, ystart, squaresize;

void setup() {
  size(800, 600);
  xstart = random(30);
  ystart = random(30);
  squaresize = height/8;
}

void draw() {
  background(0);
  fill(0,0,0,5);
  noStroke();
  rect(0, 0, width, height);
  drawStuff();
  drawStuff2();
  drawStuff3();
  drawStuff4();
  drawStuff5();
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 12, y * noiseFactor * 9);
  float edgeSize = noiseFactor * 9;
  ellipse(2, 2, edgeSize, edgeSize);
  popMatrix();  
}
void drawStuff(){
   fill(11,255,11);
xstart += 0.06;
  ystart += 0.06;
  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.08;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=4) {
      xnoise += 0.07;
      drawPoint(x,y, noise(xnoise, ynoise));
    }
  } 
}
void drawStuff2(){
 fill(255,11,11);
xstart += 0.02;
  ystart += 0.02;
  translate(width/20, height/20);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.08;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=4) {
      xnoise += 0.07;
      drawPoint(x/cos(x),y*tan(y), noise(xnoise, ynoise));
    }
  } 
}
void drawStuff3(){
 fill(11,11,255);
xstart += 0.02;
  ystart += 0.02;
  translate(width/20, height/4);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.08;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=4) {
      xnoise += 0.07;
     drawPoint(x-cos(y),log(y/tan(x)), noise(xnoise, ynoise));
    }
  } 
}
void drawStuff4(){
 fill(11,11,150);
xstart += 0.02;
  ystart += 0.02;
  translate(width/20, height/9);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.08;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=4) {
      xnoise += 0.07;
     drawPoint(x-cos(y),log(y/tan(x)), noise(xnoise, ynoise));
    }
  } 
}
void drawStuff5(){
 fill(235);
xstart += 0.02;
  ystart += 0.02;
  translate(-100,-550);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.08;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=4) {
      xnoise += 0.03;
     drawPoint(x-cos(y),log(y+tan(x)), noise(xnoise, ynoise));
    }
  } 
}


