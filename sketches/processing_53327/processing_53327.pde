
PImage fallen1;
float f = 0.01; // if clicked, than increased osccilation of fallen
float scaler= 10;
float offset=333;
float d =800;
int radius = 250;

int clicker=0;
PImage cimage; // basically a container to hold the different cursor images
int selector;

PImage hd1; // HEADACHE PICTURES! LEVEL 3
PImage hd2;
PImage hd3;
PImage hd4;
PImage hd5;
PImage hd6;
PImage hd7;
float counter;
float bx=650;// For the distressed finale headache!
float blastoff=350;// connects with bx

PImage eyes11; // cluster fuck of eyes!!! LEVEL 2
float pMillis; //time

PImage sleep2; //level 6 images
PImage sleep3;
PImage sleep4;
PImage sleep5;
PImage sleep6;
PImage sleep7;
PImage sleep8;
PImage sleep9;
PImage sleep10;
PImage sleep11;
PFont font;
String quote1 = "GOOD NIGHT";


float step =.01;

float ff; // initial osscilation

float tx; // to increase tint with each click for fallen LEVEL 1
float lightstep = 50;

float x;
float y;

PImage glitter; // LEVEL 5 BEGINS
PImage blueg;
PImage squiggle;
PImage sq1;
float yf; // variable for the falling glitter puke
float yf1;// and so on
PImage gag;


PImage eyes1;
PImage ache;
PImage bath;
PImage handy; 
PImage chuck;
PImage alchy;
PImage bread;
int level = 1;

float speed =2; 

void setup () {

  size (500, 650);
  fallen1 = loadImage ("fallen1.png");
  eyes1 = loadImage ("eyes1.png");
  ache= loadImage("ache.png");
  bath= loadImage("bathroomfloor1.png");
  //handy= loadImage("handy.png");
  chuck= loadImage ("chuck.png");
  bread= loadImage ("bread.png");
  alchy= loadImage ("alchy.png");
  cimage= loadImage("handy.png");
  x = width/2;
  y= height/2;

  hd1= loadImage("hd1.png");
  hd2= loadImage("hd2.png");
  hd3= loadImage("hd3.png");
  hd4= loadImage("hd4.png");
  hd5= loadImage("hd5.png");
  hd6= loadImage("hd6.png");
  hd7= loadImage("hd7.png");

  eyes11= loadImage ("eyes11.png"); // loading the cluster fuck of eyes
  color blacky= color(0, 0, 0);
  color whitey= color (255, 255, 255);


  gag= loadImage("gag.png"); //           LEVEL 5 Begin
  glitter=loadImage("glitter.png");
  squiggle = loadImage ("squiggle.png");
  glitter.mask(squiggle);

  blueg= loadImage ("blueg.png"); // glitter puke!
  sq1 = loadImage ("sq1.png");
  blueg.mask(sq1);
  yf=280; // where mouth is at
  yf1=330;   // LEVEL 5 Start
  float sped = 1.5;



  sleep2= loadImage("sleep2.png"); //sleep!
  sleep3= loadImage("sleep3.png");
  sleep4= loadImage("sleep4.png");
  sleep5= loadImage("sleep5.png");
  sleep6= loadImage("sleep6.png");
  sleep7= loadImage("sleep7.png");
  sleep8= loadImage("sleep8.png");
  sleep9= loadImage("sleep9.png");
  sleep10= loadImage("sleep10.png");
  sleep11= loadImage("sleep11.png");

  font=loadFont ("Chalkduster-115.vlw");
  textFont(font);
  imageMode(CENTER);
  smooth();
  imageMode(CENTER);
  selector=1;
  background(0);
}

void draw() {

  background (0);


  if (level==1)
  {
    image (bath, width/2, height/2);
    f= f + step;
    d = offset + sin(f) * scaler;

    tint(195, lightstep);
    image (fallen1, width/2, height/2, d, d);
    image (cimage, mouseX, mouseY, 200, 150);
    //        cur
  }

  if (level ==2)
  {
    float r = random(0, 255); // eye cluster collage!
    float g = random(0, 255);
    float b = random(0, 255);
    background(r, g);
    float d= random(0, width);
    float c= random (0, height);
    image(eyes11, d, c, 400, 165);
    if (millis()-pMillis >= 1000) {
      pMillis=millis();
      level=3;
    }
    //image (cimage, mouseX, mouseY, 200, 150);
  }  

  if (level==3)
  {
    background(0);
    for (int i=0; i<width ; i+=2.5) {
      for (int j=0; j<height ; j+=2.5) {
        fill(random(135), random(255));
        rect(i, j, 3, 3);
      }
    }
    if (counter==1) {
      tint (255, 90);
      image(hd1, width/2, height/2);
    }

    if (counter==2) {
      tint (255, 80);
      image (hd2, width/2, height/2);
    }

    if (counter==3) {
      tint (255, 70);
      image (hd3, width/2, height/2);
    }

    if (counter==4) {

      image (hd4, width/2, height/2);
    }

    if (counter==5) {

      image (hd5, width/2, height/2);
    }
    if (counter==6) {

      image (hd6, width/2, height/2);
    }
    if (counter==7) {

      image (hd7, width/2, height/2);
    }
    counter = counter + 1;
    if (counter >=9) {
      bx= bx+ blastoff; //finale headache
      image(hd6, width/2, 150, bx, bx);
      image(hd7, width/2, height/2, bx, 650);
    }
    image (cimage, mouseX, mouseY, 200, 150);
  }

  if (level==5) {
    noStroke();
    for (int i=0; i<width ; i+=4) {
      for (int j=0; j<height ; j+=4) {
        fill(random(224), random(255), random(0));
        rect(i, j, 4, 4);
      }
    }
    float sped =1.5;
    x+=random (-sped, sped);
    x= constrain(x, 270, 620);
    tint(255, 255);
    image(gag, x, height/2);

    image (cimage, mouseX, mouseY, 200, 150);
  }
  if (level==6) {
  

    text(quote1, 40, 80, 500, 650);


    for (int i=0; i<width ; i+=2.5) {
      for (int j=0; j<height ; j+=2.5) {
        tint(255, 255);
        fill(random(135), random(255));
        rect(i, j, 1, 1);
      }
    }

    if (counter==1) {
      image(sleep2, width/2, 500);
    }

    if (counter==2) {
      image(sleep3, width/2, 500);
    }
    if (counter==3) {
      image(sleep4, width/2, 500);
    }
    if (counter==4) {
      image(sleep5, width/2, 500);
    }
    if (counter==5) {
      image(sleep6, width/2, 500);
    }
    if (counter==6) {
      image(sleep7, width/2, 500);
    }
    if (counter==7) {
      image(sleep8, width/2, 500);
    }
    if (counter==8) {
      image(sleep9, width/2, 500);
    }
    if (counter==9) {
      image(sleep10, width/2, 500);
    }
    if (counter==10) {
      image(sleep11, width/2, 500);
    }
    

    counter= counter+1;
    if (counter>=10) {
      counter=0;
    }
  }

  if (level==4) {
    float r = random(0, 255); // eye cluster collage!
    float g = random(0, 255);
    float b = random(0, 255);
    background(r, g);
    float d= random(0, width);
    float c= random (0, height);
    image(eyes11, d, c, 400, 165);
    if (millis()-pMillis >= 1000) {
      pMillis=millis();
      level=5;
    }
  }
}


void mousePressed () {

  step+=.02;
  lightstep +=10;

  //float d2 = offset + sin(ff) * scaler;
  //image (fallen1, width/2, height/2, d2, d3);

  if (selector ==1 || selector ==2) {
    if (level==1) {
      clicker++;
      println(clicker);
      if (clicker>=10) {
        level=2;
        pMillis = millis();
      }
      if (selector ==2) {
        println(clicker);
        if (clicker >=10) {
          level=4;
        }
      }
    }
  }

  if (selector ==4) { //sends you back to fallen state b/c you gave more alchy
    if (level==3) {
      clicker++;
      println(clicker);
      clicker++;
      if (clicker>14) {
        level=1;
        clicker=0;
        //pMillis =millis();
      }
    }
  }

  if (selector ==3) {
    if (level ==3 || level==5) {
      clicker++;
      println(clicker);
      if (clicker >= 13) {
        level =5;
        //clicker=0;
        println(clicker);
        if (level ==5) {
          if (clicker>=22) {
            level = 6;
          }
        }
      }
    }
  }

  if (selector ==4) { // if you give her alchy while throwin up = back to start
    if (level == 5) {
      clicker++;
      println(clicker);
      //clicker++;
      if (clicker >=22) {
        level=1;
        clicker=0;
      }
    }
  }

  if (selector ==3 || selector ==4) { // glitter puke
    if (level ==5) {

      clicker++;
      println(clicker);


      if (clicker>=1) {
        yf+= random (20, speed);
        yf1+=random (15, speed);
      }
      image(glitter, 162, yf, 200, 200);
      image(blueg, 166, yf1, 250, 250);
    }
  }
}

void keyPressed () {
  if (( key == 'h') || (key == 'H')) {
    if (level==1) {
      cimage=loadImage("handy.png");
      selector=1;
    }
  }
  if ((key == 'f') || (key== 'F')) {
    if (level ==1) {
      cimage= loadImage("chuck.png"); // -- change to foot
      selector = 2;
    }
  }

  if ((key =='b') || (key =='B')) {
    if (level ==3 || level ==5) {
      cimage= loadImage("bread.png");
      selector = 3;
    }
  }

  if ((key =='a') || (key =='A')) {
    if (level==3 || level==5) {

      cimage= loadImage("alchy.png");
      selector = 4;
    }
  }
}


