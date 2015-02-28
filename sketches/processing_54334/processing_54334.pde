
PShape F;
PShape SC;
PShape C;
PShape A;

int mode;

float x;
float xx;
float y;
float yy;


float angle =0.0;
float angle2 = 0.0;
float angle3 = 0.0;
float angle4 = 0.0;

void setup() {
  size(1000, 1000);
  background(255);

  F = loadShape ("f.svg");
  SC = loadShape("sc.svg");
  C = loadShape ("C.svg");
  A = loadShape ("A.svg");

  frameRate(30);

  shapeMode(CENTER);
}


void draw() {
  background(255);


  if (mousePressed) {
    mode = 2;
  }

  if (mode == 2) {

    //smallc coming first  

    pushMatrix ();

    translate (width/2, height/2);
    angle += 0.15;
    rotate (angle);
    x+= 5;

    if (x<670) {
      x++;
    }
    else if (x> 670) {
      x = 670;
    }
    shape (SC, 0, 0, x, x);
    popMatrix ();

    //F coming next

    pushMatrix ();
    translate (width/2, height/2);

    angle2 -= 0.15;
    rotate (angle2);

    xx += 0.8;

    if (xx<700) {
      xx+=2;
    }
    else if (xx> 700) {
      xx = 700;
    }
    shape ( F, 0, 0, xx, xx);
    popMatrix();



    //C is coming

    pushMatrix ();

    translate (width/2, height/2);
    angle3 += 0.15;
    rotate (angle3);

    y ++;

    if (y < 710) {
      y++;
    }
    else if (y> 710) {
      y = 710;
    }

    shape ( C, 0, 0, y, y);
    popMatrix();



    //A is finally coming :)

    pushMatrix ();

    translate (width/2, height/2);
    angle4 -= 0.15;
    rotate (angle4);

    yy += 0.8;

    if (yy < 720) {
      yy+=0.5;
    }
    else if (yy> 720) {
      yy = 720;
    }
    shape ( A, 0, 0, yy, yy);
    popMatrix();
  }
}


