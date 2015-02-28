
float rot_off = 0.0;
float rot_increment = 0.01;
float line_translate = 200;
int level = 0;

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  smooth();
}

void draw () {
  background(0);

  Perline(line_translate, level, rot_off, 200, 255, 150, 50);
  Perline(line_translate, level, -rot_off, 255, 200, 150, 50);
  Perline(line_translate, level, rot_off + HALF_PI, 150, 200, 255, 50);
  Perline(line_translate, level, -rot_off + HALF_PI, 200, 150, 255, 50);

  rot_off += rot_increment;

  if (rot_off > TWO_PI) rot_off = 0;
}

void Perline(float tran, int lev, float rot, int r, int g, int b, int seethrough)
{
  if (lev < 5) {
    pushMatrix();
    translate(tran, tran);
    rotate(rot);  
    float size_them = 50 - (lev * 10);
    fill(r,g,b,seethrough);
    rectMode(CENTER);
    rect(0,0,size_them,size_them);

    lev += 1;
    tran /= 2;

    Perline(tran, lev, rot, r, g, b, seethrough);
    Perline(tran, lev, -rot, g, r, b, seethrough);
    Perline(-tran, lev, rot, b, g, r, seethrough);
    Perline(-tran, lev, -rot, b, g, r, seethrough);

    popMatrix(); 
  }
}













