
//global variables
boolean button = false;//button 1
boolean button2=false;//button2
boolean button3=false;//button3
//button 1
int x = 100;
int y = 400;
int w = 100;
int h = 75;

int a =250;
int b =400;
int c =100;
int d =75;

int e =400;
int f =400;
int g =100;
int i =75;

void setup () {
  size (500,500);
  background (251,248,232);
  smooth();
}

void draw() {
  if (frameCount > 50) { //if statement to prevent drawing in the upper left corner
rectMode (CENTER);
  fill (253,80,27);
  rect (x, y, w, h);

  fill (0);
  rect (a, b, c, d);

  fill (6,105,130,50);
  rect (e,f,g,i);
}
}
void keyPressed() {
  int e2=int(random(2,150)); 
  if (button) {
   stroke (0, 30);
fill (random(250,255), random(10, 100), random(10, 150), 20); 
ellipse (mouseX, mouseY, 30, 30); 
stroke (random(255), random(255), random(255));
ellipse (mouseX + random (-20, 20), mouseY + random (-30, 30), 30/2, 30/2);
  }

  if (button2) {
    stroke(0,30); 
   line (mouseX, mouseY, mouseX + random (50, 100), mouseY + random (10)); 
  }

  if (button3) {
    noStroke();
  fill(6,105,130,50);
  ellipse(mouseX,mouseY,e2,e2);
 
  }
}


void mousePressed () {

  if ((mouseX > x) && (mouseX < x+w) && (mouseY < y+h )) {

    button =!button;
    button2=false;
   button3=false;
  }
  if ((mouseX > a) && (mouseX < a+b) && (mouseY < b+d )) {
    button2=!button2;
    button=false;
   button3=false;
  }
  if ((mouseX > e) && (mouseX < e+g) && (mouseY < f+i )) {
    button3=!button3;
    button=false;
    button2=false;
  }
}


                
                                                
