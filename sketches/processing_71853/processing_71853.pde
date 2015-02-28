
float rot_off = 0.0;
float rot_increment = 0.02;
float sq_translate = 275;
int level = 0;

void setup() {
  size(550, 550);
  background(0);
  noStroke();
  smooth();
}

void draw () {
  background(0);
  if (keyPressed == true) {

    Sqay(sq_translate, level, rot_off, 255, 255, 255, 50);
    Sqay(sq_translate, level, -rot_off, 165, 165, 165, 50);
    Sqay(sq_translate, level, -rot_off + HALF_PI, 138, 138, 138, 50);
    Sqay(sq_translate, level, rot_off + HALF_PI, 113, 113, 113, 50);
    Sqay(sq_translate, level, -rot_off, 93, 93, 93, 50);
    Sqay(sq_translate, level, rot_off - TWO_PI, 100, 100, 100, 50);
    Sqay(sq_translate, level, rot_off + TWO_PI, 200, 200, 200, 50);
    Sqay(sq_translate, level, -rot_off + HALF_PI, 238, 238, 238, 50);
  }
  else {
    Sqay(sq_translate, level, -rot_off, 165, 165, 165, 50);
    Sqay(sq_translate, level, rot_off + HALF_PI, 113, 113, 113, 50);
    Sqay(sq_translate, level, -rot_off, 93, 93, 93, 50);
    Sqay(sq_translate, level, rot_off + TWO_PI, 200, 200, 200, 50);
  }
  Sqay(sq_translate, level, rot_off, 0, 0, 255, 50);
  Sqay(sq_translate, level, -rot_off, 255, 0, 0, 50);
  Sqay(sq_translate, level, -rot_off + PI, 0, 225, 0, 50);
  Sqay(sq_translate, level, rot_off + PI, 225, 225, 0, 50);
  Sqay(sq_translate, level, -rot_off, 0, 225, 225, 50);

  rot_off += rot_increment;
}
void Sqay(float tran, int lev, float rot, int r, int g, int b, int opacity) {


  if (lev < 5) {
    pushMatrix();
    translate(tran, tran);
    rotate(rot); 
    float sizes = 50 - (lev * 9);
    fill(r, g, b, opacity);
    rectMode(CENTER);
    rect(0, 0, sizes, sizes);

    lev += 1;
    tran /= 2;

    Sqay(tran, lev, rot, r, g, b, opacity+80);
    Sqay(tran, lev, -rot, g, r, b, opacity-20);
    Sqay(-tran, lev, rot, b, g, r, opacity+30);
    Sqay(-tran, lev, -rot, b, g, r, opacity-40);

    popMatrix();
  }
}
