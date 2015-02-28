
int x1 = 1;
int y1 = 50;
int xspeed = 16;
int yspeed = 2;

int x2 = 0;
int y2 = 50;
int xspeed2 = 2;
int yspeed2 = 16;

int x3 = 80;
int y3 = 80;
int xspeed3 = 4;
int yspeed3 = 3;
float colour3 = 250;

int xEraser = 0;
int yEraser = -800;
int xspeedE = 0;
int yspeedE = 3;


void setup() {
  size(500, 700);
  background(255);
  smooth();
  noStroke();
}

void draw() {

  if (x1 > width || x1 < 0) {
    if (x1 > width) {
      xspeed = int(random(-10, -1));
      x1 = width;
    }
    else{
      xspeed = int(random(1, 10));
      x1 = 0;
    }
  }
  x1 = x1 + xspeed;

  if (y1 > height || y1 < 0) {
    if (y1 > height) {
      yspeed = int(random(-10, -1));
      y1 = height;
    }
    else{
      yspeed = int(random(1, 10));
      y1 = 0;
    }
  }
  y1 = y1 + yspeed;

  fill(39, 194, 176);
  stroke(39, 194, 176);
  strokeWeight(1);
  ellipse(x1, y1, 7, 7);
  //line(x1-xspeed, y1-yspeed, x1, y1);
  line(x3, y3, x1, y1);


  noStroke();

  /* x2 = x2 + xspeed2  ;
   if (x2 >= width || x2 < 0){
   xspeed2 = xspeed2 * (-1);
   }
   
   y2 = y2 + yspeed2;
   if (y2 >= height || y2 < 0){
   yspeed2 = yspeed2 * (-1);
   }
   fill(240,220,200,100);
   ellipse(x2,y2,10,10);  
   stroke(100,230,200);
   strokeWeight(5);
   line(x1-xspeed, y1-yspeed, x1, y1);
   */

  x3 = x3 + xspeed3;
  if (x3 >= width-80 || x3 < 80) {
    xspeed3 = xspeed3 * (-1);
  }

  y3 = y3 + yspeed3;
  if (y3 >= height-80 || y3 < 80) {
    yspeed3 = yspeed3 * (-1);
  }
  fill(colour3, colour3, 100, 100);
  ellipse(x3, y3, 80, 80);
  colour3 = random(190, 255);


  yEraser = yEraser + yspeedE;
  if (yEraser >= height + 800) {
    yEraser = yEraser -2;
    yspeedE = yspeedE * (-1);
  }
  if (yEraser < -800) {
    yEraser = yEraser +1;
    yspeedE = yspeedE * (-1);
  }
  fill(255);
  rect(xEraser, yEraser, width, 1);
}


