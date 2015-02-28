
//Random test
//Wiggle line test
//Test 011 [Date:20131029] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

int s = second();
int div = 5;

void setup() {
  size(500, 500);
  //noLoop();
}

void draw() {
  background(206, 229, 204);
  for (int i = 50; i<500; i+=25) {
    wiggleline(10, i, 500, i);
  }
}

void wiggleline(float x1, float y1, float x2, float y2) {

  stroke(252);
  strokeWeight(random(15)); 
  line(x1, y1, x2, y2);


  float xstep = (x2 - x1)/div;
  float ystep = (y2 + y1)/div;
  float lastx = x1;
  float lasty = y1;
  float x = x2;
  float y = y2;


  for (int i=0; i<div;i++) {  

    x = x + xstep;
    x = x + random(20)-10;
    y = y + ystep;
    y = y + random(20)+30;

    line (lastx, height-lasty, x, height-y);

    lastx = x;
    lasty = y;
  }
}



