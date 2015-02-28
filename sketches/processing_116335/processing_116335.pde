
//Mini Project (Sze Stephanie Manago 53055878) for CMS3
import ddf.minim.*;
Minim minim;
AudioSample success;
AudioSample roar;
AudioSample turtle;
AudioSample tree;
AudioPlayer bgsound;

//snow array
float[] sx = new float[100];
float[] sy = new float[100];
float[] speed = new float[100];
//draggables
float x1=random(80, 150), x2=random(150, 250), x3=random(280, 320), x4=random(330, 400), x5=random(100, 450);
float y1=random(200, 300), y2=random(10, 300), y3=random(220, 250), y4=random(170, 300), y5=random(350, 450);
float sz1 = 60, sz2 = 80, sz3 = 120, sz4=160;
boolean overImg1 = false;
boolean locked1 = false;
float xOffset1 = 0.0; 
float yOffset1 = 0.0; 
boolean overImg2 = false;
boolean locked2 = false;
float xOffset2 = 0.0; 
float yOffset2 = 0.0;
boolean overImg3 = false;
boolean locked3 = false;
float xOffset3 = 0.0; 
float yOffset3 = 0.0;
boolean overImg4 = false;
boolean locked4 = false;
float xOffset4 = 0.0; 
float yOffset4 = 0.0;
boolean overImg5 = false;
boolean locked5 = false;
float xOffset5 = 0.0; 
float yOffset5 = 0.0;
int w = width/2;
PImage img1, img2, img3, img4, img5;
//text array
String[] description = {
  "Welcome to Dream Island",
  "Drag and drop the objects", 
  "Create an interesting story", 
  "Explore your imagination"
  
};
float tx;
int ti = 0;
//cloud
int maxImages = 3; 
int imageIndex = 0;
PImage cloud; 
int g = 0;
//ocean
float t = 0;



void setup() {

  size(500, 500);
  background(0, 60, 150);
  frameRate(25);
  minim = new Minim(this);
  success = minim.loadSample("beep.mp3");
  turtle = minim.loadSample("turtle.mp3");
  roar = minim.loadSample("roar.mp3");
  tree = minim.loadSample("tree.mp3");
  bgsound = minim.loadFile("bgsound.mp3");
  bgsound.loop();

  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");

  for (int i = 0; i < 100; i++) {
    sx[i] = random(0, width);
    sy[i] = random(0, height);
    speed[i] = random(1, 5);
  }
  cloud = loadImage("cloud.png");
  tx = width;
}

void draw() {

  background(80, 160, 255);
  gradient
  (0);

  imageMode(CENTER);
  // Test if the cursor is over the image 
  image(img1, x1, y1, sz4, sz3);
  overImg1 = overImg(img1, x1, y1, sz4, sz3);

  image(img2, x2, y2, sz1, sz2);
  overImg2 = overImg(img2, x2, y2, sz1, sz2);

  image(img3, x3, y3, sz3, sz4);
  overImg3 = overImg(img3, x3, y3, sz3, sz4);

  image(img4, x4, y4, sz3, sz4);
  overImg4 = overImg(img4, x4, y4, sz3, sz4);

  image(img5, x5, y5, width, sz3);
  overImg5 = overImg(img5, x5, y5, width, sz3);
  float oc = 0;
  while (oc < width) {
    stroke(0, 50, 100);
    line(oc, 400 + 50 * noise(oc / 80, t), oc, height);
    oc = oc+ 1;
  }
  t = t + 0.2;
  //snow
  noStroke();
  fill(255);
  for (int i = 0; i < 100; i++) {
    ellipse(sx[i], sy[i], speed[i], speed[i]);
    sy[i] = sy[i] + speed[i];
    if (sy[i] > height) {
      sy[i] = 0;
    }
  }
  //text
  imageMode(CORNERS);
  image(cloud, tx-20, 60);
  textAlign (LEFT, CENTER);
  textSize(16);
  fill(0);
  text(description[ti], tx, 100);

  tx = tx - 3;
  float tw = textWidth(description[ti]); 
  if (tx < -tw) {
    tx = width;
    ti = (ti + 1) % description.length;
  }
}
//functions with parameters
void ocean(float t, float x) {
  t = 0;
  x = 0;
  while (x < width) {
    line(x, 200 + 50 * noise(x / 100, t), x, height);
    x = x + 1;
  }
  t = t + 0.2;
}

void gradient(int i) {
  i = 0;
  noStroke();
  while (i<100) {
    fill(i*2.55, 100);
    rect(0, i*5, height, 5);
    i++;
  }
}
//function with parameter and returns something
boolean overImg(PImage img1, float x, float y, float szx, float szy) {
  boolean overImg = false;
  if (mouseX > x-szx/2 && mouseX < x+szx/2 && 
    mouseY > y-szy/2 && mouseY < y+szy/2) {
    overImg = true;
  }
  else {
    overImg = false;
  }
  return overImg;
}

void mousePressed() {
  if (overImg1) { 
    locked1 = true;
    roar.trigger();
    
  } 
  else {
    locked1 = false;
  }
  xOffset1 = mouseX-x1; 
  yOffset1 = mouseY-y1;

  if (overImg2) { 
    locked2 = true;
    turtle.trigger();
  } 
  else {
    locked2 = false;
  }
  xOffset2 = mouseX-x2; 
  yOffset2 = mouseY-y2;

  if (overImg3) { 
    locked3 = true;
    tree.trigger();
  } 
  else {
    locked3 = false;
  }
  xOffset3 = mouseX-x3; 
  yOffset3 = mouseY-y3;

  if (overImg4) { 
    locked4 = true;
    success.trigger();
  } 
  else {
    locked4 = false;
  }
  xOffset4 = mouseX-x4; 
  yOffset4 = mouseY-y4;

  if (overImg5) { 
    locked5 = true;
    success.trigger();
  } 
  else {
    locked5 = false;
  }
  xOffset5 = mouseX-x5; 
  yOffset5 = mouseY-y5;
}

void mouseDragged() {
  if (locked1) {
    x1 = mouseX-xOffset1; 
    y1 = mouseY-yOffset1;
  }

  if (locked2) {
    x2 = mouseX-xOffset2; 
    y2 = mouseY-yOffset2;
  }

  if (locked3) {
    x3 = mouseX-xOffset3; 
    y3 = mouseY-yOffset3;
  }

  if (locked4) {
    x4 = mouseX-xOffset4; 
    y4 = mouseY-yOffset4;
  }

  if (locked5) {
    x5 = mouseX-xOffset5; 
    y5 = mouseY-yOffset5;
  }
}

void mouseReleased() {
  locked1 = false;
  locked2 = false;
  locked3 = false;
  locked4 = false;
  locked5 = false;
}



//royalty free sound downloaded from www.freesfx.co.uk


