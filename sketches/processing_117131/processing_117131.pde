
//Random test
//Wiggle line
//Test 010 [Date:20131023] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛



void setup() {
  size(600, 200);
  //noLoop();
}

void draw() {

  background(124, 152, 175);
  strokeWeight(10);//line
  stroke(80, 155, 98, 60);
  //line(20, 100, 580, 100);
  line(20, 20, 580, 180);

  stroke(252);
  strokeWeight(3);//line random
  

  int step = 20;
  float ystep = 20;
  float lastx = -999;
  float lasty = -999;
  float y = 20;
  int border = 20;
  int bordery = 10;


  for (int x=border; x<=width-border;x+=step) {  

    ystep = random(height-2*bordery);
    //ystep = random(30)-15;
    y += ystep/16;

    if (lastx > -999 ) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}



