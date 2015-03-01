
float xstart, xnoise, ynoise, ystart;

void setup(){
  size(300,300);
  smooth();
  background(255);
  frameRate(24);
  xstart = random(10);
  ystart = random(10); 
}
//  xnoise = xstart;//(10);
//  ynoise = random(10);



//rupu
void draw(){
  background(0);
  
  xstart+= 0.01;
  ystart+= 0.01;
  
  xnoise = xstart;
  ynoise = ystart;  
  
  for(int y = 0; y <= height; y+=100){
  ynoise += 0.1;
  xnoise = xstart;
  
    for(int x = 0; x <=width; x+=20){
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
      
    }
  }
}


void drawPoint(float x, float y, float noiseFactor){
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  noStroke();
  
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor*150);
  float alph = 150 + (noiseFactor*150);
  fill(grey,alph);
  ellipse(0,0,edgeSize, edgeSize/2);
  line(0, 0, 20, 0);
  popMatrix();
  /*float len = 10*noiseFactor;
  rect(x, y, len, len);*/
}
  
  
