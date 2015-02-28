

float speedx=5.0;
float speedy=5.0;
float ballsize=10;
float ballX=ballsize/2;
float ballY=ballsize/2;

void setup() {
  size(400,400);
  background(255);
  noStroke();
  smooth();
  frameRate(30);
  //no variable
}
void draw() {
  //background(204);

  // gradeient background
  for(int c=0;c<=height;c++) {
    for(int d=0;d<=width;d++) {
      stroke(map(d,0,width, 0, 255),map(d,0,width, 0, 255),map(d,0, width, 255, 16));
    //  stroke(map(c,100,255, 0, width),map(c,0,100, 0, width),map(c,0,30, 0, width),100);
      point(d,c);
    }
  }
  
  //blinking ball
  noStroke();
  for (int i = 20; i < width-10; i +=ballsize*2) {
    for (int j =20; j < height-10; j+= ballsize*2) {
      // point(i, j);
      fill(0,random(10,255),random(100,255),random(10,70));
      ellipse(i,j,ballsize,ballsize);
    }
  }
  // ellipse (ballX,ballY,ballsize,ballsize);
}


