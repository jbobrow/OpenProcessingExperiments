
/**
Processing Project 2
Dave K. ATK302
 */
 
 int s = 100 ; //sun
 
 int c1 = 150 ; //clouds
 int c2 = 170 ;
 int c3 = 40 ;
 int c4 = 60 ;
 int c5 = 450 ;
 int c6 = 480 ;
 int c7 = 510 ; //clouds
 
 int t1 = 550 ; //tree trunk rt
 int t2 = 560 ; //tree bottom rt
 int t2b = 620 ; //tree bottom rt
 int t2c = 500 ; //tree bottom rt
 int t3 = 560 ; //tree top rt
 int t3b = 600 ; //tree top rt
 int t3c = 520 ; //tree top rt
 
 int r1 = 640 ; //road stripe
 
 PImage motorcycle; //motorcycle image
 
 
 String[] headlines = {
  "Get your motor runnin'", 
  "Head out on the highway",
  "Lookin' for adventure",
  "And whatever comes our way",
  "BORN TO BE WILD",
  "BORN TO BE WILD",
  };
  
  PFont font1; //Akzidenz reg
  float x; // font location
  int index = 0;
  
 
 
 
 void setup() {

  size(640, 360);
  
  motorcycle = loadImage("motorcycle.png");
  
  font1 = loadFont("CascadeScriptLTStd-60.vlw");
    // Initialize headline offscreen to the right 
  x = width;
  
}

void draw() {
  
background(#05BFF5);
noStroke();

fill(100); //road
rect(0, 305, 640, 63);

fill(#24B907); //grass
rect(0, 340, 640, 63);

fill(#fff000); //sun
noStroke();
ellipse(s, 60, 72, 72);
s = s - 1 ;

if (s < 0) {
  s = width;
}

fill(255); //clouds
noStroke();
ellipse(c1, 60, 50, 40);
c1 = c1 - 1 ;

if (c1 < 0) {
  c1 = width;
}

fill(255); //clouds
ellipse(c2, 60, 50, 30);
c2 = c2 - 1 ;

if (c2 < 0) {
  c2 = width;
}

fill(255); //clouds
ellipse(c3, 60, 50, 30);
c3 = c3 - 1 ;

if (c3 < 0) {
  c3 = width;
}

fill(255); //clouds
noStroke();
ellipse(c4, 60, 50, 40);
c4 = c4 - 1 ;

if (c4 < 0) {
  c4 = width;
}

fill(255); //clouds
noStroke();
ellipse(c5, 50, 50, 20);
c5 = c5 - 1 ;

if (c5 < 0) {
  c5 = width;
}

fill(255); //clouds
noStroke();
ellipse(c6, 45, 60, 30);
c6 = c6 - 1 ;

if (c6 < 0) {
  c6 = width;
}

fill(255); //clouds
noStroke();
ellipse(c7, 55, 50, 20);
c7 = c7 - 1 ;

if (c7 < 0) {
  c7 = width;
}

fill(#643205); //tree trunk rt
rect(t1, 265, 20, 40);
t1 = t1 - 1 ;

//if (t1 < 0) {
  //t1 = width;
//}

fill(#05641e); //tree bottom rt
triangle(t2, 150, t2b, 265, t2c, 265);
t2 = t2 - 1 ;

/*if (t2 < 0) {
  t2 = width;
}*/

t2b = t2b - 1 ;

if (t2b < 0) {
  t1 = 550 + 80;
  t2b = 620 + 80 ;
  t2 = 560 + 80 ;
  t2c = 500 + 80;
}

t2c = t2c - 1 ;

/*if (t2c < 0) {
  t2c = width;
}*/

fill(#05641e); //tree top rt
triangle(t3, 110, t3b, 210, t3c, 210);
t3 = t3 - 1 ;
t3b = t3b - 1 ;
t3c = t3c - 1 ;

if (t3b < 0) {
  t3 = 560 + 100 ;
  t3b = 600 + 100 ;
  t3c = 520 + 100 ;
}

fill(#643205); //tree trunk lt
rect(10, 280, 15, 25);

fill(#05641e); //tree top lt
triangle(15, 180, 45, 280,-10, 280);

fill(#643205); //tree trunk mid
rect(50, 285, 10, 20);

fill(#05641e); //tree top mid
triangle(50, 200, 85, 290, 20, 290);

fill(#fff000); //road stripe
noStroke();
rect(r1+660, 320, 25, 5);
rect(r1+600, 320, 25, 5);
rect(r1+540, 320, 25, 5);
rect(r1+480, 320, 25, 5);
rect(r1+420, 320, 25, 5);
rect(r1+360, 320, 25, 5);
rect(r1+300, 320, 25, 5);
rect(r1+240, 320, 25, 5);
rect(r1+180, 320, 25, 5);
rect(r1+120, 320, 25, 5);
rect(r1+60, 320, 25, 5);
rect(r1, 320, 25, 5);
rect(r1-60, 320, 25, 5);
rect(r1-120, 320, 25, 5);
rect(r1-180, 320, 25, 5);
rect(r1-240, 320, 25, 5);
rect(r1-300, 320, 25, 5);
rect(r1-360, 320, 25, 5);
rect(r1-420, 320, 25, 5);
rect(r1-480, 320, 25, 5);
rect(r1-540, 320, 25, 5);
rect(r1-600, 320, 25, 5);
rect(r1-660, 320, 25, 5);

r1 = r1 - 1 ;

if (r1 < 0) {
  r1 = width;
}

 image(motorcycle, 200, 130, 260, 200);
 
 // text
 fill(#fff000);
 
 textFont(font1, 48);
 textAlign(LEFT);
 text(headlines[index], x, 250);
 
 x = x -4; //speed
 
 float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width; 
    index = (index + 1) % headlines.length;
  }

}


