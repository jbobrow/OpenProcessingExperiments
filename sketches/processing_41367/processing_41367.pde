
int prevSec;
int millisRolloverTime;
int durationMinutes;
float elapsed;
PImage coffeeMaker;
PImage handle2;
PImage mug;
PImage mug2;
PImage outlet;
float maxHours ;
int numberOfHours;

void setup () {
  size (800, 500);
  smooth();
  millisRolloverTime = 0;
  durationMinutes = 60;
  coffeeMaker = loadImage ("coffeepot_phtshp.png");
  handle2 = loadImage ("handle_photoshop.png");
  mug = loadImage ("dirtymug_try1.png");
  mug2 = loadImage ("mug2.png");
  outlet = loadImage ("outlet.png");
  maxHours = 12;
  numberOfHours = hour();
}


void draw () {
  background (#FAFAE1);

  int H = hour();
  int M = minute ();
  int S = second();

  if (prevSec != S) {
    millisRolloverTime = millis();
  }

  prevSec = S;
  int mils = millis() - millisRolloverTime;

  tileWall();
  counter();
  drawPot ();


  //  //COFFEE STAINS
  //  noFill();
  //  strokeWeight (3);
  //  stroke (#391E06, 110);
  //ellipse (450, 428, 65, 12);
  // stroke (#391E06, 160);
  //ellipse (463, 433, 65, 12);
  //ellipse (550, 450, 65, 12);
  //ellipse (560, 390, 65, 12);
  //  stroke (#391E06, 80);
  //ellipse (100, 400, 65, 12);
  //ellipse (760, 428, 65, 12);
  //ellipse (60, 428, 65, 12);
  //noStroke();




  //DRIP
  float d = map(mils, 0, 1000.0, 190, 378);
  fill (#341704);
  ellipse (265, d, 10, 10);
  image (handle2, 140, 153);

  //COFFEE

  // float hight =minute()*(mils/10000);
  float rise = map(M, 0, 59.0, 380, 230);
  fill (#341704);
  quad (206 - (rise/30), rise, 335 + (rise/30), rise, 375, 380, 175, 380);


  if (H == 1) {
    mug (10, 320); // 11
  }

  if (H == 2) {
    mug (10, 320);
    mug (440, 320); // 1
  }

  if (H == 3) {
    Rings1();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    // 12
  }

  if (H == 4) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320); // 4
  }

  if (H == 5) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320); // 2
  }

  if (H == 6) {
    Rings2();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320); 
    // 3
  }

  if (H == 7) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233); // 5
  }

  if (H == 8) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233); // 6
  }

  if (H == 9) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233); // 7
  }


  if (H == 10) {
    Rings3();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233);
    mug (520, 146); 
    // 8
  }

  if (H == 11) {
    Rings4();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233);
    mug (520, 146);
    mug (600, 146);
    // 9
  }

  if (H == 12) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233);
    mug (520, 146);
    mug (600, 146);
    mug (560, 59); // 10
  }


  if (H == 13) {
    mug (10, 320); // 11
  }

  if (H == 14) {
    mug (10, 320);
    mug (440, 320); // 1
  }

  if (H == 15) {
    Rings1();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    // 12
  }

  if (H == 16) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320); // 4
  }

  if (H == 17) {
    Rings2();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320); 
    // 2
  }

  if (H == 18) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    // 3
  }

  if (H == 19) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233); // 5
  }

  if (H == 20) {
    Rings3();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233); 
    // 6
  }

  if (H == 21) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233); // 7
  }


  if (H == 22) {
    Rings4();
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233);
    mug (520, 146);
    // 8
  }

  if (H == 23) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233);
    mug (520, 146);
    mug (600, 146); // 9
  }

  if (H == 24) {
    mug (10, 320);
    mug (440, 320); 
    mug2 (-35, 233);
    mug (680, 320);
    mug (520, 320);
    mug (600, 320);
    mug (480, 233);
    mug (560, 233);
    mug (640, 233);
    mug (520, 146);
    mug (600, 146);
    mug (560, 59); // 10
  }
}

void outlet () {
  pushMatrix ();
  translate (-10, 130);
  scale (0.25, 0.25);
  image (outlet, 200, 350);
  popMatrix ();
}

void drawPot () {

  //MAKER
  fill (0);
  quad (160, 50, 375, 50, 375, 380, 160, 380); //back larg rect
  fill (#343232);
  rect(140, 400, 260, 50);

  quad (350, 50, 180, 50, 195, 159, 335, 159); // filter area
  fill (0);
  rect (140, 45, 255, 45); //rect on top
  quad (160, 380, 375, 380, 400, 400, 140, 400); // sitting on area
  noFill();
  stroke (#343232);
  strokeWeight (2);
  line (165, 50, 370, 50);
  strokeWeight (1);
  ellipse (270, 390, 198, 14); // burner ring
  ellipse (270, 390, 208, 18); // burner ring
  noStroke ();

  //POT
  fill (255, 255, 255, 50);
  quad (205, 200, 335, 200, 375, 380, 175, 380);
  triangle ( 205, 200, 175, 200, 198.5, 240);
  fill (255, 255, 255, 100);
  quad (200, 380, 355, 380, 362, 395, 193, 395);
  fill (#341704);
  quad (200, 380, 355, 380, 362, 390, 193, 390);
}

void drawCoffee () {

  //  float hight =(minute()*(millis()/100000.0));
  //  float rise = map(hight, 0, 60, 200, 380);
  //  fill (#341704);
  //  quad (200, rise, 330, 300, 370, 380, 170, 380);
}

void counter () {
  fill (#D3D1A6);
  rect (0, 378, 800, 100);
  fill (#B7B592);
  rect (0, 465, 800, 35);
}

void tileWall () {
  for (int tile = 0; tile < 801; tile = tile + 57) {
    for (int spacing = 1; spacing < 801; spacing = spacing + 57) {
      noStroke ();
      fill (#D7F7EF);
      //fill (#73A098);
      rect (tile, spacing, 50, 50);
    }
  }
}

void mug(float x, float y) {
  image (mug, x, y);
}

void mug2( float a, float b) {
  image (mug2, a, b);
}

void Rings1 () {
  //COFFEE STAINS
  noFill();
  strokeWeight (3);
  stroke (#391E06, 110);
  ellipse (450, 428, 65, 12);
  noStroke();
}


void Rings2 () {
  //COFFEE STAINS
  noFill();
  strokeWeight (3);
  stroke (#391E06, 110);
  ellipse (450, 428, 65, 12);
  stroke (#391E06, 160);
  ellipse (550, 450, 65, 12);
  noStroke();
}

void Rings3 () {
  //COFFEE STAINS
  noFill();
  strokeWeight (3);
  stroke (#391E06, 110);
  ellipse (450, 428, 65, 12);
  stroke (#391E06, 160);
  ellipse (550, 450, 65, 12);
  stroke (#391E06, 80);
  ellipse (100, 400, 65, 12);
  ellipse (760, 428, 65, 12);
  noStroke();
}

void Rings4 () {
  //COFFEE STAINS
  noFill();
  strokeWeight (3);
  stroke (#391E06, 110);
  ellipse (450, 428, 65, 12);
  stroke (#391E06, 160);
  ellipse (463, 433, 65, 12);
  ellipse (550, 450, 65, 12);
  ellipse (560, 390, 65, 12);
  stroke (#391E06, 80);
  ellipse (100, 400, 65, 12);
  ellipse (760, 428, 65, 12);
  ellipse (60, 428, 65, 12);
  noStroke();
}


