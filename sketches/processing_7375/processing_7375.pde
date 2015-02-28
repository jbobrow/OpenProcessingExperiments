
PImage bg;
PImage L1;
PImage L2;
PImage L4;
PImage L5;
PImage L6;
PImage P1;
PShape P3;
PShape P4;
PImage P5;
PImage P6;
PImage P7;
PImage P8;
PImage C1;
PImage C2;
PImage C3;
PImage T1;
PImage T2;
PImage T3;
PImage T4;
PImage A;
PImage cam;
PImage T;



float x, y, r; 



PFont bodoni;
 String b = "bon voyage!";
 String p = "paris";
 String l = "london";
 


void setup() {
  
   
  size(640, 480);
  smooth();
   bg = loadImage("L7.jpg");

bodoni = loadFont ("BodoniSvtyTwoITCTT-Book-48.vlw");
   textFont(bodoni); //set this on as the current font
   textSize (50); //text size
   textLeading(-40);
   textAlign(LEFT); //left, center, right
   smooth();



background(bg);
  noLoop();
  //frameRate(1);
  
  L1 = loadImage("L1.jpg");
  L2 = loadImage("L2.jpg");
  L4 = loadImage("L4.jpg");
  L5 = loadImage("L5.jpg");
  L6 = loadImage("L6.jpg");
  P1 = loadImage("P1.jpg");
  P3 = loadShape("P3.svg");
  P4 = loadShape("P4.svg");
  P5 = loadImage("P5.png");
  P6 = loadImage("P6.png");
  P7 = loadImage("P7.png");
  P8 = loadImage("P8.jpg");
  C1 = loadImage("C1.png");
  C2 = loadImage("C2.png");
  C3 = loadImage("C4.png");
  T1 = loadImage ("T1.png");
  T2 = loadImage ("T2.png");
  T3 = loadImage ("T3.png");
  T4 = loadImage ("T4.png");
  A = loadImage("P1.png");
  cam = loadImage ("C1.png");
  T = loadImage ("text.png");

} 

void draw() {
  
  
  //view from plane
  x = random (width);
  y = random (height);
  r = random (0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  image(P1, -P1.width/2, -P1.height/2);
  popMatrix();
  
  //tube map
  x = (440);
  y = (290);
  r = random (0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  image(L6, -L6.width/2, -L6.height/2);
  popMatrix();
  
  //bw feet
  x = (560);
  y = (70);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(L1, -L1.width/2, -L1.height/2);
  popMatrix();

  //mona lisa
  x = random (width);
  y = random (height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(P8, -P8.width/2, -P8.height/2);
  popMatrix();
  
  //ticket
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(L5, -L5.width/2, -L5.height/2);
  popMatrix();

  //dcfc
  //x = random(width);
  //y = random(height);
  //r = random(0, TWO_PI);
  //pushMatrix();
  //translate(x, y);
  //rotate(r);
  //image(L2, -L2.width/2, -L2.height/2);
  //popMatrix();



  //luggage
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(P6, -P6.width/2, -P6.height/2);
  popMatrix();
  
    //eiffel hockney
  x = random(width);
  y = random(height);
  r = random(0, PI/.6);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(P5, -P5.width/2, -P5.height/2);
  popMatrix();

  //french man
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  shape(P4, -P4.width/2, -P4.height/2);
  popMatrix();

  //mug
  x = random(width);
  y = random(height);
  r = random(0, PI/3.0);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(P7, -P7.width/2, -P7.height/2);
  popMatrix();

  //eiffel tower
  x = (80);
  y = (250);
  r = random(0, PI/6);
  pushMatrix();
  translate(x, y);
  rotate(r);
  shape(P3, -P3.width/2, -P3.height/2);
  popMatrix();

//pencil
 x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(A, -A.width/2, -A.height/2);
  popMatrix();
  
  
  //camera
   x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(cam, -cam.width/2, -cam.height/2);
  popMatrix();
  
  x =  (380);
  y = (360);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image (T, -T.width/2, -T.height/2);
  popMatrix();
  
  } 


