
//2014-01-20
//Homework-Seasons greeting: Postcard " Bon voyage!!"
//Echo Chen (puyce7244@yahoo.com.tw)
//Concept: Using Fractle tree to express spray and Perspective effect.  
//The postcard's motif is "beach"!

int _numChildren = 6;
int _maxLevels = 6;
Branch _trunk;
/*PImage imgh;*/


void setup() {
  size(450, 450);
  background(87, 124, 138, 10);
  noFill();
  newTree();
  frameRate(2);
}
void newTree() {
  _trunk = new Branch(1, 0, width/2, 500);
  _trunk.drawMe();
}

void draw() {

  background(87, 124, 138);
  /*noStroke();
   fill(255, 80);
   ellipse(0, 0, 100, 100);
   noStroke();
   fill(255, 75);
   ellipse(0, 0, 150, 150);
   noStroke();*/
  fill(88, 178, 220, 70);
  ellipse(0, 0, 200, 200);
  noStroke();
  fill(88, 178, 220, 65);
  ellipse(0, 0, 250, 250);
  noStroke();
  fill(88, 178, 220, 60);
  ellipse(0, 0, 300, 300);
  noStroke();
  fill(88, 178, 220, 55);
  ellipse(0, 0, 350, 350);
  noStroke();
  fill(88, 178, 220, 50);
  ellipse(0, 0, 400, 400);
  noStroke();
  fill(88, 178, 220, 45);
  ellipse(0, 0, 450, 450);
  noStroke();
  fill(88, 178, 220, 40);
  ellipse(0, 0, 500, 500);
  noStroke();
  fill(88, 178, 220, 35);
  ellipse(0, 0, 550, 550);
  noStroke();
  fill(88, 178, 220, 30);
  ellipse(0, 0, 600, 600);
  noStroke();
  fill(88, 178, 220, 25);
  ellipse(0, 0, 650, 650);
  noStroke();
  fill(88, 178, 220, 20);
  ellipse(0, 0, 700, 700);
  noStroke();
  fill(88, 178, 220, 15);
  ellipse(0, 0, 750, 750);
  noStroke();
  fill(88, 178, 220, 10);
  ellipse(0, 0, 800, 800);

  /*for (int radd=100;radd<=900;radd+=50) {
   noStroke();
   fill(255, 5);
   ellipse(0, 0, radd, radd);
   }*/
  for (int y=0;y<=450;y+=10) {
    for (int x=-500;x<=1000;x+=20) {
      noStroke();
      fill(88, 178, 220, random(0, 50));
      ellipse(x+y, y, 30-y/10, 30-y/10);
      fill(88, 178, 220, random(0, 20 ));
      ellipse(x+y, y, 30-y/5, 30-y/5);
    }
  }
  _trunk.updateMe(width/3, height/0.8);
  _trunk.drawMe();
  /*imgh=loadImage("bc.png");
   image(imgh, -10, 70, 690, 390);*/
  noFill();
  strokeWeight(2);
  beginShape();
  vertex(0, 328);
  bezierVertex(180, 450, 246, 237, 290, 314);
  endShape();
  noFill();
  strokeWeight(2);
  beginShape();
  vertex(290, 314);
  bezierVertex(324, 380, 474, 374, 540, 290);
  endShape();
  fill(255);
  text(" Bon  voyage !! ", 350, 330);
  fill(255);
  text(" 2  0  1  4 ", 360, 315);
  
  
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  Branch[] children = new Branch[0];
  //=Branch[] children = {};

  Branch(float lev, float ind, float ex, 
  float ey) {
    level = lev;
    index = ind;
    updateMe(ex, ey);

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int i=0; i<_numChildren; i++) {
        children[i] = new Branch(level+1, 
        x, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    endx =x - (level*(random(100)-50));
    endy =y - 100 - (level*random(25));

    for (int i=0; i<children.length; i++)
    {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    float rad= (((_maxLevels-level+1))*4);
    strokeWeight((_maxLevels-level+1)*0.7);
    /*line(x, y, endx, endy);*/
    noStroke();
    fill(255, 50);
    ellipse((x+endx)/2, (y+endy)/2, rad, rad);
    noStroke();
    fill(255, 20);
    ellipse(x, y, 5, 5);
    noStroke();
    /*fill(247,217,76,50);
     ellipse(x, y, 25, 25);*/
    stroke(255, 50);
    line((x+endx)/4, (y+endy)/4, (x+endx)/2, (y+endy)/2);

    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe();
    }
  }
}



