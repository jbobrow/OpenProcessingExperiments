
PImage img;
PFont font, font2, font3, font4, font5, font6, font7;
float T1 = 0;   //All the words begin at ZERO
float T2 = 0;
float T3 = 0;
float T4 = 0;
float T5 = 0;
float T6 = 0;
float T7 = 0;

void setup() {
  size(400,300);
  img = loadImage("pond2.JPG");
  font = loadFont("ArrrMateyBB-100.vlw");
  font2 = loadFont("Attractmorewomen-100.vlw");
  font3 = loadFont("Cute_Tattoo-100.vlw");
  font4 = loadFont("Hipchick-100.vlw");
  font5 = loadFont("InternationalPlayboy-100.vlw");
  font6 = loadFont("JaggaPoint-100.vlw");
  font7 = loadFont("ChardinDoihleCondensed-100.vlw");
  image(img,0,0,400,300);
  smooth();
  noStroke();
  frameRate(10);
}

void draw() { 
  fill(0,180);
  image(img,0,0,400,300); 
  textSize(200);
  textFont(font5);
  text("Earth", T1, 60);
  textFont(font2);
  text("Peace", T2, 100);  
  textFont(font7);
  text("Calm", T3, 140);
  textFont(font);
  text("Relax", T4,180);
  textFont(font3);
  text("Warm", T5, 220);
  textFont(font4);
  text("Comfort", T6, 260);
  textFont(font6);
  text("Time", T7, 320);
  T1+=5;   //Each word has it's on speed to move right across the page
  T2+=6;
  T3+=7;
  T4+=8;
  T5+=9;
  T6+=10;
  T7+=11;
  if (T1>400){  //If these words surpass the frame, redraw them on the left side again
    T1=-200;
  } 
  if (T2>400){
    T2=-200;
  } 
  if (T3>400){
    T3=-200;
  } 
  if (T4>400){
    T4=-200;
  } 
  if (T5>400){
    T5=-200;
  } 
  if (T6>400){
    T6=-200;
  } 
  if (T7>400){
    T7=-200;
  } 
}


