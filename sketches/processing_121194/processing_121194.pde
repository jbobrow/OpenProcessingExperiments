
//Assignment_5_Spring  11/13
//TePangChiang
//a happy "ball family" :D
//move mouse to effect noiseFactor of grass and flowers

float S = second();
int radius = 100;
float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;

void setup() {
size(600,600,P3D);
frameRate(5);
  xstart = random(10);
  ystart = random(10);
}

void draw(){
  
 background(230);
 
 //grass 
 pushMatrix();
  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart +=(noise(xstartNoise)*0.5)-0.25;
  ystart +=(noise(ystartNoise)*0.5)-0.25;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;                                    
    xnoise = xstart;
    for (int x = 0; x <= width+800; x+=5) {
      xnoise += 0.1;    
      drawGrass(x, y, noise(xnoise, ynoise));
    }
  }
 popMatrix();
  
 //flower 
 pushMatrix();
    xstart += 0.5;
    ystart += 0.5;
    xnoise = xstart;
    ynoise = ystart;
  for (int y = 0; y <= height+750; y+=15) {
  ynoise += 0.1;
  xnoise = xstart;
  for (int x = 0; x <= width+1000; x+=15) {
  xnoise += 0.1;
  drawPoint(x, y, noise(xnoise, ynoise)*(mouseY/200));
  }
 }
 popMatrix();
 
 //ball
 pushMatrix();
  translate(300, 100, 0);
  stroke(250,80,0,random(100,200));
  ball();
  stroke(250,160,0,random(100,200));
  scale(0.8);
  ball();
  stroke(250,200,0,random(100,200));
  scale(0.4);
  ball();
 popMatrix();

}
  
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
   float len = 8 * noiseFactor;
   translate((x*0.5)-800, 600-y, -y);
   fill((x/5)+mouseX%200,(x/10)+mouseY%150,(x+y)/5+random(100,150),random(100,230));
   noStroke();
   ellipse(x, y, len*random(1.2,2.4), len*random(1.2,2.4));
  popMatrix();
}

void ball(){
  rotateY(frameCount * 0.3);
  rotateX(frameCount * 0.4);
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
  s += random(10,30);
  t += 0.2;
  float radianS = radians(s);
  float radianT = radians(t);
  float thisx = 200 + (radius*cos(radianS)*sin(radianT));
  float thisy = 200 + (radius*sin(radianS)*sin(radianT));
  float thisz = 100 + (radius*cos(radianT));
  if (lastx != 0) {
  line(thisx, thisy, thisz, lastx, lasty, lastz);
  }
  lastx = thisx;
  lasty = thisy;
  lastz = thisz;
 }
}

void drawGrass(float x, float y, float noiseFactor) {   
  pushMatrix();
  translate(x-400, 1100-y, -y);
  rotate(noiseFactor * radians((mouseX%600)+100));
  stroke(0, random(50,100), 0, 55);
  line(0, 0, 12, 0);
  popMatrix();
}




