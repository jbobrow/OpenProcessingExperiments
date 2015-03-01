
// bouncing ball

int posx = 300;
int posy = 191;
int xd = int(random(1,30));
int yd = int(random(1,30));
//int xd = 100;
//int yd = 100;
int w  = 15;
int h  = 15;
color blue = #1131F5;
PImage bkpic;
PFont coolFont;
//coolFont = loadFont("RosewoodStd-Regular-30.vlw");
String letterx = "x";
int goalineA = 100;
int goalineB = 500;
int post1 = 100;
int post2 = 200;
int scoreA = "A: "0;
int scoreB = "B: "0;

void setup(){
  size(600,382);
  frameRate(30);
  //noLoop();
  bkpic = loadImage("soccer_field.png");  
}

void draw() {
  background(bkpic);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>(width-30)) {
     xd = -xd;}
  if (posy>(height-30)) {
     yd = -yd;}
  if (posx<30) {
     xd = -xd;}
  if (posy<30) {
     yd = -yd;}

     //scoreboard
//  coolFont = loadFont("RosewoodStd-Regular-30.vlw");
  text(scoreA,width/2-40,height/4);
  text(scoreB, width/2+40, height/4);
  text(letterx, width/2,height/4);
  if (posx <= goalineA & posy > post1 & posy < post2){
      scoreB += 1;
     
  }
  if (posx >= goalineB & posy > post1 & posy < post2 ) {
      scoreA += 1;  
  }
}


void ball (int x,int y,int w,int h) {
   noStroke();
   smooth();
   fill (255); 
   ellipse (x, y, w, h);
}


void mousePressed() {
  noLoop(); 
}

void mouseReleased() {
  loop();  
}
//println(scoreA);
//println(scoreB);
