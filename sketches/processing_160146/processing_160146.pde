
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0);
  //frameRate(4);
}

void draw(){
  background(0);
  strokeWeight(3);
  int x = 50;
  int y = 50;
  int a = 0;
   
  while(a < 85){ 
    while(x < 1000){
      while(y < 1000){
        stroke(250-x/4, y/(500/255), 3*a, 100);
        line(x + a*(mouseX-x)/85, y + a*(mouseY-y)/85, x + (a + 1)*(mouseX-x)/85, y + (a + 1)*(mouseY-y)/85);
        y = y + 50;
      }
      x = x + 50;
      y = 50;
    }
   a = a + 1;
   x = 50;
   y = 50;
  }
}


