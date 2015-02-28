
int posx;
int gr;

void setup() {

  size(610, 610);
  gr = 200;
  frameRate(24);
}

void draw() {

  background(gr);
  
  for (int i=0; i<60; i=i+1) {
    fill(250);
    point(i*15, 0);
    point(0, i*15);
    point(600, i*15);
    point(i*15,600);    
    
    stroke(0,i*6,i*6);
    line(0,(600-15*i),(i*15),0);
    line((i*15),600,600,(600-15*i));
    
    
    
    
}
}



