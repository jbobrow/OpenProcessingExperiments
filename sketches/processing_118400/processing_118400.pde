
//Green, Green Grass of Home
//li YI-xiu
//When I heard that song, I can image that I was far away from home  
//And I wish someday I can back to my hometown.

int div =2;

void setup() {   
  size(900, 400); 
  background(250, 250, 150);
  loop();
}


void draw() {
  //background draw
  background(250, 250, 180);
  noStroke();
  fill(172, 213, 152);
  quad(0, 220, 430, 220, 460, 400, 0, 400);
  quad(480, 220, 900, 220, 900, 430, 480, 220);

  fill(250, 250, 120);
  quad(0, 220, 900, 220, 900, 180, 0, 180);
  fill(250, 250, 150);
  quad(0, 180, 900, 180, 900, 130, 0, 130);
  fill(250, 250, 160, 80);
  quad(0, 130, 900, 130, 900, 100, 0, 100);

  int s=second();
  fill(250, 190, -10);//sun
  ellipse(460, 220+2*s, 500, 500);
  fill(250, 190, -10, 50);
  ellipse(460, 220+2*s, 550, 550);
  fill(250, 190, -10, 40);
  ellipse(460, 220+2*s, 620, 620);

  //let the meadow can move with wind in left.
  for (int i = 5; i<430; i+=1) {
    wiggle_line(i, -25, i, 100);
    wiggle_line(i, 0, i, 150);
    wiggle_line(i, 75, i, 120);
    wiggle_line(i, 100, i, 200);
    wiggle_line(i, 110, i, 190);
    wiggle_line(i, 150, i, 200);
  }
  //let the meadow can move with wind in right.
  for (int j = 430; j<910; j+=1) {
    wiggle_line(j, -25, j, 100);
    wiggle_line(j, 0, j, 150);
    wiggle_line(j, 75, j, 120);
    wiggle_line(j, 100, j, 200);
    wiggle_line(j, 110, j, 190);
    wiggle_line(j, 150, j, 200);
  }

  noStroke();//The road.
  fill(115, 115, 115);
  quad(450, 220, 480, 220, 900, 400, 450, 450);
  fill(250, 190, -10);
  quad(450, 220, 480, 220, 480, 180, 450, 180);

  stroke(1);//airplane
  fill(1, 1, 1);
  ellipse(850-3*s, 0+3*s, 140, 165);
  fill(1, 1, 1);
  quad(850-3*s, 65+3*s, 500-3*s, 15+3*s, 500-3*s, 12+3*s, 850-3*s, 45+3*s);
  quad(500-3*s, 15+3*s, 490-3*s, 5+3*s, 500-3*s, 12+3*s, 500-3*s, 15+3*s);

  quad(880-3*s, 65+3*s, 1200-3*s, 15+3*s, 1200-3*s, 10+3*s, 850-3*s, 45+3*s);
  quad(1200-3*s, 15+3*s, 1210-3*s, 5+3*s, 1200-3*s, 10+3*s, 1200-3*s, 15+3*s);

  quad(830-3*s, -10+3*s, 830-3*s, 0+3*s, 630-3*s, -13+3*s, 630-3*s, -15+3*s);
  quad(870-3*s, -10+3*s, 870-3*s, 0+3*s, 1070-3*s, -13+3*s, 1070-3*s, -15+3*s);
  quad(845-3*s, 0+3*s, 855-3*s, 0+3*s, 852-3*s, -250+3*s, 848-3*s, -250+3*s);
  ellipse(680-3*s, 55+3*s, 40, 40);
  ellipse(1030-3*s, 55+3*s, 40, 40);
}



//control how the meadow moving.
void wiggle_line(float sx, float sy, float ex, float ey) {
  strokeWeight(1);
  noStroke();
  line(sx, sy, ex, ey);

  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  for (int i=0; i<div; i+=1) {
    x = x + xstep;
    x = x + random(1)-5; 
    y = y + ystep;
    y = y + random(10) - 10;
    stroke(130, random(250), 5);
    //line (x, y, lastx, lasty);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}



