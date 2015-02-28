
float r;
float yoza=20;
float x=50;
void setup () {
  size (900, 450);
  background (0);
  stroke (255,255,255,150);
  strokeWeight(1);
  smooth();
  while(yoza<500) {

    line(0, yoza, yoza, 450);
    line(900, yoza, yoza, 0);
    line(0, yoza, yoza, 450);
    line(900, yoza, yoza, 0);
    
  
    yoza=yoza+20;
    x=x+20;
    
  }
}

