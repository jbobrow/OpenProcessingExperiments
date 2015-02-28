
PImage back;
PImage python;
PImage pythonfalse;
PImage rabbit;
PImage rabbitjump;
PImage pythonimage;
PImage carrot;
PImage mainmenu;
PImage failmenu;
PImage diken;
PImage rabbitdiken;

AudioSample scream;
AudioSample in;

PFont font;

void loadAssets()
{
  carrot = loadImage("carrot.png");
  back   = loadImage("bg.png");
  python = loadImage("yer.png");
  pythonfalse = loadImage("yerkirik.png");
  rabbit = loadImage("rabbit.png");
  rabbitjump = loadImage("rabbitjump.png");
  pythonimage = loadImage("pythonsnake.png");
  mainmenu = loadImage("mainmenu.png");
  failmenu = loadImage("failbunny.png");
  diken = loadImage("diken.png");
  rabbitdiken = loadImage("rabbitpert.png");
  
  font = loadFont("Andy-Bold-25.vlw");

  minim = new Minim(this);
  in = minim.loadSample("sound.wav");
  scream = minim.loadSample("nemesis1.wav");
}
 

