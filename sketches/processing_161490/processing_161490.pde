
int posx = width/2;
int posy = height/2;
int xd = 20;
int yd = 20;
int w = 10;
PImage bkpic;
PImage bcpic;
int h = 10;

int score1 = 0; 
int score2 = 0;

// define setup function
void setup(){
  size(600, 319);
  bkpic = loadImage("hockey_rink_diagram.png");
  image(bkpic, 0, 0);
  frameRate(15);
  }

// define draw function
void draw() {
  // if statements bouncing of the ball
  image(bkpic, 0, 0);
   
  ball(posx, posy, w, h);
  
  posx = posx + xd;
  posy = posy + yd;
  if (posx>(width-w)) {
     xd = -xd;
     score1 = score1 + 1;}
  if (posy>height-h) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd; 
     score2 = score2 +1;}
  if (posy<0 + h) {
     yd = -yd;}
   
   //paddles
   stroke(0);
   strokeWeight(8);
   line(4, height-50, 4, height);
   line(width-4, height,-50, width-4, height);
 
  // text displaying live results 
  PFont scoresFont;
  scoresFont = loadFont ("CharlemagneStd-Bold-48.vlw");
  fill (255, 0, 0);
  textFont(scoresFont);
  textAlign(CENTER);
  text("X", 300, 40);
  text(score1, 200, 40);
  text(score2, 400, 40);
  }

  void ball(int x,int y,int w,int h) {
   //noStroke();
   ellipseMode(CORNER);
   fill(255); 
   ellipse(x, y, w, h);
  }
  void mousePressed() {
  loop();  
}

void mouseReleased() {
  noLoop();  
}


