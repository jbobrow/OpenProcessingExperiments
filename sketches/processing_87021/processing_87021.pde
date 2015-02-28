
int m, mold, mwait;
float crange;

void setup() {
  size(516, 516);
  noStroke(); 
  fill(100);
  frameRate(25);
  background(0);
}

void draw() { 
  //background(51);
  mwait = mouseY;
  crange = map(mouseX, 0, width, 0,255);
  m = millis();
  if(m > mold+mwait)
  {
    for (int i = 4; i < 640; i = i+64) {
      for (int j = 4; j < 640; j = j+64) {
          float c = 128-crange*0.5 + random(crange);
          fill(c);
          rect(i, j,60 ,60);
        //println(i+"  "+j);
      }
    }
   mold = m;
  }
  //println(mwait);
  //println(crange);
}


