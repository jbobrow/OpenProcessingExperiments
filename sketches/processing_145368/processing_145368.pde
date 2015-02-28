
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// Woven Web black and white
// http://a1.s6img.com/cdn/0012/p/3690409_12075292_lz.jpg
// http://society6.com/budikwan/Woven-Web-black-and-white#1=45
//
// Controls:
// MouseClick  - redraw
//
// Keys:
// Z  - less space between bezier lines
// X  - more space between bezier lines
// A  - add 10 dots
// S  - remove 10 dots
// H  - on/off horizontak lines
// V  - on/off vertical lines
// D  - on/off snow
// SPACE  - reset setting
//
/////////////////////////////////////////////////

int sz = 600;
int num = sz/4;        // count of circles
int sw = 2;           // strokeWidth

color [] bg = { #1B1B1B };
color [] s  = { #ffffff };    // line color
int stpos = 10;

float y = 10;
float x = 10;
float offset = sz/20;    //
//float offsetCr = offset/2-5;   // normal mode 
float offsetCr = offset/2+15;    // more chaos
boolean V = true;
boolean H = true;
boolean D = true;

void setup() {
  size(sz, sz);
  background(bg[0]);
  noLoop();
}

void draw() {
  strokeWeight(sw);
  noFill();
  background(bg[(int)random(bg.length)]);
  stroke(s[(int)random(s.length)]);
  
// horizontal lines
if(H){
  for ( y=10; y<height; y+=offset) {
    bezier(-stpos, random(y-offsetCr, y+offsetCr), 
    random(offset, width-200), random(y-offset, y+offset), 
    random(200, width-offset), random(y-offset, y+offset), 
    width+stpos, random(y-offsetCr, y+offsetCr));
  }}
  
// vertical lines
if(V){
  for ( x=10; x<width; x+=offset) {
    bezier(random(x-offsetCr, x+offsetCr), -stpos, 
    random(x-offset, x+offset), random(offset, height-200), 
    random(x-offset, x+offset), random(200, height-offset), 
    random(x-offsetCr, x+offsetCr), height+stpos);
  }}
  
// snow dots
if(D){
  for (int i=0; i<num; ++i) {
    fill(#ffffff);
    noStroke();
    float radius = random(3, 20);
    ellipse(random(0, width), random(0, height), radius, radius);
  }}
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 'z') { offset+=5; }
  if (key == 'x') { offset-=5; }
  if (key == 'a') { num -= 10; }
  if (key == 's') { num += 10; }
  if (key == ' ') { num=sz/4; offset = sz/20; V = true; H = true; D = true;}
  if (key == 'h') { V = !V; }
  if (key == 'v') { H = !H; }
  if (key == 'd') { D = !D; }
  if (key == 'q') { sw = ++sw%3; }
  
//  if(offset<10){sw = 1;} else {sw = 2;};
  offset = constrain(offset, 4, width/2);
  num = constrain(num, 10, width*2);
  redraw();
}

