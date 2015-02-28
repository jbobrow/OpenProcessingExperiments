
color stars;
int counter;
int[][] tailCoordinates;
int tailLength;
PShape rocket;


void setup() {
  rocket = loadShape("Space_Rocket.svg");
  size (500, 500);
  smooth();
  noCursor();
  tailLength=50;
  tailCoordinates = new int[tailLength][2];
  for (int x=0; x<tailLength; x+=1) {
    for (int y=0; y<2; y+=1) {
      tailCoordinates[x][y] = -100;
    }
  }
}

void draw() {
  background(0, 0, 50);
  stars = color(100, 100, 255);
  counter-=2;
  int xadd = counter%(width/5);
  for (int x=xadd-2*width/10 ; x<width+3; x+=width/10) {
    for ( int y=width/20; y<height ; y+= height/10) {
      stroke(0, 0);
      fill(stars);
      int n = 5;
      beginShape();
        vertex ( x-n, y-n);
        vertex ( x, y-n/2);
        vertex ( x+n, y-n);
        vertex ( x+n/2, y);
        vertex ( x+n, y+n);
        vertex ( x, y+n/2);
        vertex ( x-n, y+n);
        vertex (x-n/2, y);
        vertex (x-n, y-n);
      endShape();
    }
  }
  for (int i = 0; i<tailLength-1; i++) {
    tailCoordinates[i][0]=tailCoordinates[i+1][0]-5;
    tailCoordinates[i][1]=tailCoordinates[i+1][1];
  }
  tailCoordinates[tailLength-1][0]=mouseX-24;
  tailCoordinates[tailLength-1][1]=mouseY;
  for (int i = 0; i<tailLength; i++) {
    fill(4*i, 2*i, 0, 2*i);
    ellipse(tailCoordinates[i][0], tailCoordinates[i][1], 20, 20);
  }
  fill (100, 100, 100);
  shape(rocket, mouseX+180, mouseY-90,-350,250);
  fill(250, 0, 0);
//  beginShape();
//    vertex(mouseX+24, mouseY-15);
//    vertex(mouseX+44, mouseY);
//    vertex(mouseX+24, mouseY+15);
//    vertex(mouseX+24, mouseY-15);
//  endShape();
  for (int x=xadd*2-2*width/5 ; x<width+3; x+=width/5) {
    for ( int y=0; y<height ; y+= height/5) {
      stroke(0, 0);
      fill(stars);
      int n = 10;
      beginShape();
        vertex ( x-n, y-n);
        vertex ( x, y-n/2);
        vertex ( x+n, y-n);
        vertex ( x+n/2, y);
        vertex ( x+n, y+n);
        vertex ( x, y+n/2);
        vertex ( x-n, y+n);
        vertex (x-n/2, y);
        vertex (x-n, y-n);
      endShape();
    }
  }
}


