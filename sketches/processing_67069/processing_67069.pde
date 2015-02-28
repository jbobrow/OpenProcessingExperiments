
/* written by Aaron Fraint, 8/7/2012
listen to this:
http://soundcloud.com/thickandthin-1/tfus2012-sat-rocker-cd-mp3
*/

int newX;
int newY;
int oldX;
int oldY;

void setup(){
  size(450,450);
  background(0);
  frameRate(7);// # of times that draw() runs per second
  newX = width/2;
  newY = height/2;
}

void draw(){  
  // create ellipse with random center point
  newX = generate();
  newY = generate();
  make_ellipse(newX, newY);
  // draw line from center of prior ellipse to newest ellipse
  make_line(oldX, oldY, newX, newY);
  // the new ellipse is now the old ellipse
  oldX = newX;
  oldY = newY;
}
void make_line(int oldX, int oldY, int newX, int newY){
  // constructs line, unless it's from position 0,0
  if (oldX==0){noStroke();}
  else{stroke(0);strokeWeight(4);}
  line(oldX, oldY, newX, newY);
  }
void make_ellipse(int x, int y){
  // constructs ellipse with random width, height, color  
  int wide = round(random(375));
  int tall = round(random(375));
  int transparency = 30;
  int ellipse_color = color(250, round(random(100,255)), 80, transparency);
  //
  fill(ellipse_color);
  smooth();
  noStroke();
  ellipse(x, y, wide, tall);
}
int generate(){
  // creates a random number between floor and ceiling
  int num = round(random(112,337));
  return num;
}

