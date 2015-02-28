
//Adding Dimensions
//A noise grid & P3D 
//Test 017 [Date:20131111] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//P3D + A Noise Grid 
//Spring
//Wind & Insect & Grass

float xstart, ystart, x1start, y1start, x2start, y2start;
float xnoise, ynoise, x1noise, y1noise, x2noise, y2noise;

void setup() {

  size(600, 300, P3D);
  //background(137, 193, 135, 30);
  //background(100, 133, 160, 30);
  //background(232, 238, 245, 10);
  //background(85, 85, 84, 10);//Night
  background(191, 215, 242, 70);
  sphereDetail(30);
  xstart = random(600);
  ystart = random(300);
  x1start = random(100);
  y1start = random(100);
  x2start = random(50);
  y2start = random(50);

  
}

void draw() {

  background(191, 215, 242, 70);

  xstart += 1;
  ystart += 0.12;
  xnoise = xstart;
  ynoise = ystart;
  x1start += 0.1;
  y1start += 0.5;
  x1noise = x1start;
  y1noise = y1start;

  float x2start = random(5);
  float x2noise = x2start;
  float y2noise = random(15);


  for (int y = 0; y <= height; y += 20) {
    ynoise += 0.8;
    for (int x = 0; x <= width; x += 15) {
      xnoise += 0.5;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }

  for (int y1 = 0; y1 <= height; y1 += 5) {
    y1noise += 0.15;
    for (int x1 = -1*width/2; x1 <= width*2; x1 +=1) {
      x1noise -= 0.2;
      drawBox(x1, y1, noise(x1noise, y1noise));
    }
  }

  for (int y2 = 0; y2 <= height; y2 += 20) {
    y2noise += 0.8;
    x2noise = x2start;
    for (int x2 = 0; x2 <= width; x2 += 15) {
      x2noise += 0.5;
      drawInsect(x2, y2, noise(x2noise, y2noise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  frameRate(6);
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(180));
  float XX = 600*noiseFactor;
  float YY = 300*noiseFactor;
  int alph = int(noiseFactor*100);
  stroke(91, 131, 31, alph);
  line(x, y/300, 10, XX/4, YY/2, 0);
  popMatrix();
}
void drawBox(float x1, float y1, float noiseFactor) {
  frameRate(3);
  pushMatrix();
  translate(x1*5, 300-y1, -y1*5);
  float boxSize = noiseFactor * 20;
  int alph = int(noiseFactor*200);
  box(boxSize);
  fill(137, 193, 135, alph);
  //noStroke();
  strokeWeight(2);
  popMatrix();
}

void drawInsect(float x2, float y2, float noiseFactor) {
  frameRate(2);
  pushMatrix();
  translate(x2, y2);
  rotate(noiseFactor*radians(720)); 
  float edgeSize = noiseFactor*32; 
  float R = 242+(noiseFactor*244);
  float G = 165+(noiseFactor*244);
  float B = 20+(noiseFactor*244);
  fill(R, G, B);
  stroke(247, 255, 167);
  strokeWeight(1);
  ellipse(x2, y2, edgeSize/2, edgeSize/6);
  popMatrix();
}



