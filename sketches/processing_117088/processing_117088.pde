
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
  line(20, 100, 580, 100);
  
  strokeWeight(2);//line random
  stroke(random(252));
  line(20, 100, 580, 100);
  
  
  int step = 15;
  float ystep = 5;
  float lastx = -999;
  float lasty = -999;
  float y = 100;
  int border = 20;
  //int bordery = 20;
  
  for (int x=border; x<=width-border;x+=step) {
    
    //y = bordery+random(height-2*bordery);
    ystep = random(20)-10;
    y+= ystep/2;
    
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}



