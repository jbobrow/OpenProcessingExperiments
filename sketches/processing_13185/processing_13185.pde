
int xa = 350;
int xb = 350;
int xc = 350;
int ya = 0;
int yb = 550; 
int sz = 700;
int xSpeed = 5;
int ySpeed = 5;
int zip = 0;
float trans = 100;
int directionX = 1;
int directionY = -1;
int xap = 350;
int xbp = 350;
int xcp = 350;
int yap = 0;
int ybp = 550; 
int v= 90; 
int g= 90;
float radiusvg = 30.0;
float radiusE = 50.0;
int x = 225;
int y = 225;

// above are variable declarations for the triangles in motion


float angle = 0.0; 
float [] scaleVal = {40, 60, 30, 80, 65, 30}; // height
float [] yOffset = {60, 180, 230, 350, 440, 560}; //yPOS
float b = PI/36.0;
 float r;
 
PShape myShape;
PShape myShape2;
float anglePshape = 0.0;


int purple = #BB1BBF;
int green = #17FC24;
int blue = #173FFC;
int yellow = #FCE617;
int pink = #FF0077;

PImage img;

import ddf.minim.*;
Minim minim;
AudioPlayer song;

float angleV = 0.0; // current angle
float speed = 0.04; // speed of motion
float radius = 100; 
float i;

void setup(){
 
  myShape = loadShape ("abstract2.svg");
  myShape2 = loadShape ("abstract.svg");
  float y;
  img = loadImage ("eye.jpg"); // image if EYE for background
  minim = new Minim(this);
  song = minim.loadFile("AphexTwin_Peek 824545201_Excerpt.mp3");
  song.play();
  smooth();
  colorMode (RGB);
  size (700, 550);
}

void draw(){
   if ((song.position() > 0 ) && (song.position () < 2300)) { //black rect
   fill (0);
   rect (0, 0, 700, 550);
   }
   if ((song.position() > 2300 ) && (song.position () < 7200)) { //eyeball
  image (img, 0, 0, 700, 550);
  }
  if ((song.position() > 2300 ) && (song.position () < 2600)) { //arcs begin...
  stroke (0);
  countDown (yellow, PI*2);
  }
  if ((song.position() > 2600 ) && (song.position () < 2900)) {
  stroke (0);
  countDown (pink, PI);
  }
  if ((song.position() > 2900 ) && (song.position () < 3200)) {
  stroke (0);
  countDown (blue, PI/2);
  }
  if ((song.position() > 3200 ) && (song.position () < 3500)) {
  stroke (0);
  countDown (green, PI/3);
   }
  if ((song.position() > 3500 ) && (song.position () < 3800)) {
  stroke (0);
  countDown (purple , PI/4); 
   }     
  if ((song.position() > 3800 ) && (song.position () < 4100)) { 
  stroke (0);
  countDown (yellow, PI*2);
  }
  if ((song.position() > 4100 ) && (song.position () < 4400)) {
  stroke (0);
  countDown (pink, PI);
  }
  if ((song.position() > 4400 ) && (song.position () < 4700)) {
  stroke (0);
  countDown (blue, PI/2);
  }
 if ((song.position() > 4700 ) && (song.position () < 5000)) {
  stroke (0);
  countDown (green, PI/3);
  }
  if ((song.position() > 5000 ) && (song.position () < 5300)) {
  stroke (0);
  countDown (purple , PI/4); 
  }   
  if ((song.position() > 5300 ) && (song.position () < 5600)) {
  stroke (0);
  countDown (yellow, PI*2);
  }
   if ((song.position() > 5600 ) && (song.position () < 5900)) {
 stroke (0);
  countDown (pink, PI);
   }
  if ((song.position() > 5900 ) && (song.position () < 6200)) {
  stroke (0);
  countDown (blue, PI/2);
  }
  if ((song.position() > 6200 ) && (song.position () < 6500)) {
  stroke (0);
  countDown (green, PI/3);
  }
 if ((song.position() > 6500 ) && (song.position () < 6800)) {
  stroke (0);
  countDown (purple , PI/4); 
  } 
  if ((song.position() > 6800 ) && (song.position () < 7100)) { 
  stroke (0);
  countDown (yellow, PI*2); //arcs end
  }
  if ((song.position() > 7100 ) && (song.position () < 7200)) { //red rect
  fill (#FF0000);
  rect (0, 0, 700, 550);
 }
  if ((song.position() >= 7200 ))  { //black rect
  noStroke();
  fill (0);
  rect (0, 0, 700, 550);
 }
 if ((song.position() > 9000 ) && (song.position () < 20000)) { // ellipseCirc
   noStroke();
 ellipseCirc ();
} 
 if ((song.position() > 9500 ) && (song.position () < 9600)) { // white bump 1
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 10950 ) && (song.position () < 11050)) { // white bump 2
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 12250 ) && (song.position () < 12350)) { // white bump 3
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 12850 ) && (song.position () < 12950)) { // white bump 4
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 13500 ) && (song.position () < 13600)) { // white bump 5
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 15200 ) && (song.position () < 15300)) { // white bump 6 - second set
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 16650 ) && (song.position () < 16750)) { // white bump 7
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 17950 ) && (song.position () < 18050)) { // white bump 8
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 18550 ) && (song.position () < 18650)) { // white bump 9
     fill (255, 100);
      rect (0, 0, width, height);
}

 if ((song.position() > 19200 ) && (song.position () < 19300)) { // white bump 10
     fill (255, 100);
      rect (0, 0, width, height);
}

//circEllipse ends at 20000- begin new phase

 if ((song.position() > 20000 ) && (song.position () < 21000)) { 
  g += xSpeed * directionX;
  if ((g > height-radiusvg) || (g < radiusvg)) {
    directionX = - directionX;
  }

  if ((xa < sz) || (xa < zip)) {
    xa += xSpeed;
  } 
  if ((xb < sz) || (xb < zip)) {
    xb += xSpeed;
  }
  fill (green, 50);
  triangle (xa, ya, xb, yb ,xc, yb); 


  float colorHB = mouseY; 
  if ((xap > zip) || (xap == zip)) {
    xap -= xSpeed;
  } 
  if ((xcp > zip) || (xcp == zip)) {
    xcp -= xSpeed;
  }
  fill (pink, 50);
  triangle (xap, yap, xbp, ybp ,xcp, ybp); //triangle that animates to the left
  }
  
  if ((song.position() > 21000 ) && (song.position () < 31500)) {  
   background (0);
   myShape.disableStyle();
   noStroke ();
   fill (purple);
   anglePshape = anglePshape + 5.0;
   rotate (anglePshape);
   shape (myShape, 300, 300); 
   myShape2.disableStyle();
   rotate (PI/2);
   noStroke ();
   fill (green);
   shape (myShape2, 300, 300);
  }
   if ((song.position() > 23000 ) && (song.position () < 41000)) {   
  fill (green);
  ellipse (x, y, radiusE, radiusE);
  y += (ySpeed*3) * directionY;
  if (( y > width-radiusE) || (y < radiusE)) { // ELLIPSE
    directionY = -directionY;
  }
  v+= ySpeed * directionX;
  if ((v> height-radiusvg) || (v< radiusvg)) {
    directionX = - directionX;
  }
  fill (blue); // VG ELLIPSE (smaller one!)
  ellipse (v, g, radiusvg, radiusvg);
  v += (ySpeed*2) * directionY;
  if (( v > width-radiusvg) || (v < radiusvg)) { 
    directionY = -directionY;
  }
   }

 if ((song.position() > 25000 ) && (song.position () < 41200)) { 
     fill (pink, 70);
      for (int x = 0; x <= width; x +=10) {
    float y = yOffset [0] + (sin(angleV + PI/2) * scaleVal[0]);
    ellipse (x, y, 15, 15);
    angleV += b;
      }
 }
       if ((song.position() > 26000 ) && (song.position () < 41300)) { 
         fill (green, 80);
           for (int x = 0; x <= width; x +=10) {
    float y = yOffset [1] + (sin(angleV + PI) * scaleVal[1]);
    rect (x, y, 14, 14);
    angleV += b;
           }
       }
           if ((song.position() > 270000 ) && (song.position () < 41400)) {
             fill (blue, 70);
            for (int x = 0; x <= width; x +=10) {
    float y = yOffset [2] + (sin(angleV + PI/4) * scaleVal[2]);
    ellipse (x, y, 5, 5);
    angleV += b;
            } 
           }
               if ((song.position() > 28000 ) && (song.position () < 41500)) { 
                 fill (yellow, 80);
                  for (int x = 0; x <= width; x +=10) {
    float y = yOffset [3] + (sin(angleV+ PI/6) * scaleVal[3]);
    ellipse (x, y, 15, 15);
    angleV += b;
                  }
               }
                   if ((song.position() > 29000 ) && (song.position () < 42500)) { 
                     fill (purple, 80);
                       for (int r=0; r <= width; r +=10) {
    float k = yOffset [4] + (sin(angleV*PI) * scaleVal[4]);
    rect (r, k, 30, 30);
    angleV += b;
                       }
}
  if ((song.position() > 42500 ) && (song.position () < 42600)) { //red rect
  fill (#FF0000);
  rect (0, 0, 700, 550);
 }

}
               

     
               



void ellipseCirc () {
  for( i = 50; i <700; i+= 100) { 
    fill (0, 4); 
    rect (0, 0, width, height);
    angle += speed*i; 
    float sinval = sin (angle);
    float cosval = cos (angle);
    float x = 350 + (cosval * radius);
    float y = 250 + (sinval * radius);
    fill (random(60, 280), random (260), 80, 80);
    ellipse (x, y, 30, 30); // draw smaller  circle
  } 
}
 

void countDown (int cdColor, float arcDraw) {
  fill (cdColor, 80);
  for (int i =200; i<400; i += 50) {
    float begin = radians (i);
    float end = begin + arcDraw;
    arc (410, 260, i+100, i+100, begin, end);
  }
  stroke (#FF0000);
  strokeWeight (4);
  line (400, 20, 400, 500);
  line (140, 270, 660, 270);
}

void stop () {
  song.close();
  minim.stop();
  super.stop();
}











