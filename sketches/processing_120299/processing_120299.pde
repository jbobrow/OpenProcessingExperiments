
//Flowering flowers
//Test 014-02 [Date:20131112] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 æ��ç��å��

//Flowering SAKURA
//Mousepressed become midnight
//Pressed key "f"or"F" ,then become green ground

float x, y, r, rNoise, customNoise, rad, thisRadius;


void setup() {
  size(500, 500);
  background(255);
  smooth();
  //noLoop();
  frameRate(1);
}

void draw() {

  stroke(247, random(135, 10), 42);
  strokeWeight(0.5);

  float a = random(10);
  float b = random(width);
  int c = int(random(height));
  drawFlower(a, b, c);
 
}

void drawFlower(float x, float y, int centerY) {

  rNoise = random(10);
  r = random(8);

  beginShape();
  fill(241, 200, 247, 50);
  int centX =  int(random(width));
  int centY =  int(random(height));
  for (float ang=0; ang<=360*8; ang+=5) {
    rNoise += 0.2;
    r += 0.1;
    rad = radians(ang);  
    thisRadius = r + ((pow(sin(rNoise), int(rNoise)))*120) - 50;
    x = centX + (thisRadius* cos(rad));
    y = centY + (thisRadius* sin(rad));
    curveVertex(x, y);
  }
  endShape();
  
  drawclearBackground();
} 

void drawclearBackground() {

  if (mousePressed) {
    background(0);
  }
  else if (keyPressed) {
    if (key == 'f' || key == 'F') {
      background(101, 178, 127, 70);
    }
  }
}



