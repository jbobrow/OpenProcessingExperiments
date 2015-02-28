
//globals
int level = 3;
float len = 200;
int offSet = 0;
int gradient = 200;
int alph = 0;

void setup() 
{
  size(900, 900);
  background(0);
  smooth();

  strokeWeight(1);
  len = 200;
  offSet = 0;

  for (level = 7; level > 2; level--) {
    for (int offY = -height; offY < height; offY += 200) {
      for (int offX = -width; offX < width; offX += 200) {
        stroke(gradient, 0, 100-gradient);
        drawKoch(offX+offSet, offY-offSet/2);
      }
    }
    len -= len/4;
    offSet += len/6;
    gradient -= 80;
  }
}

void drawKoch(int offX, int offY) {
  pushMatrix();
  translate(width/2+offX, height/2+offY);
  drawThird(0, 0, len, level);
  translate(len, 0);
  rotate(-2*PI/3);
  drawThird(0, 0, len, level);
  translate(len, 0);
  rotate(-2*PI/3);
  drawThird(0, 0, len, level);
  popMatrix();
}



void drawThird(float x, float y, float wide, int maxLevel) {                    
  if (maxLevel > 0) {
    translate(0, 0);
    drawThird(x, y, wide/3, maxLevel-1);

    pushMatrix();
    translate(wide/3, 0);
    rotate(PI/3);    
    drawThird(x, y, wide/3, maxLevel-1);
    popMatrix();

    pushMatrix();
    translate(wide/3+wide/6, wide*tan(PI/3)/6);
    rotate(-PI/3);    
    drawThird(x, y, wide/3, maxLevel-1);
    popMatrix();

    pushMatrix();
    translate(2*wide/3, 0);
    drawThird(x, y, wide/3, maxLevel-1);
    popMatrix();

    if (maxLevel==1) {
      line(x, y, x+wide, y);
    }
  }
}
