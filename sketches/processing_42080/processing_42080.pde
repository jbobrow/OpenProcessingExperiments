
float rPos;
float cPos1 = 30;
float cPosMod1;
float cPos2;
float cPosMod2;


void setup () {
  size(630, 480);
  PImage background2 = loadImage("rain.jpg");
  image(background2, 0, 0);
  frameRate(5);
}


void draw() {
  fill(33, 57, 206);

  if (cPos1 > 30) {
    cPos1 = cPos1-10;
  } 
  else {
    cPos1 = cPos1+10;
  }
  cPos2 = cPos2+30;

  int cLimit = 14;
  for (int cCount=0; cCount<cLimit; cCount++) {
    /* 0 to 11 */
    fill(random(0,255),random(0,255),random(0,255),random(0,255));

    if (cCount < (cLimit-1)) {
      cPosMod1 = cPosMod1+60;
      cPos2 = cPos2-20;
    } 
    else {
      cPosMod1 = cPosMod1-(60*(cLimit-1));
      cPos2 = cPos2+(20*(cLimit-1));
    }

    ellipse(cPos1+cPosMod1, cPos2, 20, 20);
  }
  
  if((cPos2-(20*(cLimit-1)))>480){
    cPos2 = 0;
  PImage background2 = loadImage("rain.jpg");
  image(background2, 0, 0);
  }
}


