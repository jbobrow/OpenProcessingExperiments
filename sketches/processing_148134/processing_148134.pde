
import ddf.minim.*;


AudioPlayer song, song2, song3, song4, song32,song22;

Minim minim;//audio context
Button button1, button2, button3, button4;
PImage FireA,Light;
PImage Empty, back, doll, fButton, fire, face, lighter, acid, aButton, cButton, eButton, hButton, cross, lightning, skeleton, AcidBurn;
float cSize, cX, cY, c2X, c2Y, c3X, c3Y, c4X, c4Y, c5X, c5Y;
int x1, y1, x2, y2, x3, y3, x4, y4, h1, h2, h3, h4, w1, w2, w3, w4;
int screen, hardlight, normal, overlay, exclusion, dodge;

void setup() {
  size (500, 500);

  frameRate(20);
  /////////////Songs
  minim = new Minim(this);
  song = minim.loadFile("OnFire.mp3", 5048);
  song2 = minim.loadFile("PainfulWomanScreaming.wav", 5048);
  song3 = minim.loadFile("Torture.mp3", 5048);
  song4 = minim.loadFile("Saved.mp3", 5048);
  song32 = minim.loadFile("Lightning.mp3", 5048);
  song22 = minim.loadFile("Sizzle.mp3", 5048);

  ///////////////IMages
  back= loadImage("Back.jpg");
  doll=loadImage("doll.png");
  fButton= loadImage("Firebutton.png");
  fire=loadImage("Fire.png");
  lighter= loadImage("Spray.png");
  acid=loadImage("Beaker.png");
  cross=loadImage("Cross.png");
  face=loadImage("Demon.png");
  lightning=loadImage("Lightning.png");
  skeleton=loadImage("Skeleton.png");
  AcidBurn=loadImage("AcidBurn.png");
  aButton=loadImage("BeakerButton.png");
  cButton=loadImage("CrossButton.png");
  eButton=loadImage("LightningButton.png");
  fButton= loadImage("Firebutton.png");
  hButton= loadImage("Home.png");
   Light= loadImage("Light.png");
  Empty= loadImage("empty.png");


  ////////////Positions
  cSize=50;
  cX=25;
  cY=425;
  c2X=25;
  c2Y=325;
  c3X=25;
  c3Y=225;
  c4X=25;
  c4Y=125;
  c5X=25;
  c5Y=25;

  x1=150;
  y1=0;
  x2=210;
  y2=50;
  x3=150;
  y3=50;
  x4=145;
  y4=60;

  h1=389;
  h2=334;
  h3=382;
  h4=367;
  w1=261;
  w2=150;
  w3=288;
  w4=301;
  screen=SCREEN;
  hardlight=HARD_LIGHT;
  overlay=OVERLAY;
  normal=NORMAL;
  exclusion=EXCLUSION;
  dodge=DODGE;
  ////////////////////Buttons
  button1=new Button (cX, cY, cSize, song, fButton, lighter, fire,lighter, x1, y1, w1, h1, screen);
  button2=new Button (c2X, c2Y, cSize, song22,aButton, acid, AcidBurn,acid, x2, y2, w2, h2, hardlight);
  button3=new Button (c3X, c3Y, cSize, song32, eButton, lightning, skeleton,lightning, x3, y3, w3, h3, dodge);
  button4=new Button (c4X, c4Y, cSize, song4,cButton, cross, face, Light, x4, y4, w4, h4, hardlight);
}

void draw() {
  mainHomeScreen();
  button1.run();
  button2.run();
  button3.run();
  button4.run();

}

void mainHomeScreen() {
  background(back);
  image(doll, 150, 50);
}

class  Button {

  float posX, posY, diam;
  int IPX, IPY, IW, IH;
  int mode;
  boolean over;
  AudioPlayer thePlayer;
  PImage ButtonImage, Image, Image2, Image3;

  Button (float _posX, float _posY, float _diam, AudioPlayer _thePlayer, PImage _ButtonImage, PImage _Image, PImage _Image2, PImage _Image3, int _IPX, int _IPY, int _IW, int _IH, int _mode) {
    posX = _posX;
    posY = _posY;
    diam = _diam;
    thePlayer = _thePlayer;    
    ButtonImage = _ButtonImage;
    over=false;
    Image=_Image;
    Image2=_Image2;
    Image3=_Image3;
    mode=_mode;
    IPX=_IPX;
    IPY=_IPY;
    IW=_IW;
    IH=_IH;
  }
  void run() {
    display();
    pressed1();
    mouseOver();
  }

  void display() {
    blendMode(NORMAL);
    image(ButtonImage, posX, posY);
  }

  boolean mouseOver() {
    if (mouseX>=posX && mouseY>=posY && mouseX<=posX+diam && mouseY<=posY+diam) {
      over=true;
      return true;
    }
    else {
      over= false;
      return false;
    }
  }

  void pressed1() {

    if (over==true && mousePressed==true) {

      thePlayer.play();

      cursor(Image, 20, 20);
      /// pimg.blend(src, sx, sy, sw, sh, dx, dy, dw, dh, mode)
      blend(Image2, 0, 0, 500, 500, IPX, IPY, IW, IH, mode);
      blend(Image3, 0, 0, 500, 500, 0, 0, 500, 500, mode);
    }
    else {
      thePlayer.pause(); 
      thePlayer.rewind(); 
      
    }
  }
}



