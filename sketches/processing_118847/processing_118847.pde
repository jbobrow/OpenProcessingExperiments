
int kleur = 177;
float Wsize_1;
float Ysize_1;

float Wsize_2;
float Ysize_2;

float Wsize_3;
float Ysize_3;

float X_loc_1;
float Y_loc_1;


float X_loc_2;
float Y_loc_2;

float X_loc_3;
float Y_loc_3;

void setup() {
  smooth();
  size(640, 480);
  noCursor();
  colorMode(HSB);
}

void draw() {

  background(0);

  noStroke();
  fill(kleur);
  ellipse(mouseX + X_loc_1, mouseY - Y_loc_1, Wsize_1, Ysize_1);

  noStroke();
  fill(kleur);
  ellipse(mouseX + X_loc_2, mouseY - Y_loc_2, Wsize_2, Ysize_2);

  noStroke();
  fill(kleur);
  ellipse(mouseX + X_loc_3, mouseY - Y_loc_3, Wsize_3, Ysize_3);

  if (mousePressed == true) {
    kleur += 20;
    kleur %= 255;

    Wsize_1 += 5;
    Ysize_1 += 5;

    Wsize_2 += 5;
    Ysize_2 += 5;

    Wsize_3 += 5;
    Ysize_3 += 5;
  }


  if ( Wsize_1 > 835 && Ysize_1 > 835) {

    Wsize_1 = 0;
    Ysize_1 = 0;

    X_loc_1 = random(10, 300);
    Y_loc_1 = random(10, 300);
  }
  if ( Wsize_2 > 835 && Ysize_2 > 835) {

    Wsize_2 = 0;
    Ysize_2 = 0;

    X_loc_2 = random(10, 300);
    Y_loc_2 = random(10, 300);
  }
  if ( Wsize_3 > 835 && Ysize_3 > 835) {

    Wsize_3 = 0;
    Ysize_3 = 0;

    X_loc_3 = random(10, 300);
    Y_loc_3 = random(10, 300);
  }
}


