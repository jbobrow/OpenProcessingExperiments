
/* This sketch is fun, easy-to-use but also interactive.
In this sketch, you are a boxer and you're versing a tough and battered arch 
enemy. Simply move your mouse - or your 'boxing glove' - left and right to try
and 'punch' your mean-looking opponent. However, as you'll notice, he is quite 
the experienced boxer and is dodging all your punches. 
How do you get your revenge? Easy - with just one click away, you can prove 
you're the better boxer by pressing on the the mouse to temporarily knock out 
your opponent. 
(Note that everytime you press the mouse, 'Fight!' appears, which is the 
excited crowd cheering you on!). */

int maxImages = 3;
int imageIndex = 0;
PImage [] bg = new PImage[maxImages];
PImage glove;
PImage KO;

boolean button = false;
float xpos;
float ypos;
float drag = 30;

void setup() {
  size(600, 400);

  //Change boxer images
  for (int i = 0; i < bg.length; i ++ ) {
    bg[i] = loadImage( "boxer" + i + ".jpg" );
  }
  KO = loadImage("KO.jpg");
  //Glove position and speed of glove with mouse
  glove = loadImage("glove.gif");
  xpos = width/2;
  ypos = height/2;
  frameRate(1000);
}

void draw() {
  if (button==false) {

    image(bg[imageIndex],0,0);
    imageIndex = int(map(mouseX,0,width,0,bg.length));
  }

  float difx = mouseX - xpos-glove.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-glove.width);
  } 

  float dify = mouseY - ypos-glove.height/2;
  if (abs(dify) > 1) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-glove.height);
  } 

  image(glove, xpos, ypos);

  if (mousePressed) {
    button = true;
  }
  else {
    button = false;
  }
  if (button) {
    image (KO,0,0);
  }
  else {
    image(bg[imageIndex],0,0);
    imageIndex = int(map(mouseX,0,width,0,bg.length));
    difx = mouseX - xpos-glove.width/2;
    if (abs(difx) > 1) {
      xpos = xpos + difx/drag;
      xpos = constrain(xpos, 0, width-glove.width);
    } 

    dify = mouseY - ypos-glove.height/2;
    if (abs(dify) > 1) {
      ypos = ypos + dify/drag;
      ypos = constrain(ypos, 0, height-glove.height);
    } 
    
    //Glove sprite position
    image(glove, xpos, ypos);
  }
  println("Fight!");
}

