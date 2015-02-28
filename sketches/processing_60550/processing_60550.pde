
int numFrames = 10; // NUMBER OF BACKGROUND FRAMES
PImage[] imagesbg = new PImage[numFrames]; // BACKGROUND ANIMATION ARRAY
int currentFrame = 0;

//STATE FLASHING IMAGES

PImage imgFlash0;
PImage imgFlash1;
PImage imgFlash2;
PImage imgFlash3;

float x;
float easing = 0.05;

//STATE FIGURE VARIABLES

PImage figure0;
PImage figure1;
PImage figure2;
PImage figure3;
PImage figure4;
PImage figure5;
PImage figure6;
PImage figure7;
PImage figure8;
PImage figure9;
PImage figure10;
PImage figure11;
PImage figure12;
PImage figure13;
PImage figure14;
PImage figure15;
PImage figure16;
PImage figure17;
PImage figure18;
PImage figure19;
PImage figure20;

void setup() { 

  size(600, 600); 

  //LOAD BACKGROUND ANIMATION IMAGES  
  for (int i = 0; i < imagesbg.length; i++) {
    String imageNamei = "frame" + nf(i, 4) + ".jpg"; 
    imagesbg[i] = loadImage(imageNamei); // LOAD EACH IMAGE
  } 

  imgFlash0= loadImage("flash0000.jpg");
  imgFlash1= loadImage("flash0001.jpg");
  imgFlash2= loadImage("flash0002.jpg");
  imgFlash3= loadImage("flash0003.jpg");


  // LOAD FIGURE IMAGES
  figure0= loadImage("figure0000.png");
  figure1= loadImage("figure0001.png");
  figure2= loadImage("figure0002.png");
  figure3= loadImage("figure0003.png");
  figure4= loadImage("figure0004.png");
  figure5= loadImage("figure0005.png");
  figure6= loadImage("figure0006.png");
  figure7= loadImage("figure0007.png");
  figure8= loadImage("figure0008.png");
  figure9= loadImage("figure0009.png");
  figure10= loadImage("figure0010.png");
  figure11= loadImage("figure0011.png");
  figure12= loadImage("figure0012.png");
  figure13= loadImage("figure0013.png");
  figure14= loadImage("figure0014.png");
  figure15= loadImage("figure0015.png");
  figure16= loadImage("figure0016.png");
  figure17= loadImage("figure0017.png");
  figure18= loadImage("figure0018.png");
  figure19= loadImage("figure0019.png");
  figure20= loadImage("figure0020.png");

  frameRate(60);
}

void draw() { 

  int targetX=mouseX;
  x+= (targetX - x) * easing;

  // BACKGROUND ANIMATION

  image(imagesbg[currentFrame], x-600, -100); //center animation horizon
  currentFrame++;	// Next frame 
  if (currentFrame == imagesbg.length) {
    currentFrame = 0; // Return to first frame
  }


  // FIGURE CODE

  if (x<34) {
    image(figure0, 0, 0);
  }
  if ((x>34) && (x<62)) {
    image(figure1, 0, 0);
  }
  if ((x>62) && (x<90)) {
    image(figure2, 0, 0);
  }
  if ((x>90) && (x<118)) {
    image(figure3, 0, 0);
  }
  if ((x>118) && (x<146)) {
    image(figure4, 0, 0);
  }
  if ((x>146) && (x<174)) {
    image(figure5, 0, 0);
  }
  if ((x>174) && (x<202)) {
    image(figure6, 0, 0);
  }
  if ((x>202) && (x<230)) {
    image(figure7, 0, 0);
  }
  if ((x>230) && (x<258)) {
    image(figure8, 0, 0);
  }
  if ((x>258) && (x<286)) {
    image(figure9, 0, 0);
  }
  if ((x>286) && (x<314)) {
    image(figure10, 0, 0);
  }
  if ((x>314) && (x<342)) {
    image(figure11, 0, 0);
  }
  if ((x>342) && (x<370)) {
    image(figure12, 0, 0);
  }
  if ((x>370) && (x<398)) {
    image(figure13, 0, 0);
  }
  if ((x>398) && (x<426)) {
    image(figure14, 0, 0);
  }
  if ((x>426) && (x<454)) {
    image(figure15, 0, 0);
  }
  if ((x>454) && (x<482)) {
    image(figure16, 0, 0);
  }
  if ((x>482) && (x<510)) {
    image(figure17, 0, 0);
  }
  if ((x>510) && (x<538)) {
    image(figure18, 0, 0);
  }
  if ((x>538) && (x<566)) {
    image(figure19, 0, 0);
  }
  if ((x>566) && (x<600)) {
    image(figure20, 0, 0);
  }

if((mousePressed) && (x<150)){
image(imgFlash0,0,0);
}
if((mousePressed) && (x>150) && (x<300)){
image(imgFlash1,0,0);
}
if((mousePressed) && (x>300) && (x<450)){
image(imgFlash2,0,0);
}
if((mousePressed) && (x>450) && (x<600)){
image(imgFlash3,0,0);
}
}

