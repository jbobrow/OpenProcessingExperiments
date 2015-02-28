
int velikost = 300;
int sc = 1;



int shiftx = 2;
int shifty = 0;

boolean matix[][];

color c1 = color(255,128,0);
color c2 = color(0);

void setup() {
  matix = new boolean[velikost*2][velikost];
  size(matix.length*sc,matix[0].length*sc,P2D);

  frameRate(60);

  for(int y = 0;y<matix[0].length;y++) {

    for(int x = 0;x<matix[0].length;x++) {
      matix[x][y] = (random(20)>10) ? true : false;
    }
  }
  noStroke();
  noSmooth();
}

void draw() {
   c1 = color(255);
  shiftx = (int)((noise(-frameCount/33.12)-0.5)*width);
  shifty = (int)((noise(frameCount/300.0)-0.5)*height);
  for(int y = 0;y<matix[0].length;y++) {

    for(int x = 0;x<matix.length/2;x++) {
      fill((matix[x][y])?c1:c2,80);
      rect(x*sc,y*sc,sc,sc);
    }

    for(int x = matix.length/2;x<matix.length;x++) {
      fill((matix[matix.length-x][y])?c1:c2,80);
      rect(x*sc,y*sc,sc,sc);
    }
  }

  pushStyle();
  noFill();
  strokeWeight(5);
  stroke(0);
  rect(0,0,width,height);
  popStyle();  

  randomize((int)(noise(frameCount/230.2)*20));
}


int cnt = 0;
void randomize(int kolik) {
  for(int y = 0;y<matix[0].length;y++) {
    for(int x = 0;x<matix[0].length;x++) {


      if((random(1000))<kolik) {
        matix[x][y] = !matix[x][y];
      }
      else if(matix[(x+width-shiftx)%(width/sc-1)][y]) {
        matix[x][y] = matix[(x+width+2)%(width/sc-1)][y];
      }
      else {
        matix[x][y] = matix[x][(y+height-shifty)%(height/sc-1)];
      }
    }
  }
}


