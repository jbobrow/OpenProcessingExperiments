
//bouncy ball
int posx = 300; 
int posy = 150;
int w    = 15;
int h    = 15;
int leftB = 0;
int rightB = 600;
int xd   = int(random(1,30));
int yd   = int(random(1,30));
int scoreA = 0;
int scoreB = 0;
String letterx = " x "; 
color black = #000000;
color blue  = #1131F5;

void setup(){
  size(600,300);
  
}

void draw(){
  smooth();
  background(black);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>width) {
     xd = -xd;}
  if (posy>height) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
     //scoreboard
  PFont scoresFont;
  scoresFont = loadFont ("YuppySC-Regular-40.vlw");
  textFont(scoresFont);
  textAlign(CENTER);
  text("Team A",width/2-150,height/4-40);
  text("Team B",width/2+150,height/4-40);  
  text(scoreA,width/2-150,height/4);
  text(scoreB, width/2+150, height/4);
  text(letterx, width/2,height/4);
  if (posx == leftB){
      scoreB += 1;  
  }
  if (posx == rightB) {
      scoreA += 1;  
  }
}

void ball (int x,int y,int w,int h) {
   noStroke();
   smooth();
   fill (255); 
   ellipseMode(CENTER);
   ellipse (x, y, w, h);
}




