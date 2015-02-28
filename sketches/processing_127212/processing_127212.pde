
/* @pjs preload = "apple_1.png, apple_2.png, apple_3.png, apple_4.png, apple_5.png, apple_6.png, ringo2.png, ringo3.png"; */

int eSize = 308;
int speed = 0;
int y = 0;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;


int A = 0;
int B = 0;
int C = 0;
int D = 0;
int E = 0;
int F = 0;
int G = 0;
int H = 0;
int I = 0;







void setup() {
  size(450, 450);
  background(255);
  frameRate(120);
  smooth();
}


void draw() {

  for (int x=0; x<=510; x ++) {

    stroke(0, 0, x);
    line(450, x, 0, x);
  }


  //1danme apple
  tint(0);
  img = loadImage("apple_1.png");
  image(img, 0, y, 30, 36);
  y =y+speed;


  img = loadImage("apple_1.png");
  image(img, 36, -3+y, 30, 36);
  y =y+speed;



  img = loadImage("apple_1.png");
  image(img, 72, -7+y, 30, 36);
  y =y+speed;



  img = loadImage("apple_1.png");
  image(img, 216, -8+y, 30, 36);
  y =y+speed;



  img = loadImage("apple_1.png");
  image(img, 360, -11+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 396, -14+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 432, -17+y, 30, 36);
  y =y+speed;

  //2danme apple
  img = loadImage("apple_1.png");
  image(img, 0, -57+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 36, -60+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 72, -63+y, 30, 36);
  y =y+speed;


  img = loadImage("apple_1.png");
  image(img, 144, -64+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 180, -67+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 216, -70+y, 30, 36);
  y =y+speed;


  img = loadImage("apple_1.png");
  image(img, 324, -74+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 360, -77+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 396, -80+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 432, -83+y, 30, 36);
  y =y+speed;


  //3danme apple
  img = loadImage("apple_1.png");
  image(img, 0, -122+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 36, -125+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 180, -127+y, 30, 36);
  y =y+speed;



  img = loadImage("apple_1.png");
  image(img, 396, -131+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 432, -134+y, 30, 36);
  y =y+speed;


  //4danme apple
  img = loadImage("apple_1.png");
  image(img, 0, -173+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 36, -176+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 180, -178+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 324, -252+y, 30, 36);
  y =y+speed;

  //5danme apple
  img = loadImage("apple_1.png");
  image(img, 0, -220+y, 30, 36);
  y =y+speed;


  img = loadImage("apple_1.png");
  image(img, 0, -223+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 36, -226+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 108, -229+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 180, -232+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 252, -235+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 324, -238+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 396, -241+y, 30, 36);
  y =y+speed;

  // 6danme apple
  img = loadImage("apple_1.png");
  image(img, 0, -279+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 36, -282+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 72, -285+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 144, -288+y, 30, 36);
  y =y+speed;
  img = loadImage("apple_1.png");
  image(img, 180, -291+y, 30, 36);
  y =y+speed;

  img = loadImage("apple_1.png");
  image(img, 324, -224+y, 30, 36);
  y =y+speed;




  //red A

  tint(A, 0, 0);

  img3 = loadImage("apple_2.png");
  image(img3, 108, -227+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 144, -264+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 108, -303+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 144, -235+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 72, -274+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 72, -242+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 72, -209+y, 30, 36);
  y =y+speed;
  img3 = loadImage("apple_2.png");
  image(img3, 144, -211+y, 30, 36);
  y =y+speed;

  //red p
  tint(B, F, 0);

  img4 = loadImage("apple_3.png");
  image(img4, 216, -250+y, 30, 36);
  y =y+speed;
  img4 = loadImage("apple_3.png");
  image(img4, 252, -254+y, 30, 36);
  y =y+speed;
  img4 = loadImage("apple_3.png");
  image(img4, 288, -256+y, 30, 36);
  y =y+speed;
  img4 = loadImage("apple_3.png");
  image(img4, 216, -223+y, 30, 36);
  y =y+speed;
  img4 = loadImage("apple_3.png");
  image(img4, 216, -333+y, 30, 36);
  y =y+speed;
  img4 = loadImage("apple_3.png");
  image(img4, 252, -336+y, 30, 36);
  y =y+speed;
  img4 = loadImage("apple_3.png");
  image(img4, 288, -339+y, 30, 36);
  y =y+speed;

  img4 = loadImage("apple_3.png");
  image(img4, 216, -306+y, 30, 36);
  y =y+speed;

  img4 = loadImage("apple_3.png");
  image(img4, 288, -309+y, 30, 36);
  y =y+speed;


  //red P2
  tint(C, G, 0);

  img5 = loadImage("apple_4.png");
  image(img5, 360, -278+y, 30, 36);
  y =y+speed;

  img5 = loadImage("apple_4.png");
  image(img5, 360, -245+y, 30, 36);
  y =y+speed;
  img5 = loadImage("apple_4.png");
  image(img5, 396, -283+y, 30, 36);
  y =y+speed;
  img5 = loadImage("apple_4.png");
  image(img5, 432, -286+y, 30, 36);
  y =y+speed;

  img5 = loadImage("apple_4.png");
  image(img5, 360, -326+y, 30, 36);
  y =y+speed;

  img5 = loadImage("apple_4.png");
  image(img5, 432, -328+y, 30, 36);
  y =y+speed;

  img5 = loadImage("apple_4.png");
  image(img5, 360, -366+y, 30, 36);
  y =y+speed;
  img5 = loadImage("apple_4.png");
  image(img5, 396, -369+y, 30, 36);
  y =y+speed;
  img5 = loadImage("apple_4.png");
  image(img5, 432, -372+y, 30, 36);
  y =y+speed;


  //red l
  tint(D, H, 0);


  img6 = loadImage("apple_5.png");
  image(img6, 108, -197+y, 30, 36);
  y =y+speed;

  img6 = loadImage("apple_5.png");
  image(img6, 144, -200+y, 30, 36);
  y =y+speed;

  img6 = loadImage("apple_5.png");
  image(img6, 180, -203+y, 30, 36);
  y =y+speed;

  img6 = loadImage("apple_5.png");
  image(img6, 108, -242+y, 30, 36);
  y =y+speed;

  img6 = loadImage("apple_5.png");
  image(img6, 108, -281+y, 30, 36);
  y =y+speed;


  //red E
  tint(0, E, I);


  img7 = loadImage("apple_6.png");
  image(img7, 252, -212+y, 30, 36);
  y =y+speed;


  img7 = loadImage("apple_6.png");
  image(img7, 288, -215+y, 30, 36);
  y =y+speed;

  img7 = loadImage("apple_6.png");
  image(img7, 324, -218+y, 30, 36);
  y =y+speed;

  img7 = loadImage("apple_6.png");
  image(img7, 252, -257+y, 30, 36);
  y =y+speed;

  img7 = loadImage("apple_6.png");
  image(img7, 288, -260+y, 30, 36);
  y =y+speed;

  img7 = loadImage("apple_6.png");
  image(img7, 252, -300+y, 30, 36);
  y =y+speed;
  img7 = loadImage("apple_6.png");
  image(img7, 288, -302+y, 30, 36);
  y =y+speed;
  img7 = loadImage("apple_6.png");
  image(img7, 324, -305+y, 30, 36);
  y =y+speed;



  // apple no ki hidari
  img2 = loadImage("ringo2.png");
  for (int i=0; i<255; i ++) {         
    tint(0, i, i);

    image(img2, 0, -230, eSize, 577);
  }
  //apple no ki migi
  img8 = loadImage("ringo3.png");
  for (int i=0; i<255; i ++) {         
    tint(0, i, 0);

    image(img8, 150, -350, eSize, 577);
  }



  if (y >= 400) {
    y=400;
  }
}


// apple no ki ga yureru
void mousePressed() {
  eSize=350;
  speed =3;
}


// apple no ki ga motonimodoru
void mouseReleased() {
  eSize=308;
}



void keyPressed() {

  switch(key) {
    // apple no [a] ga hyouzisareru
  case 'a':
    A =255;
    println("a");
    break;



    // p ga hyouzi sareru
  case 'p':
    B = 255;
    F = 140;
    println("p");
    break;
    // p ga hyouzi sareru
  case 'P':
    C = 255;
    G = 215;
    println("P");
    break;
    // l ga hyouzi sareru
  case 'l':
    D = 150;
    H = 255;
    println("l");
    break;
    // e ga hyouzi sareru
  case 'e':
    E = 255;
    I = 255;
    println("e");
    break;
    // supotto right ga tuku
  case 'b':
    for (int x=0; x<=230; x ++) {
      stroke(200, 230, x, 50);
      noFill();
      ellipse(490-x, 520-x, x, x);
    }

    for (int x=0; x<=230; x ++) {
      stroke(200, 250, x, 50);
      noFill();
      ellipse(-40+x, 520-x, x, x);
    }
    println("e");
    break;
  }
}



