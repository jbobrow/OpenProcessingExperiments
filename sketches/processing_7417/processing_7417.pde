
PImage album01;
PImage album02;
PImage album03;
PImage album04;
PImage album05;
PImage album07;
PImage album08;
PImage album09;
PImage album10;
PImage album11;
PImage album15;
PImage album16;
PImage album17;
PImage album18;
PImage album19;
PImage album20;
PImage album21;
PImage album22;
PImage album23;
PImage album24;
PImage album25;
PImage album26;
PImage album27;
PImage album28;

float x; 
float y;
float r; 
int a;
float b;
float c;
float d;
float e;
float r1;
float r2;

int a1;
int a2;
int a3;
int a4;
int a5;
int a6;
int a7;
int a8;
int a9;
int a10;
int a11;
int a12;
int a13;
int a14;
int a15;
int a16;
int a17;
int a18;
int a19;
int a20;
int a21;
int a22;
int a23;
int a24;

PFont font1,font2;

void setup() {
  size(640, 480);
  background(0);
  noLoop();
  frameRate(1);
  smooth();
  album01 = loadImage("album01.jpg");
  album02 = loadImage("album02.jpg");
  album03 = loadImage("album03.jpg");
  album04 = loadImage("album04.jpg");
  album05 = loadImage("album05.png");
  album07 = loadImage("album07.jpg");
  album08 = loadImage("album08.jpg");
  album09 = loadImage("album09.jpg");
  album10 = loadImage("album10.jpg");
  album11 = loadImage("album11.jpeg");
  album15 = loadImage("album15.jpg");
  album16 = loadImage("album16.jpg");
  album17 = loadImage("album17.jpg");
  album18 = loadImage("album18.jpg");
  album19 = loadImage("album19.jpg");
  album20 = loadImage("album20.jpg");
  album21 = loadImage("album21.jpg");
  album22 = loadImage("album22.jpg");
  album23 = loadImage("album23.jpg");
  album24 = loadImage("album24.jpg");
  album25 = loadImage("album25.jpg");
  album26 = loadImage("album26.jpg");
  album27 = loadImage("album27.jpg");
  album28 = loadImage("album28.jpg");
} 

void draw() {
  float s1 = random(0.5, 1.0);
  float s2 = random(0.3, 0.7);
  float s3 = random(0.4, 0.9);
  float s4 = random (0.2, 0.6);
  float s5 = random (0.9, 2.0);
  int a1= int(random (1,10));
  int a2= int(random (1,10));
  int a3= int(random (1,10));
  int a4= int(random (1,10));
  int a5= int(random (1,10));
  int a6= int(random (1,10));
  int a7= int(random (1,10));
  int a8= int(random (1,10));
  int a9= int(random (1,10));
  int a10= int(random (1,10));
  int a11= int(random (1,10));
  int a12= int(random (1,10));
  int a13= int(random (1,10));
  int a14= int(random (1,10));
  int a15= int(random (1,10));
  int a16= int(random (1,10));
  int a17= int(random (1,10));
  int a18= int(random (1,10));
  int a19= int(random (1,10));
  int a20= int(random (1,10));
  int a21= int(random (1,10));
  int a22= int(random (1,10));
  int a23= int(random (1,10));
  int a24= int(random (1,10));

// Blonde on Blonde
if (a1>0){
  if (a1<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s5);
  rotate(r);
  image(album02, -x, -y);
  popMatrix();
  }
}

// Beggars Banquet
if (a2>0){
  if (a2<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s5);
  rotate(r);
  image(album04, -x, -y);
  popMatrix();
  }
}

// Dark Side of the Moon
if (a3>0){
  if (a3<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s5);
  rotate(r);
  image(album05, -x, -y);
  popMatrix();
  }
}

// Exile on Main Street
if (a4>0){
  if (a4<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s5);
  rotate(r);
  image(album07, -x, -y);
  popMatrix();
  }
}

// Electric Ladyland
if (a5>0){
  if (a5<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s5);
  rotate(r);
  image(album09, -x, -y);
  popMatrix();
  }
}

// Led Zeppelin IV
if (a6>0){
  if (a6<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s5);
  rotate(r);
  image(album10, -x, -y);
  popMatrix();
  }
}

// Led Zeppelin II
if (a7>0){
  if (a7<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album11, -x, -y);
  popMatrix();
  }
}
  
  
// Axis: Bold as Love
if (a8>0){
  if (a8<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album01, -x, -y);
  popMatrix();
  }
}

// My Generation
if (a9>0){
  if (a9<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album15, -x, -y);
  popMatrix();
  }
}
  
// Quadrophenia
if (a10>0){
  if (a10<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album25, -x, -y);
  popMatrix();
  }
}

// Revolver
if (a11>0){
  if (a11<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album17, -x, -y);
  popMatrix();
  }
}

// Let It Bleed
if (a12>0){
  if (a12<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album18, -x, -y);
  popMatrix();
  }
}
  
// Highway 61 Revisited
if (a13>0){
  if (a13<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album08, -x, -y);
  popMatrix();
  }
}

//Rubber Soul
if (a14>0){
  if (a14<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s4);
  rotate(r);
  image(album19, -x, -y);
  popMatrix();
  }
}

// Sounds of Silence
if (a15>0){
  if (a15<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album21, -x, -y);
  popMatrix();
  }
}

// L.A. Woman
if (a16>0){
  if (a16<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album22, -x, -y);
  popMatrix();
  }
}

// Morrison Hotel
if (a17>0){
  if (a17<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album23, -x, -y);
  popMatrix();
  }
}

// The Soft Parade
if (a18>0){
  if (a18<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album24, -x, -y);
  popMatrix();
  }
}
  
// The Piper at the Gates of Dawn
if (a19>0){
  if (a19<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s1);
  rotate(r);
  image(album16, -x, -y);
  popMatrix();
  }
}
  

// Who's Next
if (a20>0){
  if (a20<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s2);
  rotate(r);
  image(album26, -x, -y);
  popMatrix();
  }
}
  
// Abbey Road
if (a21>0){
  if (a21<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s2);
  rotate(r);
  image(album03, -x, -y);
  popMatrix();
  }
}


// Tommy
if (a22>0){
  if (a22<10){
  x = random(50,590);
  y = random(50,430);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s3);
  rotate(r);
  image(album27, -x, -y);
  popMatrix();
  }
}

// Are You Experienced?
if (a23>0){
  if (a23<10){
  x = random(0,640);
  y = random(0,480);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s3);
  rotate(r);
  image(album28, -x, -y);
  popMatrix();
  }
}

// Sgt. Pepper's Lonely Hearts Club Band
if (a24>0){
  if (a24<10){
  x = random(-50,690);
  y = random(-50,530);
  r = random(0, radians (360));
  pushMatrix();
  translate(x, y);
  scale(s3);
  rotate(r);
  image(album20, -x, -y);
  popMatrix();
  }
}


//Text

font1= loadFont ("AgencyFB-Bold-48.vlw");
textFont (font1);
fill (255);
textSize (180);

  //random number generator
int a= int(random (1,24));
b= random (15, 420);
c= random (60,180);
d= random (60,300);
e= random (60,200);
r1= random (10, 490);

if (a>0){
  if (a<2){
    textSize (20);
    fill (0);
text ("Sgt. Pepper's Lonely Hearts Club Band", r1+2, 2+b,125,150);
fill (255);
  String lines = "Sgt. Pepper's Lonely Hearts Club Band";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Beatles", 5, 5);
textSize (c);
fill (255);
text ("The Beatles", 0, 0);
popMatrix();


  }
}


if (a>1){
  if (a<3){
    textSize (20);
    fill (0);
text ("Are You Experienced?", r1+2, 2+b,125,150);
fill (255);
  String lines = "Are You Experienced?";
  text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Jimi Hendrix", 5, 5);
textSize (c);
fill (255);
text ("Jimi Hendrix", 0, 0);
popMatrix();
  }
}

if (a>2){
  if (a<4){
    textSize (20);
    fill (0);
text ("Tommy", r1+2, 2+b,125,150);
fill (255);
  String lines = "Tommy";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Who", 5, 5);
textSize (c);
fill (255);
text ("The Who", 0, 0);
popMatrix();
  }
}

if (a>3){
  if (a<5){
    textSize (20);
    fill (0);
text ("Abbey Road",r1+2, 2+b,125,150);
fill (255);
  String lines = "Abbey Road";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Beatles", 5, 5);
textSize (c);
fill (255);
text ("The Beatles", 0, 0);
popMatrix();


  }
}


if (a>4){
  if (a<6){
    textSize (20);
    fill (0);
text ("Who's Next",r1+2, 2+b,125,150);
fill (255);
  String lines = "Who's Next";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Who", 5, 5);
textSize (c);
fill (255);
text ("The Who", 0, 0);
popMatrix();
  }
}

if (a>5){
  if (a<7){
    textSize (20);
    fill (0);
text ("The Piper at the Gates of Dawn",r1+2, 2+b,125,150);
fill (255);
  String lines = "The Piper at the Gates of Dawn";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Pink Floyd", 5, 5);
textSize (c);
fill (255);
text ("Pink Floyd", 0, 0);
popMatrix();
  }
}

if (a>6){
  if (a<8){
    textSize (20);
    fill (0);
text ("The Soft Parade",r1+2, 2+b,125,150);
fill (255);
  String lines = "The Soft Parade";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Doors", 5, 5);
textSize (c);
fill (255);
text ("The Doors", 0, 0);
popMatrix();
  }
}

if (a>7){
  if (a<9){
    textSize (20);
    fill (0);
text ("Morrison Hotel",r1+2, 2+b,125,150);
fill (255);
  String lines = "Morrison Hotel";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Doors", 5, 5);
textSize (c);
fill (255);
text ("The Doors", 0, 0);
popMatrix();
  }
}

if (a>8){
  if (a<10){
    textSize (20);
    fill (0);
text ("L.A. Woman", r1+2, 2+b,125,150);
fill (255);
  String lines = "L.A. Woman";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Doors", 5, 5);
textSize (c);
fill (255);
text ("The Doors", 0, 0);
popMatrix();
  }
}

if (a>9){
  if (a<11){
    textSize (20);
    fill (0);
text ("Sounds of Silence",r1+2, 2+b,125,150);
fill (255);
  String lines = "Sounds of Silence";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Simon and Garfunkel", 5, 5);
textSize (c);
fill (255);
text ("Simon and Garfunkel", 0, 0);
popMatrix();
  }
}

if (a>10){
  if (a<12){
    textSize (20);
    fill (0);
text ("Rubber Soul",r1+2, 2+b,125,150);
fill (255);
  String lines = "Rubber Soul";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Beatles", 5, 5);
textSize (c);
fill (255);
text ("The Beatles", 0, 0);
popMatrix();

  }
}

if (a>11){
  if (a<13){
    textSize (20);
    fill (0);
text ("Highway 61 Revisited",r1+2, 2+b,125,150);
fill (255);
  String lines = "Highway 61 Revisited";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Bob Dylan", 5, 5);
textSize (c);
fill (255);
text ("Bob Dylan", 0, 0);
popMatrix();
  }
}

if (a>12){
  if (a<14){
    textSize (20);
    fill (0);
text ("Blonde on Blonde",r1+2, 2+b,125,150);
fill (255);
  String lines = "Blonde on Blonde";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Bob Dylan", 5, 5);
textSize (c);
fill (255);
text ("Bob Dylan", 0, 0);
popMatrix();
  }
}

if (a>13){
  if (a<15){
    textSize (20);
    fill (0);
text ("Let It Bleed",r1+2, 2+b,125,150);
fill (255);
  String lines = "Let It Bleed";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Rolling Stones", 5, 5);
textSize (c);
fill (255);
text ("The Rolling Stones", 0, 0);
popMatrix();
  }
}

if (a>14){
  if (a<16){
    textSize (20);
    fill (0);
text ("Revolver",r1+2, 2+b,125,150);
fill (255);
  String lines = "Revolver";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Beatles", 5, 5);
textSize (c);
fill (255);
text ("The Beatles", 0, 0);
popMatrix();

  }
}

if (a>15){
  if (a<17){
    textSize (20);
    fill (0);
text ("Quadrophenia",r1+2, 2+b,125,150);
fill (255);
  String lines = "Quadrophenia";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Who", 5, 5);
textSize (c);
fill (255);
text ("The Who", 0, 0);
popMatrix();
  }
}

if (a>16){
  if (a<18){
    textSize (20);
    fill (0);
text ("My Generation",r1+2, 2+b,125,150);
fill (255);
  String lines = "My Generation";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Who", 5, 5);
textSize (c);
fill (255);
text ("The Who", 0, 0);
popMatrix();
  }
}

if (a>17){
  if (a<19){
    textSize (20);
    fill (0);
text ("Axis: Bold as Love",r1+2, 2+b,125,150);
fill (255);
  String lines = "Axis: Bold as Love";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Jimi Hendrix", 5, 5);
textSize (c);
fill (255);
text ("Jimi Hendrix", 0, 0);
popMatrix();
  }
}

if (a>18){
  if (a<20){
    textSize (20);
    fill (0);
text ("Led Zeppelin II", r1+2, 2+b,125,150);
fill (255);
  String lines = "Led Zeppelin II";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Led Zeppelin", 5, 5);
textSize (c);
fill (255);
text ("Led Zeppelin", 0, 0);
popMatrix();
  }
}

if (a>19){
  if (a<21){
    textSize (20);
    fill (0);
text ("Led Zeppelin IV", r1+2, 2+b,125,150);
fill (255);
  String lines = "Led Zeppelin IV";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Led Zeppelin", 5, 5);
textSize (c);
fill (255);
text ("Led Zeppelin", 0, 0);
popMatrix();
  }
}

if (a>20){
  if (a<22){
    textSize (20);
    fill (0);
text ("Electric Ladyland",r1+2, 2+b,125,150);
fill (255);
  String lines = "Electric Ladyland";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Jimi Hendrix", 5, 5);
textSize (c);
fill (255);
text ("Jimi Hendrix", 0, 0);
popMatrix();
  }
}

if (a>21){
  if (a<23){
    textSize (20);
    fill (0);
text ("Exile on Main Street", r1+2, 2+b,125,150);
fill (255);
  String lines = "Exile on Main Street";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Rolling Stones", 5, 5);
textSize (c);
fill (255);
text ("The Rolling Stones", 0, 0);
popMatrix();
  }
}

if (a>22){
  if (a<24){
    textSize (20);
    fill (0);
text ("Dark Side of the Moon",r1+2, 2+b,125,150);
fill (255);
  String lines = "Dark Side of the Moon";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("Pink Floyd", 5, 5);
textSize (c);
fill (255);
text ("Pink Floyd", 0, 0);
popMatrix();
  }
}

if (a>23){
  if (a<25){
    textSize (20);
    fill (0);
text ("Beggar's Banquet",r1+2, 2+b,125,150);
fill (255);
  String lines = "Beggar's Banquet";
text (lines, r1,b,125,150);
r= random (0,radians (360));
x= random (50,590);
y= random (50,430);
pushMatrix();
translate (x,y);
rotate (r);
fill (0);
textSize (c);
text ("The Rolling Stones", 5, 5);
textSize (c);
fill (255);
text ("The Rolling Stones", 0, 0);
popMatrix();
  }
}



}

void mousePressed() {  
  redraw();  
}  



