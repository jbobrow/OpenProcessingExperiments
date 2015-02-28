

// 1st ellipse
float x = 395; // current x
float y = 153; // current y
int sx = 395; //start x
int sy = 153; // start y
int tx = 450; // target x
int ty = 157; // target y
int ex = 450; // end x
int ey = 157; // end y
// variables ellipse 2
float x2 = 382; // current x
float y2= 146; // current y

int sx2 = 382; //start x
int sy2 = 146; // start y

int tx2 = 440; // target x
int ty2 = 145; // target y

int ex2 = 440; // end x
int ey2 = 145; // end y

//variables ellipse 3

float x3 = 367; // current x
float y3= 146; // current y

int sx3 = 367; //start x
int sy3 = 146; // start y

int tx3 = 426; // target x
int ty3 = 140; // target y

int ex3 = 426; // end x
int ey3 = 140; // end y

// variables ellipse 4

float x4 = 355; // current x
float y4= 155; // current y

int sx4 = 355; //start x
int sy4 = 155; // start y

int tx4 = 412; // target x
int ty4 = 137; // target y

int ex4 = 412; // end x
int ey4 = 137; // end y

//variables ellipse 5

float x5 = 391; // current x
float y5 = 168; // current y

int sx5 = 391; // start x
int sy5 =  168; // start y

int tx5 = 396; // target x
int ty5 = 140; // target y

int ex5 = 396; //end x
int ey5 = 140; // end y

//variables ellipse 6
//ellipse(378,176)

float x6 = 378; // current x
float y6 = 176; // current y

int sx6 = 378; // start x
int sy6 =  176; // start y

int tx6 = 390; // target x
int ty6 = 155; // target y

int ex6 = 390; //end x
int ey6 = 155; // end y

//variables ellipse 7
////ellipse(364,182)

float x7 = 364; // current x
float y7 = 182; // current y

int sx7 = 364; // start x
int sy7 =  182; // start y

int tx7 = 378; // target x
int ty7 = 165; // target y

int ex7 = 378; //end x
int ey7 = 165; // end y

//variables ellipse 8
//ellipse(349,182)

float x8 = 349; // current x
float y8 = 182; // current y

int sx8 = 349; // start x
int sy8 =  182; // start y

int tx8 = 363; // target x
int ty8 = 170; // target y

int ex8 = 363; //end x
int ey8 = 170; // end y

//variables ellipse 9_purple

float x9 = 334; // current x
float y9 = 182; // current y

int sx9 = 334; // start x
int sy9 =  182; // start y

int tx9 = 348; // target x
int ty9 = 173; // target y

int ex9 = 348; //end x
int ey9 = 173; // end y

//variables ellipse 10_blue

float x10 = 320; // current x
float y10 = 182; // current y

int sx10 = 320; // start x
int sy10 =  182; // start y

int tx10 = 334; // target x
int ty10 = 173; // target y

int ex10 = 334; //end x
int ey10 = 173; // end y

//variables ellipse 11
//ellipse(304,182)

float x11 = 304; // current x
float y11 = 182; // current y

int sx11 = 304; // start x
int sy11 =  182; // start y

int tx11 = 320; // target x
int ty11 = 177; // target y

int ex11 = 320; //end x
int ey11 = 177; // end y

//variables ellipse 12
//ellipse(289,179)

float x12 = 289; // current x
float y12 = 179; // current y

int sx12 = 289; // start x
int sy12 =  179; // start y

int tx12 = 305; // target x
int ty12 = 180; // target y

int ex12 = 305; //end x
int ey12 = 180; // end y

//variables ellipse 13
//ellipse(274,175)

float x13 = 274; // current x
float y13 = 175; // current y

int sx13= 274; // start x
int sy13 =  175; // start y

int tx13 = 290; // target x
int ty13 = 185; // target y

int ex13 = 290; //end x
int ey13 = 185; // end y

//variables ellipse 14
//ellipse(260,167)

float x14 = 260; // current x
float y14 = 167; // current y

int sx14= 260; // start x
int sy14 =  167; // start y

int tx14 = 276; // target x
int ty14 = 182; // target y

int ex14 = 276; //end x
int ey14 = 182; // end y

//variables ellipse 15
//ellipse(245,162)

float x15 = 245; // current x
float y15 = 162; // current y

int sx15= 245; // start x
int sy15 =  162; // start y

int tx15 = 261; // target x
int ty15 = 178; // target y

int ex15 = 261; //end x
int ey15 = 178; // end y


//foot

int footstartx = 279;//constants
int footstarty = 300;

int footx = 279;//this one changes
int footy = 300;

int footendx = 268;//constants
int footendy = 278;

//eye winking ellipse (275,117,5,5)

int rteyestartx = 275; //  constant
int rteyestarty = 117; 

int rteyex = 275; // changes
int rteyey = 117;

int rteyeendx =0;  // constant
int rteyeendy = 0;


//kissy mouth

int mouthstartx = 223;//constants
int mouthstarty = 183;

int mouthx = 223;//this one changes
int mouthy = 183;

int mouthendx = 249;//constants
int mouthendy = 186;



float easing = 0.01;

boolean vector = false;


PImage img, img2, img4, i;

PShape s; //head

void setup ( )   {

  smooth();

  size (480,320); 

  x = sx;
  y = sy;

  x2 = sx2;
  y2 = sy2;

  x3 = sx3;
  y3 = sy3;

  x4 = sx4;
  y4 = sy4;

  x5 = sx5;
  y5 = sy5;

  x6 = sx6;
  y6 = sy6;

  x7 = sx7;
  y7 = sy7;

  x8 = sx8;
  y8 = sy8;

  x9 = sx9;
  y9 = sy9;


  x10 = sx10;
  y10 = sy10;

  x11 = sx11;
  y11 = sy11;

  x12 = sx12;
  y12 = sy12;

  x13 = sx13;
  y13 = sy13;

  x14 = sx14;
  y14 = sy14;

  x15 = sx15;
  y15 = sy15;


  img = loadImage ("Street.png");//background
  
  i = loadImage ("street_head.png"); //i
  s = loadShape ("robotheadtest.svg");//s

  img2 = loadImage ("mustache1edit.png");//man
  img4 = loadImage ("mustache3edit.png");//man 2



}


void draw ( )   {
  background (img);

  if (vector == true) {

    shape(s, 0, 0);

  } 
  else {
    image(i,3,-110);
  }

  image(img2, 150, 73); //far right
  image (img4, -50, 100, 200,400); //far left
  //shape (s,0,0);

  x += (tx - x) * easing;
  y += (ty - y) * easing;

  x2 += (tx2 - x2) * easing;
  y2 += (ty2-y2) * easing;

  x3 += (tx3 - x3) * easing;
  y3 += (ty3-y3) * easing;

  x4 += (tx4 - x4) * easing;
  y4 += (ty4-y4) * easing;

  x5 += (tx5 - x5)*easing;
  y5 += (ty5 - y5)*easing;

  x6 += (tx6 - x6)*easing;
  y6 += (ty6 - y6)*easing;

  x7 += (tx7 - x7)*easing;
  y7 += (ty7 - y7)*easing;

  x8 += (tx8 - x8)*easing;
  y8 += (ty8 - y8)*easing;

  x9 += (tx9 - x9)*easing;
  y9 += (ty9 - y9)*easing;

  x10 += (tx10 - x10)*easing;
  y10 += (ty10 - y10)*easing;

  x11 += (tx11 - x11)*easing;
  y11 += (ty11 - y11)*easing;

  x12 += (tx12 - x12)*easing;
  y12 += (ty12 - y12)*easing;

  x13 += (tx13 - x13)*easing;
  y13 += (ty13 - y13)*easing;

  x14 += (tx14 - x14)*easing;
  y14 += (ty14 - y14)*easing;

  x15 += (tx15 - x15)*easing;
  y15 += (ty15 - y15)*easing;

  footx += (footendx - footx) * easing; // foot
  footy += (footendy - footy) * easing; // foot


  //robot Head settings

  //fill(0,173,238);
  //strokeWeight(4);
  //ellipse(232,140,150,150);


  //right arm

  strokeWeight(0);


  fill(230,77,63);
  ellipse(x15,y15,15,15);
  fill(255,82,0);
  ellipse(x14,y14,15,15);
  fill(255,129,95);
  ellipse(x13,y13,15,15);
  fill(255,250,95);
  ellipse(x12,y12,15,15);
  fill(0,223,2);
  ellipse(x11,y11,15,15);
  fill(208,127,255);
  ellipse(x9,y9,15,15);
  fill(63,100,255);
  ellipse(x10,y10,15,15);

  //second round ofright arm

  fill(230,77,63);
  ellipse(x8,y8,15,15);
  fill(255,82,0);
  ellipse(x7,y7,15,15);
  fill(255,129,95);
  ellipse(x6,y6,15,15);
  fill(255,250,95);
  ellipse(x5,y5,15,15);
  fill(0,223,2);
  ellipse(x,y,15,15);
  fill(63,100,255);
  ellipse(x2,y2,15,15);
  fill(208,127,255);
  ellipse(x3,y3,15,15);
  fill(223, 0,56);
  ellipse(x4,y4,15,15);

  //left arm

  fill(230,77,63);
  ellipse(220,162,15,15);
  fill(255,82,0);
  ellipse(205,167,15,15);
  fill(255,129,95);
  ellipse(193,177,15,15);
  fill(255,250,95);
  ellipse(180,184,15,15);
  fill(0,223,2);
  ellipse(166,190,15,15);
  fill(63,100,255);
  ellipse(151,190,15,15);
  fill(208,127,255);
  ellipse(136,190,15,15);

  //second round of left arm

  fill(230,77,63);
  ellipse(121,190,15,15);
  fill(255,82,0);
  ellipse(106,187,15,15);
  fill(255,129,95);
  ellipse(92,180,15,15);
  fill(255,250,95);
  ellipse(80,170,15,15);
  fill(0,223,2);
  ellipse(77,155,15,15);
  fill(63,100,255);
  ellipse(89,146,15,15);
  fill(208,127,255);
  ellipse(104,148,15,15);
  fill(223, 0,56);
  ellipse(118,155,15,15);


  //center mustache
  fill(223, 0,56);
  ellipse(233,160,13,13);

  //eyes
  //fill(50);
  //smooth();
  //bezier(203,113,203,113,232,113,229,116);//left eye lid
  //ellipse(225,116,5,5);//left pupil
  //bezier(253,113,253,113,282,113,279,116);//right eye lid
  //ellipse(rteyex,rteyey,5,5); //(275,117,5,5);




  //bezier(mouthstartx,mouthstarty,223,183,252,173,mouthendx,mouthendy);





  //legs
  strokeWeight(5);
  line(210,213,202,300);//lft leg
  line(253,213,258,300);//rt leg

  //feet
  line(182,300,202,300);//lft foot
  line(258,300,footx,footy);//rt foot

}

void mousePressed ( ) {
  tx = ex;
  ty = ey;

  tx2 = ex2;
  ty2 = ey2;

  tx3 = ex3;
  ty3 = ey3;

  tx4 = ex4;
  ty4 = ey4;

  tx5 = ex5;
  ty5 = ey5;

  tx6 = ex6;
  ty6 = ey6;

  tx7 = ex7;
  ty7 = ey7;

  tx8 = ex8;
  ty8 = ey8;

  tx9 = ex9;
  ty9 = ey9;

  tx10 = ex10;
  ty10 = ey10;

  tx11 = ex11;
  ty11 = ey11;

  tx12 = ex12;
  ty12 = ey12;

  tx13 = ex13;
  ty13 = ey13;

  tx14 = ex14;
  ty14 = ey14;

  tx15 = ex15;
  ty15 = ey15;
}



void mouseReleased ( )   {
  tx = sx;
  ty = sy;

  tx2 = sx2;
  ty2 = sy2;

  tx3 = sx3;
  ty3 = sy3;

  tx4 = sx4;
  ty4 = sy4;

  tx5 = sx5;
  ty5 = sy5;

  tx6 = sx6;
  ty6 = sy6;

  tx7 = sx7;
  ty7 = sy7;

  tx8 = sx8;
  ty8 = sy8;

  tx9 = sx9;
  ty9 = sy9;

  tx10 = sx10;
  ty10 = sy10;

  tx11 = sx11;
  ty11 = sy11;

  tx12 = sx12;
  ty12 = sy12;

  tx13 = sx13;
  ty13 = sy13;

  tx14 = sx14;
  ty14 = sy14;

  tx15 = sx15;
  ty15 = sy15;


}

void mouseMoved( )  {


  // foot raising
  if (mouseY < pmouseY) {
    footx = footstartx;
    footy = footstarty;
  }
  if (mouseY > pmouseY) {
    footx = footendx;
    footy = footendy;
  }
}


void keyPressed() {
  if (key == ' ') {
    if (vector == true) {
      vector = false;
    } 
    else {
      vector = true;
    }
    //vector = !vector, //this line is the same as the five above
  }
}










