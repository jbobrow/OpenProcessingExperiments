
//Artist Statement
// This is a work designed to show mathematical entropy. 
// Speeds, directions and line sizes are randomized within bounds
// in order to create a different picture every time it is run. 

ArrayList<Orb> ballPit;
color[] palette = {#FF0000,#FF8C00,#FFFF00,#228B22,#0000FF,#4B0082,#9400D3, #FFFFFF, #000000};
int ballMin = 10;
int ballMax = 30;
int maxSpeed = 15;
int numOrbs = 10;

void setup() {
  size(800, 600);
  background(255);
  frameRate(30);
  ellipseMode(RADIUS);
  ballPit  = new ArrayList<Orb>();
  for(int i = 0; i < numOrbs; i++){//color, float xp, float yp, int xd, int yd, float xs, float ys, int r
    ballPit.add(new Orb((i < palette.length ? palette[i]: palette[i%palette.length]), random(0, width), random(0,width), random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed), round(random(ballMin,ballMax))));
  }
}

void mouseReleased(){
 ballPit.add(new Orb(palette[int(random(palette.length))], mouseX, mouseY, random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed), round(random(ballMin,ballMax))));
}
void draw() {
   // Update the position of the shapes
   for(int i = 0; i < ballPit.size(); i++){
     strokeWeight(ballPit.get(i).radius);
     float tempx = ballPit.get(i).xpos;
     float tempy = ballPit.get(i).ypos; 
     ballPit.get(i).move();
     stroke(ballPit.get(i).orbColor);
     line(tempx, tempy, ballPit.get(i).xpos, ballPit.get(i).ypos);
   }
}
class Orb{
  float xpos; float ypos;
  int radius;
  color orbColor;
  float xspeed = 4.0; float yspeed = 4.0;
  Orb(color col, float xp, float yp, float xs, float ys, int r){
    orbColor = col;
    xpos = xp;
    ypos = yp;
    xspeed = xs;
    yspeed = ys;
    radius = r;

  }
    void move() {
    xpos += xspeed;
    ypos += yspeed;
    if (xpos + radius > width) {
      xpos = width - radius;
      xspeed *= -1;
    }
    else if (xpos - radius < 0) {
      xpos = radius;
      xspeed *= -1;
    }
    if (ypos + radius > height) {
      ypos = height - radius;
      yspeed *= -1;
    } 
    else if (ypos - radius < 0) {
      ypos = radius;
      yspeed *= -1;
    }
  }
}


