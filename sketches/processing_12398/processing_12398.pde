
void setup () {
  size (360, 360);
  smooth ();

  
}
int value = 0;
int value2 = 0;

//int cloud = 0;
int mouseclicks = 0;
 float x = 0;
 float a = 192;
 float b = 152;

void draw () {
  background (79,148,205);
  x = x +1.2;
  if (x > width) {
    x = 0;}
    fill (255);
    ellipse (x, 40, 30, 10);
    
//girl watching bird
noStroke ();
fill (255,127,0);
rect (110, 150, 140, 140);
fill (255,228,181);
ellipse (120, 220, 20, 30);
ellipse (240, 220, 20, 30);
ellipse (180, 220, 120, 120);
fill (255,127,0);
rect (110, 150, 140, 40);
fill (255);
ellipse (200, 220, 30, 50);
ellipse (160, 220, 30, 50);
fill (178,34,34);
rect (150, 280, 60, 120);
arc (180, 270, 40, 20, PI, TWO_PI);

//eyes of girl watching bird
fill (0);
a = a + .0595;
if (a>210) {
  a = 192;}
  ellipse (a, 210, 10, 20);
  
fill (0);
b = b + .0595;
if (b>170) {
  b = 152;}
  ellipse (b, 210, 10, 20);
//second cloud
if (mouseclicks == 1) {
fill (255);
ellipse (x+20, 50, 50, 20);}
//third cloud
if (mouseclicks == 2) {
fill (255);
ellipse (x+20, 50, 50, 20);
ellipse (x+60, 110, 70, 40);}
//fourth cloud
if (mouseclicks == 3) {
  fill (255);
  ellipse (x+20, 50, 50, 20);
  ellipse (x+60, 110, 70, 40);
  ellipse (x+30, 25, 64, 20);}
if (mouseclicks == 4) {
  fill (255);
  ellipse (x+20, 50, 50, 20);
  ellipse (x+60, 110, 70, 40);
  ellipse (x+30, 25, 64, 20);
  ellipse (x+110, 40, 90, 40);
  ellipse (x+10, 80, 60, 30);}
if (mouseclicks == 5) {
  fill (255);
  ellipse (x+20, 50, 50, 20);
  ellipse (x+60, 110, 70, 40);
  ellipse (x+30, 25, 64, 20);
  ellipse (x+110, 40, 90, 40);
  ellipse (x+10, 80, 60, 30);
  ellipse (x+120, 60, 120, 80);
  ellipse (x+80, 40, 80, 40);
}
if (mouseclicks == 6) {
  fill (255);
  ellipse (x+20, 50, 50, 20);
  ellipse (x+60, 110, 70, 40);
  ellipse (x+30, 25, 64, 20);
  ellipse (x+110, 40, 90, 40);
  ellipse (x+10, 80, 60, 30);
  ellipse (x+120, 60, 120, 80);
  ellipse (x+80, 40, 80, 40);
  ellipse (x+180, 70, 60, 40);
  ellipse (x-10, 45, 70, 40);
}
if (mouseclicks == 7) {
  fill (255);
  ellipse (x+20, 50, 50, 20);
  ellipse (x+60, 110, 70, 40);
  ellipse (x+30, 25, 64, 20);
  ellipse (x+110, 40, 90, 40);
  ellipse (x+10, 80, 60, 30);
  ellipse (x+120, 60, 120, 80);
  ellipse (x+80, 40, 80, 40);
  ellipse (x+180, 70, 60, 40);
  ellipse (x-10, 45, 70, 40);
  ellipse (x+40, 80, 100, 50);
}
if (mouseclicks == 8) {
  fill (255);
  ellipse (x+20, 50, 50, 20);
  ellipse (x+60, 110, 70, 40);
  ellipse (x+30, 25, 64, 20);
  ellipse (x+110, 40, 90, 40);
  ellipse (x+10, 80, 60, 30);
  ellipse (x+120, 60, 120, 80);
  ellipse (x+80, 40, 80, 40);
  ellipse (x+180, 70, 60, 40);
  ellipse (x-10, 45, 70, 40);
  ellipse (x+40, 80, 100, 50);
  ellipse (x+30, 50, 90, 50);
  fill (255,215,0);
  ellipse (x+10, 130, 20, 20);
  beginShape ();
  vertex (x+25,130);
  vertex (x+18, 135);
  vertex (x+18, 125);
  endShape ();
  beginShape ();
  vertex (x+4, 138);
  vertex (x+12, 138);
  vertex (x+2, 150);
  endShape ();
  beginShape();
  vertex (x-7, 120);
  vertex (x-7, 140);
  vertex (x+3, 130);
  endShape ();
  
  
}
}
void mousePressed() { 
  
//second cloud
if (mouseclicks == mouseclicks) {
  mouseclicks = mouseclicks+1;
 } else {
   mouseclicks = 0;
 }
if (mouseclicks == 9) {
  mouseclicks = 0;
} else {
  mouseclicks = mouseclicks;
}
//third bird
//if (mouseclicks == 1){
  //mouseclicks = 2;
//} else {
  //mouseclicks = 1;
}



