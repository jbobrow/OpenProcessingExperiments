
void setup () {
  size (360, 360);
  smooth ();

  
}
int mouseclicks = 0;
 float c = 0;
 float a = 192;
 float b = 152;
 int i = 0;
 float s = random (240);

void draw () {
  background (79,148,205);
      for (int y = 0; y <360; y +=25 ) {
        for (int x = 0; x <=width; x+=25) {
        fill (72,209,204);
        rect (x, y, 15, 15);
    }
    
      }
  c = c +1.2;
  if (c > width) {
    c = 0;}
    fill (255);
    ellipse (c, 40, 30, 10);
    
    
    
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
ellipse (c+20, 50, 50, 20);}
//third cloud
if (mouseclicks == 2) {
fill (255);
ellipse (c+20, 50, 50, 20);
ellipse (c+60, 110, 70, 40);}
//fourth cloud
if (mouseclicks == 3) {
  fill (255);
  ellipse (c+20, 50, 50, 20);
  ellipse (c+60, 110, 70, 40);
  ellipse (c+30, 25, 64, 20);}
if (mouseclicks == 4) {
  fill (255);
  ellipse (c+20, 50, 50, 20);
  ellipse (c+60, 110, 70, 40);
  ellipse (c+30, 25, 64, 20);
  ellipse (c+110, 40, 90, 40);
  ellipse (c+10, 80, 60, 30);}
if (mouseclicks == 5) {
  fill (255);
  ellipse (c+20, 50, 50, 20);
  ellipse (c+60, 110, 70, 40);
  ellipse (c+30, 25, 64, 20);
  ellipse (c+110, 40, 90, 40);
  ellipse (c+10, 80, 60, 30);
  ellipse (c+120, 60, 120, 80);
  ellipse (c+80, 40, 80, 40);
}
if (mouseclicks == 6) {
  fill (255);
  ellipse (c+20, 50, 50, 20);
  ellipse (c+60, 110, 70, 40);
  ellipse (c+30, 25, 64, 20);
  ellipse (c+110, 40, 90, 40);
  ellipse (c+10, 80, 60, 30);
  ellipse (c+120, 60, 120, 80);
  ellipse (c+80, 40, 80, 40);
  ellipse (c+180, 70, 60, 40);
  ellipse (c-10, 45, 70, 40);
}
if (mouseclicks == 7) {
  fill (255);
  ellipse (c+20, 50, 50, 20);
  ellipse (c+60, 110, 70, 40);
  ellipse (c+30, 25, 64, 20);
  ellipse (c+110, 40, 90, 40);
  ellipse (c+10, 80, 60, 30);
  ellipse (c+120, 60, 120, 80);
  ellipse (c+80, 40, 80, 40);
  ellipse (c+180, 70, 60, 40);
  ellipse (c-10, 45, 70, 40);
  ellipse (c+40, 80, 100, 50);
}
if (mouseclicks == 8) {
  fill (255);
  ellipse (c+20, 50, 50, 20);
  ellipse (c+60, 110, 70, 40);
  ellipse (c+30, 25, 64, 20);
  ellipse (c+110, 40, 90, 40);
  ellipse (c+10, 80, 60, 30);
  ellipse (c+120, 60, 120, 80);
  ellipse (c+80, 40, 80, 40);
  ellipse (c+180, 70, 60, 40);
  ellipse (c-10, 45, 70, 40);
  ellipse (c+40, 80, 100, 50);
  ellipse (c+30, 50, 90, 50);
  birds (c, 20);
  birds (c-10, -15);
  birds (c-40, -30);
  birds (c-60, -55);
  
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
}

void birds(float c, int y) {
  pushMatrix ();
  translate (c, y);
  //bird
  fill (255,215,0);
  ellipse (c+10, 130, 20, 20);
  beginShape ();
  vertex (c+25,130);
  vertex (c+18, 135);
  vertex (c+18, 125);
  endShape ();
  beginShape ();
  vertex (c+4, 138);
  vertex (c+12, 138);
  vertex (c+2, 150);
  endShape ();
  beginShape();
  vertex (c-7, 120);
  vertex (c-7, 140);
  vertex (c+3, 130);
  endShape ();
  popMatrix();
}

