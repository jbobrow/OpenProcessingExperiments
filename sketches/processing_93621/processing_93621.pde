
int vi;
int eye;

float r = 100;
float g = 150;
float b = 200;
float a = 150;
 
float diam = 500;
float x = 250;
float y = 250;


void setup () {
  frameRate (24);
  size (500,500);
  smooth ();
}


void draw () {
background(0);
stroke(0);
fill(r, g, b, a);
rect(x, y, diam, diam);
x = int(random(250, 250));
y = int(random(250, 250));
r = int(random(0, 255));
g = int(random(0, 255));
b = int(random(0, 255));
diam = int(random(2, 500));
stroke(255);

  //body
  //background (255);
  fill (255,244,21);
  rectMode (CENTER);
  rect (vi, mouseY,40,40,7);
  
  //head
  //fill (255);
  ellipseMode (CENTER);
  ellipse (vi, mouseY-50,100,70);
  
  fill (0);
  ellipse (vi-30, mouseY-50,eye,eye+10);
  ellipse (vi+30, mouseY-50,eye,eye+10);
  //mouth
  fill (r,120,120);
  triangle (vi-5, mouseY-30,vi+5,mouseY-30,vi, mouseY-35);
  
  
  ellipse (vi-28, mouseY-50,15,15);
  ellipse (vi+28,mouseY-50,15,15);
  
  //ears
  fill (0);
  ellipse (vi-45, mouseY-90,5,5);
  ellipse (vi+45, mouseY-90,5,5);
  
  line (vi-30, mouseY-75,vi-45, mouseY-90);
  line (vi+30, mouseY-75,vi+45, mouseY-90);
  
  //legs
  line (vi-19, mouseY+16,vi-30,mouseY+30);
  line (vi+19,mouseY+16,vi+30, mouseY+30);
  
  ellipse (vi-30, mouseY+30,10,2);
  ellipse (vi+30, mouseY+30,10,2);

vi++;
}

void mousePressed() {
  eye = int(random(20, 50));
}






