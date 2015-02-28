
int grow=0;
int speed=1;

void setup() {
  size(400,400);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(10);
}

void pattern(int x, int y, int thesize, color c) {
  fill(255,200,200);
  rect(x,y,thesize*2,thesize*2);
  fill(c);
  ellipse(x,y,thesize*2,thesize*2);
  fill(255);
  ellipse(x,y,thesize,thesize);
}

void move() {
  if((grow>=-25) && (grow<50)) {
    grow=grow+speed;
   }
}

void decrease() {
  if(grow>=45) {
    speed=speed*-1;
  }else{
    speed=speed;
    grow=grow;
}
}

void draw() {
  background(255);
  for(int i=25; i<width; i+=100) {
  for(int k=25; k<height; k+=100) {
    pattern(i,k,grow,color(200,20,20));
  }
  }
  for(int j=75; j<width; j+=100) {
  for(int h=75; h<height; h+= 100) {
    pattern(j,h,grow,color(255,50,50));
  }
  }
  move();
  decrease();
}

  

