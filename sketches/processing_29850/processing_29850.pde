
PImage aquarius;

PVector[] positions = new PVector[5];
int current = 0;
float cl = 0.0;
float xpnt= 0;
float ypnt= 0;

void setup() {
  size(500,636);
  smooth();
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  
  if(mousePressed){
  stroke(0);
 
  }
  else { 
    
  stroke(cl, 100, 100, 20);
  }

  for(int i = 0; i<positions.length; i++) {
    if(positions[i] !=null) {

      line(mouseX,mouseY, xpnt, ypnt);
    }
  }

  positions[current] = new PVector(mouseX, mouseY);
  current ++;
  if (current == positions.length) {
    current = 0;
  }
  cl +=0.5;
  if (cl>360) {
    cl=0;
  }

  xpnt +=1;
  if (xpnt > width) {
    xpnt=0;
  }
  ypnt +=1;
  if(ypnt > height-200) {
    ypnt=0;
  }
  aquarius = loadImage("aquamanbgsm2.png");
  image(aquarius, 0,0);
}


