
PFont cent;
PImage one;
PImage one2;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage ten;
PImage eleven;
PImage twelve;
PImage thirteen;
PImage fourteen;
PImage fifteen;
PImage sixteen;
PImage seventeen;

float xx;
float direction = 4;
float xx2;
float yy;


//curve for trees circle
float ebeginX = 20.0;
float ebeginY = 50.0;
float eendX = 900.0;
float eendY = 800.0;
float edistX;
float edistY;
float exponent = 0.5;
float ex = 0.0;
float ey = 0.0;
float step = 0.01;
float pct = 0.0;




void setup() {
  frameRate(60);
  
  smooth();
  background(255);
  size(1000, 800);
  colorMode(RGB);
  noStroke();

  cent = loadFont("CenturyGothic-100.vlw");
  textFont(cent);

  one = loadImage("P1000978.JPG");

  two = loadImage("P1010785.JPG");
  three = loadImage("P1010894.JPG");
  four = loadImage("P1030409.JPG");
  five = loadImage("P1030636.JPG");
  six = loadImage("P1030675.JPG");
  seven = loadImage("P1030880.png");
  eight = loadImage("P1030932.JPG");
  nine = loadImage("P1040432.JPG");
  ten = loadImage("P1040619.JPG");
  eleven = loadImage("P1040651.JPG");
  twelve = loadImage("P1040658.JPG");
  thirteen = loadImage("P1040741.JPG");
  fourteen = loadImage("P1040754.JPG");
  fifteen = loadImage("P1040761.JPG");
  sixteen = loadImage("P1040767.JPG");
  seventeen = loadImage("P1040773.png");

  // = loadImage("");


  imageMode(CENTER);

  xx=width/2;
  edistX = eendX - ebeginX;
  edistY = eendY - ebeginY;
}



void draw() {

  background(255);
  float x = random(0, 1000);
  float y = random(height/4, 500);
  float y2 = random(100, 700);

  float a = random(120, 200);
  float a2 = random(70, 120);
  float s = random(2, 5);
  float n = random(.4, .8);
  float m = random(.1, .4);
  float m2 = random(.3, .5);
  float rw = random(20, 200);

//  float t = random(1, 3);
//  float t2 = random(3, 5);


  

//  tint(5, 255, 190, a2);
//  image(ten, width*.8, height/2, ten.width/2, ten.height/2);
  //  fill(255, 5, 101, a2);
  //  rect(0, y, 1000, 10);



  fill(255, 0, 0, a2);
  ellipse(xx, -yy, 600, 600);
  tint(255, a);
  image(one, width/2, height/2, one.width/2, one.height/2);

  fill(250, 255, 0, a2);
  ellipse(xx, yy, 600, 600);




//  fill(255, 0, 0, a);
//  rect(0, y, 1000, 150);



  //  tint(255, a);
  //  image(three, width/2, height/2);
  fill(4, 66, 82, a2);
  ellipse(xx, -yy, 1000, 1000);




  tint(0, 155, 200, 150);
  image(fourteen, width/3, height/2, fourteen.width*n, fourteen.height*n);
  tint(255, 0, 0, 150);



  //  fill(255, 147, 5, a);
  //  ellipse(width/2, height/2, 800, 800);


  //  tint(255, 185, 5, a);
  //  image(twelve, width/2, y, twelve.width*m2, twelve.height*m2);

  tint(255, a);
  image(one, x, y2, one.width*m, one.height*m);

  tint(255, 0, 0, 150);
  image(four, x, height/3, four.width*m, four.height*m);

  //  fill(38, 42, 209, a2);
  //  rect(0, y2, 1000, 50);

  tint(21, 206, 183, a2);
  image(two, x, height/2, two.width*m, two.height*m);

  tint(0, 155, 200, 150);
  image(fourteen, width/3, y2, fourteen.width*m, fourteen.height*m);

  tint(255, 170, 5, a2);
  image(fifteen, x, y, fifteen.width*m, fifteen.height*m); 

  tint(255, a2);
  image(three, x, y2, three.width*m2, three.height*m2);

  //  tint(255);
  //  fill(255, 0, 0, a2);
  //  rect(x, 0, rw, 800);






  pct += step;
  if (pct <1.0) {
    ex = ebeginX +(pct*edistX);
    ey = ebeginY +(pow(pct, exponent)*edistY);
  }
  tint(255, 243, 5, a2);
  image(seven, ex, ey, seven.width/3, seven.height/3); 

  if (mousePressed ==true) {
    fill(255, 0, 0, 160);
    ellipse(width/2, height/2, 1000, 1000);
 
 
  xx = xx+direction;

  if (xx>width)
  {
    direction = direction * -1;
  }

  xx =width/2 +cos(frameCount/10.0) *200;
  yy=height/2 +sin(frameCount/10.0) *200;
  tint(255, 255);
  image(seventeen, xx, yy, seventeen.width*n, seventeen.height*n);
  //    image(seventeen, width/3, height*.3, seventeen.width*n, seventeen.height*n);

  }

  println(frameRate);
}







