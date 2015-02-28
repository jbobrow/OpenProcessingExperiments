
///////////////////////////////////////////////
//initial values

float r, r1, g, t;
float easedR=0;
float easing = 0.04;
float easedG=1;
float easedT=2;

PImage trice;
PImage logo;
PImage gondola;
PImage snowball;
PImage mountain;
PImage tree;


///////////////////////////////////////////////
//setup

void setup()
{
  size(700, 700);
  smooth();
  trice = loadImage("travis.png");
  logo = loadImage("logo.png");
  gondola = loadImage("gondola.png");
  snowball = loadImage("snowball.png");
  mountain = loadImage("mountain.png");
  tree = loadImage("tree.png");
  imageMode(CENTER);
  rectMode(CENTER);
}

void draw()
{
  background(255);
  pushMatrix();
  expload(mouseX);
  //fade image based on mouseX value
  tint(255, mouseX);
  popMatrix();
  snow(mouseX);
  tree(mouseX);
  gondola(mouseX);
  tint(255,255);
  boarder();
  
}

///////////////////////////////////////////////
//image functions

void boarder() {
  pushMatrix();
  translate(width/2, height/2);
  image(trice, 0, 0);
  popMatrix();
}

void snow(float mx) {
  pushMatrix();

  //Map r1 
  r1 = map(mx, 0, width, 0, 500);

  //Easing on r. Instead of r, we'll use easedR
  easedR += (r1 - easedR) * easing;
  float large = millis()/10;


  //map logo and s
  float logoR = map(large, 0, width, 0, 10);
  float s = map(mouseX, 0, width, 1, 1.2);

  //center and rotate
  translate(width/2, height/2);
  rotate(logoR);

  //draw based on eased mouseX value
  for (int m=0; m<=100; m+=10) {
    // translate(10+m, 10+m);
    for (int i=0; i<360; i+=60) {
      pushMatrix();
      float x2 = easedR * cos(radians(i));
      float y2 = easedR * sin(radians(i));
      translate(x2, y2);
      rotate( radians(i));
      scale(s);
      image(snowball, 0, 0);
      println("y2 " + y2);
      println("x2 " + x2);
      println("i " + i);
      println("easedR  " + easedR);
      popMatrix();
    }
  }
  //increase logoR value
  logoR++;
  popMatrix();
}


void expload(float mx) {
  pushMatrix();

  //Map r1 
  r = map(mx, 0, width, 0, 200);

  //custom eased value
  easedR += (r - easedR) * easing;

  //center
  translate(width/2, height/2);

  //draw based on modified mouseX
  for (int i=0; i<=360; i+=40)
  {
    pushMatrix();
    float x = easedR * cos(radians(i));
    float y = easedR * sin(radians(i));
    translate(x, y);
    rotate( radians(i));
    image(logo, 0, 0);
    popMatrix();
  }
  popMatrix();
}

void gondola(float rotateG) {
  pushMatrix();
  
  g = map(rotateG, 0, width, 0, 150);

  //custom eased value
  easedG += (g - easedG) * easing;
  
  translate(width/2,height/2);
  
    for (int i=0; i<=360; i+=60)
  {
    pushMatrix();
    float x3 = easedG * cos(radians(i));
    float y3 = easedG * sin(radians(i));
    translate(x3, y3);
    rotate( radians(i));
    image(gondola, 0, 0);
    popMatrix();
  }
  
  
  popMatrix();
}

void tree(float rotateT) {
  pushMatrix();
  
  t = map(rotateT, 0, width, 0, 200);

  //custom eased value
  easedT += (t - easedT) * easing;
  
  translate(width/2,height/2);
  
    for (int i=0; i<=360; i+=60)
  {
    pushMatrix();
    float x4 = easedT * cos(radians(i));
    float y4 = easedT * sin(radians(i));
    translate(x4, y4);
    rotate( radians(i+90));
    image(tree, 0, 0);
    popMatrix();
  }
  
  
  popMatrix();
}



