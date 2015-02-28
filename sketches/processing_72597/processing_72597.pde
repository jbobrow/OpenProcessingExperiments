
boolean doidraw = false;
int diam = 10;

void setup() {
  size(400,400);
  background(0);
  noStroke();

  for (int diam = 100; diam <50; diam = diam-20) {
    drawacircle(100,100,diam,color(0));
  }
}


void draw() {
  if(doidraw) {
    for(int xstart = 0; xstart <400 ; xstart = xstart + 30){
      for(int ystart = 0; ystart <400; ystart = ystart + 10) {
      drawacircle(xstart,ystart,diam,color(random(100,250),0,0));
      }
    }
    for(int xstart = 10; xstart <400 ; xstart = xstart + 30){
      for(int ystart = 10; ystart <400; ystart = ystart + 10)
      drawacircle(xstart,ystart,diam,color(0,0,random(100,250)));
    }
    for(int xstart = 20; xstart <400 ; xstart = xstart + 30){
      for(int ystart = 20; ystart <400; ystart = ystart + 10) {
      drawacircle(xstart,ystart,diam,color(0,random(100,250),0));
      }
    }  
  }
}



void mousePressed() {
  if (mouseButton == LEFT) {
    doidraw = !doidraw;
    }
}

void drawacircle(int centx, int centy, int circlesize, color randomcolor) {
  stroke(0);
  fill(randomcolor);
  //fill(random(100,200),random(0),random(0,200));
  ellipse(centx,centy,circlesize,circlesize);
  //color randomblue = color(random(100,200),random(0),random(0,200));
}
