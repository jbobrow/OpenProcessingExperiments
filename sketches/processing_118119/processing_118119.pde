
// Green, Green, Grass of Home
// think grasses grow in green grassland and full of flowers
//(you can use mouse let flowers appear)
// when leafs flutter
// lin wenyu  (ken3101462@gmail.com)


int timeDelay=5;
int time=0;
float yyy=280;
float c1= random(121, 215);
float c2= random(143, 233);
float c3= random(28, 194);



void setup() {
  size(500, 300);
  background(c1, c2, c3);
  frameRate(8);
  //noLoop();
  noSmooth();
}

void draw() {

  // learn control time stop in "http://ppt.cc/fFx0"
  pushMatrix();
  if (second()-time>=1) {

    drawLine(10, 0.1, 5, yyy);//Graees random grow 
    drawLine(20, 0.2, 5, yyy);
    time=second();
    yyy=yyy-10;
  }
  else {
    drawLine(10, 0.1, 5, yyy);//Graees random grow 
    drawLine(20, 0.2, 5, yyy);
  }
  popMatrix();

  // triangle = leaf
  pushMatrix();
  drawTriangle(100, 40, 115, 50, 115, 65, 70, 70);
  drawTriangle(130, 70, 145, 80, 145, 95, 70, 70);
  drawTriangle(150, 90, 165, 100, 165, 115, 70, 70);
  //drawTriangle(200, 140, 215, 150, 215, 165, 70, 70);
  drawTriangle(250, 190, 265, 200, 265, 215, 70, 70);
  popMatrix();

  drawFlower();
}

//Graees
void drawLine(int step, float nlevel, int border, float yy) {
  stroke(20, 50, 70);  
  //int step = 10; 
  //float nlevel = 0.1;

  float lastx = -999; 
  float lasty = -999; 

  float ynoise = random(10);
  float y; 
  //int border = 20; 

  for (int x=border; x<=width-border; x+=step) { 
    stroke(random(121, 215), random(143, 233), random(28, 194), 200);
    strokeWeight(random(1, 2));

    y = yy + noise(ynoise)*80; 
    if (lastx > -999) { 
      line(x, y, lastx+random(1), lasty-random(5, 30));
    }
    lastx = x; 
    lasty = y;
    ynoise += nlevel;
  }
}

//I want triangle can swing by wind
void drawTriangle(float tx1, float ty1, float tx2, float ty2, float tx3, float ty3, float posx, float posy) {

  float angle=PI/12*second();
  //pushMatrix();
  noStroke();
  fill(random(121, 215), random(143, 233), random(28, 194));
  translate(posx, posy);
  rotate(angle);
  triangle(posx-tx1, posy-ty1, posx-tx2, posy-ty2, posx-tx3, posy-ty3);
  //triangle(tx1-posx, ty1-posy, tx2-posx, ty2-posy, tx3-posx, ty3-posy);
  //popMatrix();
}

void drawFlower() {
  //fill(random(52,235),random(36,218),random(64,198));
  if (mousePressed) {
    fill(219, 218, 198);
    ellipse(mouseX, mouseY, 9, 9);
  }
  else {
    fill(254, 255, 3);
    ellipse(mouseX, mouseY, 9, 9);
  }
}

void keyPressed() {
  saveFrame (" screen-####.jpg");
}



