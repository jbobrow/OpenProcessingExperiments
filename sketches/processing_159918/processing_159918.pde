
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0);
}

void draw(){
  strokeWeight(0.5);
  int x = 0;
  int y = 0;
  
  while(x < 1000){
    x = x + 1;
    while(y < 1000){
      stroke(250-x/4, y/(500/255), ((x/(500/255)*x/(500/255))-(y/(500/255)*y/(500/255)))*((x/(500/255)*x/(500/255))-(y/(500/255)*y/(500/255))));
      point(x, y);
      y = y + 1;
    }
    x = x + 1;
    y = 0;
  }

  x = 0;
  y = 0;
  
  while(x < 1000){
    x = x + 1;
    while(y < 1000){
      stroke(250-x/4, y/(500/255), ((x/(500/255)*x/(500/255))-(y/(500/255)*y/(500/255)))*((x/(500/255)*x/(500/255))-(y/(500/255)*y/(500/255))));
      point(1000-y+0.5, 1000-x+0.5);
      y = y + 1;
    }
    x = x + 1;
    y = 0;
  }
}


