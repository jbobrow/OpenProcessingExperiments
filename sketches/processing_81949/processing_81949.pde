
int numCrosses = (int)random(1, 8);
int[][] crosses;
float a, c, x, y;

void setup(){
  size(470, 600);
  smooth();
  background(230);
  frameRate(30);
  crosses = new int[numCrosses][2];
  for (int i = 0; i < numCrosses; i++){
    int xPos = int(random(4, width-4));
    int yPos = int(random(4, height-4));
    crosses[i][0] = xPos;
    crosses[i][1] = yPos;
  }
}

void draw(){
  //background(230);
  for (int i = 0; i < numCrosses; i++){
    strokeWeight((int)map(sin(c), -1, 1, 0, 6));
    x = (int)map(sin(c), -1, 1, 0, width);
    y = (int)map(cos(c), -1, 1, 0, height);
    line(x, crosses[i][1], crosses[i][1], x);
    line(y, crosses[i][0], crosses[i][1], x);
    fill(0);
    ellipse(crosses[i][0], x, y/4, y/4);
    fill(255);
    strokeWeight((int)map(sin(c), -1, 1, 0, 6));
    rect(y+x, crosses[i][1], x/random(1, 6), x/random(1, 6));
    copy((int)x-100,(int)y,width,1,5,(int)y,width,2);
    stroke(random(x%255));
    //line(width-x, 0, width-x, height);
    c += 0.008;
    a += 0.03;
  }
}

void mousePressed(){
  numCrosses = (int)random(2, 9);
  setup();
  redraw();
}


