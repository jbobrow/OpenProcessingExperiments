
/* press "l" to launch the duck. 
Use "WASD" to control the duck's motion through the air.
the player gets 3 lives, depicted by circles on the bottom of the scren
the number of seconds the duck stays alive is the players score
lose 3 lives and the game is over
*/

float duckx;
float ducky;
float dyspeed=5;
float headl=15;
int sec=second();
int time=sec-sec;
PFont font;
float x;
float y;
float bspeed;
float bangle;
int lives;
cloud[] myObject;
float gx;
float gy;
float gey;


void setup() {
  size (1000, 800); 
  //font
  font=loadFont("Courier10PitchBT-Bold-48.vlw");
  textFont(font, 20);
  ducky=(4*height/5);
  duckx=width/2;
  //bullets
  strokeWeight(4);
  x=width/9;
  y=7*height/10;
  bspeed=10;
  bangle=2;
  smooth();
  lives=3;
  gx=1;
  gy=4*height/5;
  


  //cloud array
  myObject = new cloud[5];
  for (int i =0; i <5; i++) {
    myObject[i] = new cloud ();
  }
}


void draw() {

  float bulletx = width/3;
  float bullety = height/2;
  float endx =(width/3)+5;
  float endy = height/2;
//environment
  background (#8DDEFA);
  if (ducky< (4*height/5)-10 && duckx>width/9){
  time=time+1;
  }
  fill(#AD6642);
  rect(0, (4*height/5), width, height/4);

  //hunter
  stroke(0);
  line(width/9, 7*height/10, (width/9)-22, (7*height/10)+5);
  line(width/9-22, (7*height/10)+2, width/9-22, (7*height/10)+40);
  line(width/9-22, (7*height/10)+40, (width/9)-30, 4*height/5);
  line(width/9-22, (7*height/10)+40, (width/9)-18, 4*height/5);
  fill(0);
  ellipse((width/9)-22, (7*height/10)-8, 20, 20);
  
  //grass loop
  while (gx>0 && gx<=width) {
    stroke(0, (random(205,255)),0);
    strokeWeight(2);
    gey=(4*height/5)-(random(25, 30));
    line(gx, gy, gx, gey);
    gx=gx+1;
  }
  gx=1;


  //duck
  fill(#897C7C);
  if (lives<5 && lives>0) {
    noStroke();
    duck(duckx, ducky);
  }

  //launch controls

  if (keyPressed) {
    if (key=='l' || key=='L') {
      ducky=ducky-dyspeed;
    }
    if (key=='d') {
      duckx=duckx+8;
      headl=15;
    }
    if (key=='a') {
      duckx=duckx-8;
      headl=(-15);
    }
    if (key=='s') {
      ducky=ducky+10;
    }
    if (key=='w') {
      ducky=ducky-7;
    }
  }
  //duck flies once launched
  if (ducky<4*height/5) {
    ducky=ducky-dyspeed;
  }
  //duck comes back to bottom if it flies off top
  if (ducky<0) {
    ducky=((4*height/5)-1);
  }
  if (duckx>width) {
    duckx=0;
  }
  if (duckx<0) {
    duckx=width;
  }

  //clock display
  text(time/45, width/2, 27*height/32);

  //collision
  if (duckx< x+20 && duckx>x-20 && ducky< y+20 && ducky> y-20) {
    ducky= (4*height/5);
    time=0;
    bspeed=10;
    lives=lives-1;
  }

  //bullets
  bullets (x, y);
  x=x+bspeed;
  y=y-bangle;

  if (x>width || y<0) {
    x=width/9;
    y=7*height/10;
    bullets(x, y);
    bangle=random(0, 40);
    bspeed=bspeed+.7;
  }


 //scoreboard
  if (lives==3) {
    ellipse(2*width/9, 27*height/32, 20, 20);
    ellipse(3*width/9, 27*height/32, 20, 20);
    ellipse(4*width/9, 27*height/32, 20, 20);
  }
  if (lives==2) {
    ellipse(2*width/9, 27*height/32, 20, 20);
    ellipse(3*width/9, 27*height/32, 20, 20);
  }
  if (lives==1) {
    ellipse(2*width/9, 27*height/32, 20, 20);
  }  

  //cloud array
  for (int i =0; i <5; i++) {
    myObject[i].display();
  }
}

//creating the duck
void duck(float duckx, float ducky) {
  ellipse(duckx, ducky, 30, 30);
  fill(0, 200, 5);
  ellipse(duckx+headl, ducky-10, 15, 15);
  ellipse(duckx-3, ducky-2, 30, 15);
  
}

//creating the bullets
void bullets(float x, float y) {
  fill(0);
  ellipse(x, y, 10, 3);
} 

//cloud array

class cloud {
  float xpos;
  float ypos;

  cloud () {
    xpos = random (0, width);
    ypos = random (0, height/3);
  }

  void display () {
    noStroke();
    fill (255);
    ellipse (xpos, ypos, 25, 25);
    ellipse (xpos+5, ypos-10, 15, 20);
    ellipse (xpos-10, ypos+2, 20, 20);
    xpos=xpos+1.5;
    if (xpos>width) {
      xpos= random(-400, 0);
    }
  }
}
