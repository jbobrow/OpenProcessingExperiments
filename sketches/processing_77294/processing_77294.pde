

float killX = 0;
float killY = 0;
float kmx = 2;
float kmy = 2;
float runX = 0;
float runY = 0;
float rmx = 3;
float rmy = 3;
float randk =0;
float wandk =0;
float wx = 0;
float wy = 0;
float wmx = 2;
float wmy = 0;
boolean rs = false;
boolean ks = false;
boolean ws = false;
PImage[] images = new PImage[4];

void setup() {
  images[0]  = loadImage("1.png");
  images[1]  = loadImage("2.png");
  images[2]  = loadImage("3.png");
  images[3]  = loadImage("4.png");
  

  size(500, 500);
  smooth();  
  noStroke();  

  killX =random(50, 450);
  killY =random(300, 450);

  runX = random(50, 450);
  runY = random( 50, 200);

  wx = 50;
  wy = 10;
}

void draw() {
  randk = dist(killX, killY, runX, runY);
  wandk = dist(killX, killY, wx, wy);
  image(images[3], 0, 0);
  watcher();
  killer();
  runner();
}


void watcher() {


  fill(255, 0, 255);
  image(images[0], wx, wy);
  wx += wmx;
  wy += wmy;
  if (wx >= width - 40 || wx < 40) {
    wmx=-wmx;
  }
  if (randk < 80) {
    if (ws == false) {
      
      wmy = 10;
      ws=true;
    }
  }
  else {
    ws=false;
  }
  if (wy > killY) {

    wmy = -10;
  }
  if (wy <= 5) {
    wy = 10;
    wmy = 0;
  }
}







void killer() {
  fill(255, 255, 0);
  killX += kmx;
  killY += kmy;
  if (killX>width-20 || killX<20) { 
    kmx=-kmx;
  }
  if (killY>width-35 || killY<50) {
    kmy=-kmy;
  }
  image(images[1], killX, killY);

  if (randk < 200) {    //The chase can be programmed by comparing the x of two creatures and if one x is less than the other than make that x = x + 1
    if (ks == false) {
      if (runX>killX) {

        kmx+= 0.2;
      }
      if (runY>killY) {

        kmy += 0.2;
      }
      ks=true;
    }
    else {
      ks=false;
    }
  }
}

void runner() {
  fill(0, 255, 255);
  runX += rmx;
  runY += rmy;
  if (runX>width-35 || runX<35) { 
    rmx=-rmx;
  }
  if (runY>width-30 ||runY<50) {
    rmy=-rmy;
  }
 image(images[2], runX, runY);
  if (randk < 100) {
    if (rs == false) {
      rmx=-rmx;
      rmy=-rmy;
      rs=true;
    }
  }
  else {
    rs=false;
  }
}


