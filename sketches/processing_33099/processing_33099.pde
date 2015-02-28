

PImage BG;

PImage firstfish;
float fishx;
float fishy;
float fishspeedx;
float fishspeedy;

PImage secfish;
float secfishx;
float secfishy;
float secfishspeedx;
float secfishspeedy;


void setup() {

  fishx=325;
  fishy=294;

  fishspeedx=-1;
  fishspeedy=-1;

  secfishx=98;
  secfishy=345;

  secfishspeedx=-1;
  secfishspeedy=-1;


  size(504, 378);


  BG=loadImage("background.jpg");

  firstfish=loadImage("firstfish.png");

  secfish=loadImage("2ndfish.png");
}

void draw() {


  fishx=fishx+fishspeedx;
  fishy=fishy+fishspeedy;


  if (fishx < 0 || fishx > 504) {
    //fish hit wall
    println("hit wall");
    fishspeedx=fishspeedx*-1;
  }

  if (fishy<0 || fishy>378) {

    fishspeedy=fishspeedy*-1;
  }
  
  secfishx = secfishx+secfishspeedx;
  secfishy = secfishy+secfishspeedy;

  if (secfishx < 0 || secfishx > 504) {
    secfishspeedx=secfishspeedx*-1;
  }
    
  if (secfishy < 0 || secfishy > 378){
    secfishspeedy=secfishspeedy*-1;
  }

  image(BG, 0, 0);
  image(firstfish, fishx, fishy);
  image(secfish, secfishx, secfishy);
}


