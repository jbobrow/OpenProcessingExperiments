
float r;
float yoza=1;
float x=50;
void setup () {
  size (900, 450);
  background (0);
  stroke (255,255,255,155);
  strokeWeight(2);
  smooth();
  while(yoza<800) {

    line(0, yoza, random(0,200), 900);
    line(900, random(0,750), random(0,150), 0);
    line(0, random(0,188), random(0,900), 450);
    line(900, random(0,200), random(0,2000), 0);
  
    
  
    yoza=yoza+3;
    x=x+100;
    
  }
}
