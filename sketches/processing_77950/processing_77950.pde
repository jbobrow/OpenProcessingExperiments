
float a = 0;
float a1 = 0;
float b = 0;
float b1 = 0;
float c = 0;
float c1 = 0;
float d = 0;
float d1 = 0;
float e = 0;
float e1 = 0;

float aa = 0;
float aa1 = 0;
float bb = 0;
float bb1 = 0;
float cc = 0;
float cc1 = 0;
float dd = 0;
float dd1 = 0;
float ee = 0;
float ee1 = 0;

int Acount = 0;
int Bcount = 0;
int Ccount = 0;
int Dcount = 0;
int Ecount = 0;

int frame = 0;
int x = 0;
int y = 0;
boolean phase1 = true;
boolean phase2 = false;
PImage[] images = new PImage[11];


PFont font; 
void setup() {
  size(500, 500); 
  smooth();
  noStroke();
  font = loadFont("Serif-48.vlw"); 
  textFont(font, 32);
  images[0]  = loadImage("win.png");
  images[1]  = loadImage("finish.png");
  images[2]  = loadImage("kill.png");
  images[3]  = loadImage("die.png");
  images[4]  = loadImage("shoot.png");
  images[5] =loadImage("door.png");
  images[6] =loadImage("1.png");
  images[7] =loadImage("2.png");
  images[8] =loadImage("3.png");
  images[9] =loadImage("4.png");
  images[10] =loadImage("5.png");
  image(images[5], 450, 450);



  a1 = random(0, 500);
  b1 = random(0, 500);
  c1 = random(0, 500);
  d1 = random(0, 500);
  e1 = random(0, 500);
  aa1 = random(0, 500);
  bb1 = random(0, 500);
  cc1 = random(0, 500);
  dd1 = random(0, 500);
  ee1 = random(0, 500);
} 

void draw() {
  if (phase1) {


    x++;
    if (x<=30) {

      image(images[0], 0, 0);
    }  
    if (x>= 30 && x<=60) {

      image(images[1], 0, 0);
    }
    if (x>= 60 && x<=90) {

      image(images[2], 0, 0);
    }
    if (x>= 90 && x<=120) {

      image(images[3], 0, 0);
    }
    if (x>= 120 && x<=150) {

      image(images[4], 0, 0);
    }
    if (x >= 150) {
      x = 0;
    }

    fill(255, 0, 0);
    text("KILL!!", a, a1);
    a+=random(0, 15);
    if (a >= 490) {
      a = 0; 
      a1 = random(0, 500);
    }
    text("WIN!!", b, b1);
    b+=random(0, 10);
    if (b >= 490) {
      b = 0; 
      b1 = random(0, 500);
    }
    text("DIE!!", c, c1);
    c+=random(0, 11);
    if (c >= 490) {
      c = 0; 
      c1 = random(0, 500);
    }
    text("FINISH IT!!", d, d1);
    d+=random(0, 13);
    if (d >= 490) {
      d = 0; 
      d1 = random(0, 500);
    }
    text("SHOOT!!", e, e1);
    e+=random(0, 14);
    if (e >= 490) {
      e = 0; 
      e1 = random(0, 500);
    }

    image(images[5], 450, 400);
    mouseC();
  }
  if (phase2) {
    secoundP();
  }
}

void mouseC() {

  if (mouseX >=450 && mouseX <= 500) {
    if (mouseY >=400 && mouseY <= 500) {
      if (mousePressed) {
        phase1 = false;
        phase2 = true;
      }
    }
  }
}
void secoundP() {
  background(0);
  y++;
    if (y<=60) {

      image(images[6], 0, 0);
    }  
    if (y>= 60 && y<=140) {

      image(images[7], 0, 0);
    }
    if (y>= 140 && y<=220) {

      image(images[8], 0, 0);
    }
    if (y>= 220 && y<=300) {

      image(images[9], 0, 0);
    }
    if (y>= 300 && y<=380) {

      image(images[10], 0, 0);
    }
    if (y >= 380) {
      y = 0;
    }
  
  fill(0, 0,255);
  text("LOVE,,", aa, aa1);
  aa+=random(0,3);
  Acount++;
  if (Acount==0) {
    aa1++;
  }
  if (Acount>=10 && Acount<=50) {
    aa1--;
  }
  if (Acount>=50 && Acount<=100) {
    aa1++;
  }
  if (Acount >=100) {
    Acount = 0;
  }
  if (aa >= 490) {
    aa = 0; 
    aa1 = random(0, 500);
  }
  text("PEACE,,", bb, bb1);
  bb+=random(0,3);
  Bcount++;
  if (Bcount==0) {
    bb1++;
  }
  if (Bcount>=50 && Bcount<=140) {
    bb1--;
  }
  if (Bcount>=140 && Bcount<=230) {
    bb1++;
  }
  if (Bcount >=230) {
    Bcount = 0;
  }
  if (bb >= 490) {
    bb = 0; 
    bb1 = random(0, 500);
  }
  text("LIFE,,", cc, cc1);
  cc+=random(0,2);
  Ccount++;
  if (Ccount==0) {
    cc1++;
  }
  if (Ccount>=40 && Bcount<=90) {
    cc1--;
  }
  if (Ccount>=90 && Ccount<=140) {
    cc1++;
  }
  if (Ccount >=140) {
    Ccount = 0;
  }
  if (cc >= 490) {
    cc = 0; 
    cc1 = random(0, 500);
  }
  text("HAPPYNESS,,", dd, dd1);
  dd+=random(0,1);
  Dcount++;
  if (Dcount==0) {
    dd1++;
  }
  if (Dcount>=30 && Dcount<=70) {
    dd1--;
  }
  if (Dcount>=70 && Dcount<=130) {
    dd1++;
  }
  if (Dcount >=130) {
    Dcount = 0;
  }
  if (dd >= 490) {
    dd = 0; 
    dd1 = random(0, 500);
  }
  text("FRIENDS", ee, ee1);
   ee+=random(0,2);
  Ecount++;
  if (Ecount==0) {
    ee1++;
  }
  if (Ecount>=20 && Ecount<=40) {
    ee1--;
  }
  if (Ecount>=40 && Ecount<=80) {
    ee1++;
  }
  if (Ecount >=80) {
    Ecount = 0;
  }



  if (ee >= 490) {
    ee = 0; 
    ee1 = random(0, 500);
  }
}



