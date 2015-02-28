
Hexagon[][] hexagon;
float[][][] tests;
int rad = 15;
int hexcountx, hexcounty;
import processing.opengl.*;

void setup()
{

  size(512, 512);
  smooth();
  frameRate(50);
  noStroke();
//  hexcountx = (height/(rad));
//  hexcounty = (width/(rad)*2);
hexcountx = 34;
hexcounty = 68;
  println(hexcountx);
  println(hexcounty);
  hexagon = new Hexagon [hexcountx][hexcounty];
  tests = new float[100][100][1];
  for (int i = 0; i < hexcountx; i++) {
    for (int j = 0; j < hexcounty; j++) {
      if ((j % 2) == 0) {
        hexagon[i][j] = new Hexagon((3 * rad * i), (.866 * rad * j), rad);
      } 
      else {
        hexagon[i][j] = new Hexagon(3 * rad * (i + .5), .866 * rad * j, rad);
      }
    }
  }

  for (int i = 0; i < hexcountx; i++) {
    for (int j = 0; j < hexcounty; j++) {
      tests[i][j][0]=0;
    }
  }
 
}



void draw() {
  background(0);
  tests[int(random(0, 100))][int(random(0, 100))][0] = 20;
  tests[int(random(0, 100))][int(random(0, 100))][0] = 20;
  tests[int(random(0, 100))][int(random(0, 100))][0] = 20;
  tests[int(random(0, 100))][int(random(0, 100))][0] = 20;
  tests[int(random(0, 100))][int(random(0, 100))][0] = 20;
  tests[int(random(0, 100))][int(random(0, 100))][0] = 20;




  for (int i = 0; i < hexcountx; i++ ) {     
    for (int j = 0; j < hexcounty; j++ ) {
      //  print(i);
      //  println(j);
      hexagon[i][j].display();
    }
  }

  for (int i = 0; i < 100; i++ ) {     
    for (int j = 0; j < 100; j++ ) {
      if (tests[i][j][0] == 20)tests[i][j][0]=40;
      else if (tests[i][j][0] == 40)tests[i][j][0]=60;
      else if (tests[i][j][0] == 60)tests[i][j][0]=80;
      else if (tests[i][j][0] == 80)tests[i][j][0]=100;
      else if (tests[i][j][0] == 100)tests[i][j][0]=120;
      else if (tests[i][j][0] == 120)tests[i][j][0]=160;
      else if (tests[i][j][0] == 160)tests[i][j][0]=200;
      else if (tests[i][j][0] == 200)tests[i][j][0]=250;
      else if (tests[i][j][0] == 250)tests[i][j][0]=240;
      else if (tests[i][j][0] == 240)tests[i][j][0]=170;
      else if (tests[i][j][0] == 170)tests[i][j][0]=110;
      else if (tests[i][j][0] == 110)tests[i][j][0]=30;
      else if (tests[i][j][0] == 30)tests[i][j][0]=0;
    }
  }
}

class Hexagon {
  float x, y, radi;
  float angle = 360.0 / 6;

  Hexagon(float cx, float cy, float r)
  {
    x=cx;
    y=cy;

    radi=r;
  }

  void display() {
    beginShape();
    fill(tests[int(x/22.5)][int(y/12.99)][0]/4, tests[int(x/22.5)][int(y/12.99)][0]/2, tests[int(x/22.5)][int(y/12.99)][0]);

    for (int i = 0; i < 6; i++)
    {
      vertex(x + radi * cos(radians(angle * i)), 
      y + radi * sin(radians(angle * i)));
    }

    stroke(#00123E);
    //if (mousePressed){
    // colorMode(HSB, 500);
    //fill(abs(x-mouseX),abs(y-mouseY),500-dist(mouseX,mouseY,x,y));
    //  }
    endShape(CLOSE);
  }
}

