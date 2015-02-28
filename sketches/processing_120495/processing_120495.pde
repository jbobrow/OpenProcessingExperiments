
//Kang-Yu,Liu  suling11@ms55.hinet.net
//first light of spring morning
//reference - #STUDY/P3D, Chen Yi Wu.
//reference - Flowers, Kevin Middleton.


float xstart, xnoise, ystart, ynoise;
float wxstart, wxnoise, wystart, wynoise;
float oxstart, oxnoise, oystart, oynoise;
float xstartNoise, ystartNoise;

int xMin =50;
int yMax, xMax;
int yMin =50;



void setup() {
  size(500, 350, P3D);
  background(130, 202, 200); 
  sphereDetail(30);
  frameRate(10);
  xstartNoise = random(50);
  ystartNoise = random(80);
  xstart = random(40);
  ystart = random(60);
  wxstart = random(30);
  wystart = random(30);
  oxstart = random((50)-30);
  oystart = random((50)-30);
  yMax = height/2;
  xMax = width/2;
}


void draw() {

  background(130, 202, 200, 30); 
  xstartNoise += 0.1;
  ystartNoise += 0.1;
  xstart +=(noise(xstartNoise)*0.5)-0.25;
  ystart +=(noise(ystartNoise)*0.5)-0.25;
  xnoise = xstart;
  ynoise = ystart;
  wxstart += 0.1;
  wystart += 0.5;
  wxnoise = wxstart;
  wynoise = wystart;

  float oxstart = random(5);
  float oxnoise = oxstart;
  float oynoise = random(15);

  for (int y = 0; y <= height; y+=8) {
    ynoise += 0.5;
    xnoise = xstart+1;
    for (int x = 0; x <= width; x+=15) {
      xnoise += 0.5;
      cloud(x, y+0.1, noise(xnoise, ynoise));
    }
  }

  for (int oy =0; oy <=height/2;oy +=13) {
    oynoise +=0.5;
    oxnoise = oxstart;
    for (int ox = 0; ox<=width;ox +=13) {
      oxnoise +=0.5;
      Odaisy(ox, oy, noise(oxnoise, oynoise));
    }
  }
}


//cloud
void cloud(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x+3, y-1, y+=10);


  rotate(noiseFactor*random(50));
  float edgeSize = noiseFactor *20;
  float red =199+ (noiseFactor*3);
  float air = 25 +(noiseFactor*20);
  noStroke();
  fill(red, 255, 250, air);
  ellipse(0, 0, edgeSize*1.3, edgeSize*1.3);
  popMatrix();
}

//orang daisy
void Odaisy(float ox, float oy, float onoiseFactor) {
  float transparent = 20+(onoiseFactor/12);

  fill(255, 231, 0, transparent);
  strokeWeight(2);
  stroke(212, 121, 93, transparent/3);
  //position
  translate(noise(xMin, xMax), noise(yMin, yMax), 0);
  //number

  for (float rot = 0;rot<(360);rot+=(15*PI)) {
    rot +=0.5;

    pushMatrix();
    rotate(rot);
    beginShape();
    vertex(ox, oy, random(rot));
    bezierVertex(ox, oy, random(rot), ox, oy+31, random(10), ox+14, oy+13, random(10));

    bezierVertex(ox+14, oy+13, random(10), ox-14, oy+17, random(10), ox, oy, random(rot));
    endShape();    
    popMatrix();
  }
}



