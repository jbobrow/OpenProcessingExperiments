
//Flowering flowers
//Test 014-02 [Date:20131112] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 Ã�Â¦Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â§Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â¥Ã¯Â¿Â½Ã¯Â¿Â½

//Flowering SAKURA
//Mousepressed become midnight
//Pressed key "f"or"F" ,then become green ground

float x, y, r, rNoise, customNoise, rad, thisRadius;


void setup() {
  size(500, 500);
  background(255);
  smooth();
  //noLoop();
  frameRate(3);
}

void draw() {

  strokeWeight(0.5);

  float a = random(10);
  float b = random(width);
//  int c = int(random(height));
  drawFlower(a, b);
 
}

void flor(int cx, int cy, float ang) {
   stroke(random(135, 10), random(135, 10), random(135, 10), 150); 
  if (ang<=360*10) { // dibujar
    rNoise += 0.2;
    r += 0.1;
    rad = radians(ang);  
    thisRadius = r + ((pow(sin(rNoise), int(rNoise)))*120) - 60;
    x = cx + (thisRadius * cos(rad));
    y = cy + (thisRadius * sin(rad));
    curveVertex(x, y);
  } else {
      return;
  }
  flor(cx,cy,ang+5);
}



void drawFlower(float x, float y) {

  rNoise = random(10);
  r = random(8);

  beginShape();
  fill(241, 200, 247, 100);
  int cx =  int(random(width));
  int cy =  int(random(height));
  flor(cx,cy,0.0); // funcion recursiva
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

