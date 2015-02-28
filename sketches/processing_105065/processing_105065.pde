
int posX;
int speed;
float sizes;

void setup() {
  size(800,400);
  posX=60;
  speed=10;
  sizes=10;
}

void draw() {
  background(0);
  
  //line
  stroke(255);
  line(60,60,720,60);
  line(60,120,720,120);
  line(60,180,720,180);
  line(60,240,720,240);
  line(60,300,720,300);
  
  //ellipse
  fill(random(255),random(255),random(255));
  posX=posX+3;
  sizes=sizes+0.1;
  noStroke();
  ellipse(posX,60,sizes,sizes);
  ellipse(posX,120,sizes,sizes);
  ellipse(posX,180,sizes,sizes);
  ellipse(posX,240,sizes,sizes);
  ellipse(posX,300,sizes,sizes);
  
  if (posX<60) {
    posX=60;
  }
  
  if (posX>720) {
    posX=60;
    sizes=10;
  }
}


