
float r;
float yoza=1;
float x=50;
void setup () {
  size (900, 450);
  background (0);
  stroke (255,255,255,155);
  strokeWeight(2);
  smooth();
  while(yoza<900) {

    line(0, yoza, random(0,200), 450);
    line(900, yoza, random(0,150), 0);
    line(0, random(0,188), yoza, 450);
    line(900, random(0,200), yoza, 0);
    line(0,450,random(0,200),0);
    
  
    yoza=yoza+1;
    x=x+1;
    
  }
}
