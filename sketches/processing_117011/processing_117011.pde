
//A wrong way draw a line 
//draw a line point by point , but keep a distance from the next point, and keep loop
//noise the next point's y coordinate and preserves transparency 

//chiming lu 



void setup() {
  size(500, 100);
  //noLoop();
  
}

void draw() {
  //background(255);
  float xstep = 10;
  float ynoise = random(10);
  float nlevel=0.1;
  float lastx = -99;
  float lasty = -99;
  float y = 50;
  int border = 20;
  int bordery=10;
  for (int x=border; x<=width-border;x+=xstep) {
    strokeWeight(random(10));
    stroke(20, 50, 70,random(5));
    y=10+noise(ynoise)*80;
    if (lastx >-99) {
      line(x, y, lastx+10, lasty+10);
    }
    lastx = x;
    lasty = y;
    ynoise+=nlevel;
  }
 
}

