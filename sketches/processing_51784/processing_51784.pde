
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

void setup() {
  smooth();
  background(255);
  size(1000, 800);
  colorMode(RGB);
  noStroke();

  cent = loadFont("CenturyGothic-100.vlw");
  textFont(cent);

  one = loadImage("P1000978.JPG");
  one2 = loadImage("P1000978.JPG");

  two = loadImage("P1010785.JPG");
  three = loadImage("P1010894.JPG");
  four = loadImage("P1030409.JPG");
  five = loadImage("P1030636.JPG");
  six = loadImage("P1030675.JPG");
  seven = loadImage("P1030880.JPG");
  eight = loadImage("P1030932.JPG");
  nine = loadImage("P1040432.JPG");
  ten = loadImage("P1040619.JPG");
  eleven = loadImage("P1040651.JPG");
  twelve = loadImage("P1040658.JPG");
  thirteen = loadImage("P1040741.JPG");
  fourteen = loadImage("P1040754.JPG");
  fifteen = loadImage("P1040761.JPG");
  sixteen = loadImage("P1040767.JPG");
  seventeen = loadImage("P1040773.JPG");

  // = loadImage("");

  frameRate(1);
  imageMode(CENTER);
}


int time2 = 2000;
int time3 = 3000;
int time4 = 4000;
int time5 = 5000;
int time6 = 6000;
int time7 = 7000;
int time8 = 8000;
int time9 = 9000;
int time10 = 10000;
int time11 = 11000;


void draw() {
  int timer = millis();
  background(255);
  float x = random(0, 1000);
  float y = random(height/4, 500);
  float y2 = random(100, 700);
  //  float d = random(377, 252);
  //  image(one, width/2, height/2, d, d);
  float a = random(120, 200);
  float a2 = random(70, 120);
  float s = random(2, 5);
  float n = random(.4, .8);
  float m = random(.1, .4);
  float m2 = random(.3, .5);
  float rw = random(20, 200);

  float t = random(1, 3);
  float t2 = random(3, 5);



  //  tint(255, a2);
  //  image(one, width/2, height/2);
  //  image(two, width/2, height/2);
  //  image(three, width/2, height/2);
  //  image(four, width/2, height/2);
  //  image(five, width/2, height/2);
  //  image(six, width/2, height/2);
  //  image(seven, width/2, height/2);
  //  image(eight, width/2, height/2);
  //  image(nine, width/2, height/2);
  //  image(ten, width/2, height/2);
  //  image(eleven, width/2, height/2);
  //  image(twelve, width/2, height/2);
  //  image(thirteen, width/2, height/2);
  //  image(fourteen, width/2, height/2);
  //  image(fifteen, width/2, height/2);
  //  image(sixteen, width/2, height/2);
  //  tint(255, 70);
  //  image(seventeen, width/2, height/2);


  if (timer > time2 && timer < time4 ) {
    fill(250, 255, 0, a2);
    ellipse(width/3, height/2, 600, 600);
    tint(255, a);
    image(one, width/2, height/2, one.width/2, one.height/2);
    fill(250, 255, 0, a2);
    scale(s);
    ellipse(width/3, height/2, 600, 600);
    //  text("BALBOA", width/2, height/2);
  }

  if (timer > t && timer <time5) {

    fill(255, 0, 0, a);
    rect(0, y, 1000, 150);
  }

  if (timer>time4 && timer<time6) {
    tint(255, a);
    image(three, width/2, height/2);
    fill(4, 66, 82, a2);
    ellipse(width-100, 200, 1000, 1000);
  }

  if (timer >time5 && timer<time7) {

    tint(0, 155, 200, 150);
    image(fourteen, width/3, height/2, fourteen.width*n, fourteen.height*n);
    tint(255, 0, 0, 150);
    image(four, width*.7, height/3, fourteen.width*n, fourteen.height*n);
  }

  if (timer>time6 && timer<time8) {
    fill(255, 147, 5, a);
    ellipse(width/2, height/2, 800, 800);
  }


  if (timer>time7 && timer<time9) {
    tint(255, 243, 5, a2);
    image(seven, width/3, height*.3, seven.width*n, seven.height*n); 
    tint(5, 255, 190, a2);
    image(ten, width*.8, height/2, ten.width/2, ten.height/2);
    fill(255, 5, 101, a2);
    rect(0, y, 1000, 10);
  }

  else if (timer>=time9) {

    tint(255, 185, 5, a);
    image(twelve, width/2, y, twelve.width*m2, twelve.height*m2);

    tint(255, a);
    image(one, x, y2, one.width*m, one.height*m);

    tint(255, 0, 0, 150);
    image(four, x, height/3, four.width*m, four.height*m);

    fill(38, 42, 209, a2);
    rect(0, y2, 1000, 50);

    tint(21, 206, 183, a2);
    image(two, x, height/2, two.width*n, two.height*n);

    tint(0, 155, 200, 150);
    image(fourteen, width/3, y2, fourteen.width*n, fourteen.height*n);

    tint(255, 170, 5, a2);
    image(fifteen, x, y, fifteen.width*m, fifteen.height*m); 

    tint(255, a2);
    image(three, x, y2, three.width*m2, three.height*m2);

    tint(255);
    fill(255, 0, 0, a2);
    rect(x, 0, rw, 800);

    tint(255, 243, 5, a2);
    image(seven, width/3, height*.3, seven.width*n, seven.height*n);

    if (mousePressed ==true) {
      fill(255, 0, 0, 160);
      ellipse(width/2, height/2, 1000, 1000);
    }
  }
}



void mouseDragged() {
  fill(255);
  text("E X P L O R E", 200, height/2);
}


