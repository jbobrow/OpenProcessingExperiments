
//Green, Green Grass of Home at night
//''Home is the place you left''by Michael Elmgreen. 
// The drawing shows what I see evrytime when I cross the forest and arrive home at night. 
// suhsiupai@gmail.com
// Reference:http://www.openprocessing.org/sketch/117035_by Sheng-Fen Nik Chien

int n1=1;
int div = 3;
int step=1;


void setup () {
  size(900, 500);
  smooth();
  frameRate(2);
  //noLoop();
}

void draw() {
  background(50, 90, 130);


  //Draw background diffusion
  for (int x = 0; x<30; x+=1) {
    drawbackgroundd(450-5*x);
  }



  //Draw Grass
  //horizontal repeat 
  for (int i = 0; i<900; i+=3) {
    //Dark    
    
    
    float ynoise=random(100,250);
    float rny= 60+noise(ynoise)*200;
    
    draw_wiggle_line(i, 0, i, rny, 200);
    draw_wiggle_line(i, 0, i, rny, 100);
    draw_wiggle_line(i, 0, i, rny, 200);
    draw_wiggle_line(i, 0, i, rny, 150);
    draw_wiggle_line(i, 0, i, rny, 50);
  }

  for (int i = 0; i<900; i+=3) {
    //brighter
    draw_wiggle_line(i, 20, i, 210, 100);
    draw_wiggle_line(i, 50, i, 250, 100);
    draw_wiggle_line(i, 0, i, 250, 100);
  }

  for (int i = 0; i<900; i+=3) {
    //bright
    draw_wiggle_line(i, 150, i, 300, 30);
    draw_wiggle_line(i, 150, i, 300, 30);
    draw_wiggle_line(i, 200, i, 350, 30);
    draw_wiggle_line(i, 0, i, 30, 30);
  
  }


  //draw different grasses from left
  for (int i = 0; i<370; i+=2) {
    draw_short_wiggle_line(i, 0, i, 70, 255);
    draw_short_wiggle_line(i, 0, i, 80, 255);
    //right
    draw_short_wiggle_line(width-i, 0, width-i, 160, 150);
    draw_short_wiggle_line(width-i, 80, width-i, 160, 220);
    draw_short_wiggle_line(width-i, 100, width-i, 180, 220);
    draw_short_wiggle_line(width-i, 60, width-i, 200, 220);
  }

  //Draw the moon
  for (int x = 0; x<60; x+=1) {
    drawmoon(20+2*x);
  }
 

 
  //Draw blue tress
  for (int i = 0; i<900; i+=160) {
    drawtrees(i, 999, i, 0, 255, 4, 20,51 , 42);    
    drawtrees(i, 999, i, 0, 255, 4, 10,41, 49);
    drawtrees(i, 999, i, 0, 255, 2, 5, 31, 36);
    drawtrees(i, 999, i, 0, 255, 2, 0, 20, 32);
  }
  
    drawlights(width-mouseX,mouseY);
   //Draw black trees
  for (int i = 0; i<900; i+=300) {
    drawtrees(i-50, 999, i-50, 0, 255, 0, 0, 0, 64);
  }
 
 

 //Draw the man
 
  drawman();
  
  
 
}




void drawbackgroundd(int r) {
  int R =r ;
  noStroke();
  fill(255,5);
  ellipse(500, 20, R*2, R*2);
}





void drawmoon(int r) {
  int R =r ;
  noStroke();
  fill(255, 10);
  ellipse(500, 20, R*2, R*2);
}




void draw_wiggle_line(float sx, float sy, float ex, float ey, float trans) {
  // stroke(5);
  // stroke(0, 30);
  //line(sx, sy, ex, ey);
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  float t =trans; 
  for (int i=0; i<div; i++) {
    x = x + xstep;
    x = x + random(20) - 10; // wiggle on x
    y = y + ystep;
    y = y + random(15) - 10; // wiggle on y
    strokeWeight(1);
    stroke(0, t);
    
    //line (x, y, lastx, lasty);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}



void draw_short_wiggle_line(float sx, float sy, float ex, float ey, float trans) {
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  float t =trans; 
  for (int i=0; i<div; i++) {
    x = x + xstep;
    x = x + random(6) - 5; // wiggle on x
    y = y + ystep;
    y = y + random(15) - 10; // wiggle on y
    stroke(0, t);
    strokeWeight(0.5);
    //line (x, y, lastx, lasty);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}


void drawtrees(float sx, float sy, float ex, float ey, float trans, int cr, int cg, int cb, int thick) {
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  float t =trans; 
  int th= thick;
  int CoR= cr;
  int CoG= cg;
  int CoB =cb;
  for (int i=0; i<div; i++) {
    x = x + xstep;
    x = x + random(6) - 5; // wiggle on x
    y = y + ystep;
    y = y + random(15) - 7; // wiggle on y
    stroke(cr, cg, cb, t);
    strokeWeight(th);
    //line (x, y, lastx, lasty);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}

void drawlights(int CX, int CY){
float cx= CX;
float cy= CY;
stroke(255,50);
strokeWeight(random(6));
fill(255,249,177,random(30,200));
ellipse(cx+random(-200,400), cy-random(30),3,3);
ellipse(cx+random(100), cy+random(30),3,3);
fill(255,249,177,random(150,240));
ellipse(cx+random(-200,400), cy-random(30),3,3);
ellipse(cx+random(-200,400), cy-random(30),5,5);

}

void drawman() {
  fill(0);
  beginShape();
  noStroke();
  vertex(319, 500);
  bezierVertex(319, 500, 314, 485, 316, 460);
  bezierVertex(316, 460, 315, 405, 323, 401);
  bezierVertex(323, 401, 353, 391, 357, 387);
  bezierVertex(357, 387, 363, 369, 359, 364);
  bezierVertex(359, 364, 347, 352, 355, 341);
  bezierVertex(355, 341, 369, 322, 381, 328);
  bezierVertex(381, 328, 398, 340, 394, 353);
  bezierVertex(394, 353, 389, 374, 386, 374);
  bezierVertex(386, 374, 385, 383, 391, 385);
  bezierVertex(391, 385, 421, 394, 422, 402);
  bezierVertex(422, 402, 432, 440, 432, 451);
  bezierVertex(432, 451, 432, 500, 432, 500);
  endShape();
  
}






