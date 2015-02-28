
PFont font;
float x1 = -10;
float x2 = 200;
float x3 = -10;
float x4 = 200;

float x5 = -10;
float x6 = 200;
float x7 = -10;
float x8 = 200;

void setup(){
size(250,250);
textMode(CENTER);
font = loadFont("BookmanOldStyle-48.vlw");
textFont(font);
}

void draw(){
background(100);

textFont(font,50);
fill(255,0,0);
text("M5A", x1, 40);

textFont(font,50);
fill(0,255,0);
text("3W7",x2,200);

textFont(font,15);
fill(255,100,230);
text("M5A", x3, 90);

textFont(font,15);
fill(67,255,100);
text("3W7",x4,240);

//second batch
textFont(font,25);
fill(#ffde01);
text("M5A", x5,120);

textFont(font,25);
fill(#01ffb4);
text("3W7",x6,160);

textFont(font,35);
fill(#29146a);
text("M5A", x3, 80);

textFont(font,30);
fill(#fb16d8);
text("3W7",x4,210);

x1 += .7;
x2 -= 1.3;
x3 += 1.2;
x4 -= 1.4;
x5 += 1;
x6 -= 1.5;
x7 += .9;
x8 -= 1.6;

if (x1 > width) {
x1 = 0;
x2 = 250;
x3 = 0;
x4 = 250;
x5 = 0;
x6 = 250;
x7 = 0;
x8 = 250;

}

if (mousePressed){
  x1 = 85;
  x2 = 85;
  x3 = 115;
  x4 = 115;
  x5 = 85;
  x6 = 85;
  x7 = 115;
  x8 = 115;


}

}

