
//Flowering flowers
//Test 014 [Date:20131105] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//Flowering SAKURA
//Mousepressed become midnight
//Pressed key "f"or"F" ,then become green ground


void setup() {
  size(500, 500);
  background(255);
  smooth();
  //noLoop();
  frameRate(0.8);
}

void draw() {

  clearBackground();

  stroke(247, random(135, 10), 42);
  strokeWeight(0.5);
  float x, y;
  float radius = 10;
  float radiusNoise = random(10);
  float noisecal =random(20, 5);
  //float lastx = -999;
  //float lasty = -999;

  int centX =  int(random(width));
  int centY =  int(random(height));

  beginShape();
  fill(241, 200, 247, 50);
  for (float ang=0; ang<=360*6; ang+=6) {
    radiusNoise += 0.2;
    radius += 0.1;

    float thisRadius = radius + (noise(radiusNoise)*100) - 50;
    float rad = radians(ang);

    x = centX + (thisRadius* cos(rad));
    y = centY + (thisRadius* sin(rad));
    curveVertex(x, y);
  }
  endShape();

  /* if (lasty > -999) {
   line(x, y, lastx, lasty);
   }
   lastx = x;
   lasty = y;
   }*/
}


void clearBackground() {

  if (mousePressed) {
    background(0);
  }
  else if (keyPressed) {
    if (key == 'f' || key == 'F') {
      background(101, 178, 127, 70);
    }
  }
}



