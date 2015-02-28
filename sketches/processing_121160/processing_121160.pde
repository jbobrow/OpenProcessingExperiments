
//20131106 InClassPractice
//TePangChiang
//Disco ball takeoff it's clothing
int radius = 100;
float xstart, xnoise, ystart, ynoise;
void setup() {
size(600,600,P3D);
frameRate(10);
loop();
  xstart = random(10);
  ystart = random(10);
}

void draw(){
  
 pushMatrix();
  background(0);
    xstart += 0.5;
    ystart += 0.5;
    xnoise = xstart;
    ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
  ynoise += 0.1;
  xnoise = xstart;
  for (int x = 0; x <= width; x+=5) {
  xnoise += 0.1;
  drawPoint(x, y, noise(xnoise, ynoise));
  }
 }
 popMatrix();
 
 pushMatrix();
  translate(300, 300, 0);
  stroke(0,250,150,random(50,100));
  ball();
  scale(random(0.5,0.8));
  stroke(0,250,100,random(50,100));
  ball();
  scale(random(1.8,2));
  stroke(0,250,200,random(50,100));
  ball();
 popMatrix();
}
  
void drawPoint(float x, float y, float noiseFactor) {
pushMatrix();
float len = 8 * noiseFactor;
translate((x*0.25)-75, 600-y, -y);
float sphereSize = noiseFactor * 35;
fill((x/5)+random(150),(x/10)+random(100),(x+y)/5+random(150),random(50,230));
noStroke();
ellipse(x, y, len, len);
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
  t += 0.4;
  float radianS = radians(s);
  float radianT = radians(t);
  float thisx = 0 + (radius*cos(radianS)*sin(radianT));
  float thisy = 0 + (radius*sin(radianS)*sin(radianT));
  float thisz = 0 + (radius*cos(radianT));
  if (lastx != 0) {
  line(thisx, thisy, thisz, lastx, lasty, lastz);
  }
  lastx = thisx;
  lasty = thisy;
  lastz = thisz;
 }
}


