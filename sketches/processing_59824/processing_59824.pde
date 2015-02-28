
PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;

PFont font;
PFont font2;

int t = 0;
int r = 0;
int g = 0;

int size;
int hwidth,hheight;
int riprad;
 
int ripplemap[];
int ripple[];
int texture[];

int oldind,newind, mapind;
 
int i,a,b;

Timer timer;

int state;

void setup() {
  size(300, 400);
  smooth();
  frameRate(30);

  font = loadFont("MonotypeCorsiva-25.vlw");
  font2 = loadFont("Vivaldii-25.vlw");
  timer = new Timer (43000);

  imageMode(CENTER);

  p1 = loadImage("p1.jpg");
  p2 = loadImage("p2.jpg");
  p3 = loadImage("p3.jpg");
  p4 = loadImage("p4.jpg");
  p5 = loadImage("p5.jpg");
  
  hwidth = width>>1;
  hheight = height>>1;
  riprad=5;
   
  size = width * (height+2) * 2;
   
  ripplemap = new int[size];
  ripple = new int[width*height];
  texture = new int[width*height];
   
  oldind = width;
  newind = width * (height+3);
  
  loadPixels();
  
}

void draw() {

  background(255);
  
  fill(255);
  textAlign(CENTER);
  textSize(14);


  if (state == 0) {
    textFont(font,23);
    image(p2, 150, 200, width, height);
    fill(255,t-100);
    text("As she stands idle he looks on,", width/2, 120);
    fill(255,t-250);
    text("the pale of her neck glowing softly.", width/2, 150);
    fill(255,t-400);
    text("Young and old together,", width/2, 180);
    fill(255,t-550);
    text("reflections of a familiar past", width/2, 210);
    fill(255,t-700);
    text("rekindled in the simple grasp", width/2, 240);
    fill(255,t-850);
    text("of hair to hand to flower.", width/2, 270);
    t++;
  }

  else if (state == 1) {
    textFont(font,23);
    t = 0;
    image(p3, -25, 200, width*2.5, height*1.2);
    fill(255,r-50);
    text("His stare lingers, head in hand,", width/2, 120);
    fill(255,r-200);
    text("a feigned look of disinterest.", width/2, 150);
    fill(255,r-350);
    text("beneath the dark his body shifts;", width/2, 180);
    fill(255,r-500);
    text("alone, the artist meets his maker.", width/2, 210);
    fill(255,r-650);
    text("Eyes waiting to reveal", width/2, 240);
    fill(255,r-800);
    text("that which gazes back at him.", width/2, 270);
    r++;
  }

  else if (state == 2){
    image(p1, 150, 200, width, height);
    textFont(font,23);
    fill(255,g-50);
    text("Her hand grasps the chair,", width/2, 120);
    fill(255,g-200);
    text("vision blurred and back aching.", width/2, 150);
    fill(255,g-350);
    text("The scattered mess is not the problem", width/2, 180);
    fill(255,g-500);
    text("but a remnant of her conflict.", width/2, 210);
    fill(255,g-650);
    text("The distant stomp of foot to floor", width/2, 240);
    fill(255,g-800);
    text("snaps her back to reality.", width/2, 270);
    g++;
  }
  
  else if (state == 3){
    image(p4, 150,200,width,height);
  }
  
  else if (state == 4){
    image(p5, 150, 200, width, height);
  }

  if (timer.isFinished()) {
    state++;
    timer.start();
  }
  
  loadPixels();
  texture = pixels;
   
  newframe();
     
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = ripple[i];
  }
    
  updatePixels();
}

public void disturb(int dx, int dy) {
  for (int j=dy-riprad;j<dy+riprad;j++) {
    for (int k=dx-riprad;k<dx+riprad;k++) {
      if (j>=0 && j<height && k>=0 && k<width) {
        ripplemap[oldind+(j*width)+k] += 128;       
      }
    }
  }
}

void newframe() {
  i=oldind;
  oldind=newind;
  newind=i;
 
  i=0;
  mapind=oldind;
  for (int y=0;y<height;y++) {
    for (int x=0;x<width;x++) {
      short data = (short)((ripplemap[mapind-width]+ripplemap[mapind+width]+ripplemap[mapind-1]+ripplemap[mapind+1])>>1);
      data -= ripplemap[newind+i];
      data -= data >> 5;
      ripplemap[newind+i]=data;
 
      data = (short)(1024-data);
 
      a=((x-hwidth)*data/1024)+hwidth;
      b=((y-hheight)*data/1024)+hheight;
 
      if (a>=width) a=width-1;
      if (a<0) a=0;
      if (b>=height) b=height-1;
      if (b<0) b=0;
 
      ripple[i]=texture[a+(b*width)];
      mapind++;
      i++;
    }
  }
}
 
void mouseMoved()
{
  disturb(mouseX, mouseY);
}
 

