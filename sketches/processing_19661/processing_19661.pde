
// Sort-of-Pong
// William A. Clark / CCA 2011 / Math, Programming and Art
// next step...webcam pong! (have started to work on this seperately, but a helluva lot more complicated...)

// Coding fast.. yay spaghetti code
// Don't quite have the physics right.. but close enough for rudimentary pong

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

float x1 = 125;                // ball x
float y1 = 1;                  // ball y
float dx = 4;                  // direction (x)
float dy = 2;                  // direction (y)
float mh=120;                  // paddle height 
float mw=20;                   // paddle width
int k = 1;                     // alternate
int keypressed = -1;           // wait for keypress

int points_player;
int points_computer;

PFont font;                    // init font vessel

void setup() {
  background(255);
  size(800,300);
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  font = loadFont("conduitlight.vlw");  // load font
 
  Ani.init(this);
}

float mx1=50; float my1=50;     // left paddle x and y
float mx2=750; float my2=150;   // right paddle x and y

//init 'start' variables to return to when a point is scored
float paddle_startx = mx1; float paddle_starty = my1; 
float paddle2_startx = mx2; float paddle2_starty = my2; 
float ball_startx = x1; float ball_starty = y1;
float dx_start = dx; float dy_start = dy;

void draw() {
  background(255);
  fill(255);
  //really hackish way of (hopefully) insuring the ball doesn't get stuck.. every couple of frames, sample x and y pos. Next set of frames, check to see if they have changed\
  /** DOESN'T WORK
  if(count%15 == 0) {
  xtest = x1; ytest = y1;
  }
  **/
  
if(x1 > width) {
  points_player++;   // if ball passes right sketch boundary, score a point for the player
  mx2 = paddle2_startx; my2 = paddle2_starty; // put the paddles back at their original places
  x1 = ball_startx; y1 = ball_starty; // put ball back
  keypressed = keypressed*-1;  // wait for keypress to start again
}

if(x1 < 0) {
  points_computer++;  // if ball passes left boundary, score point for computer
  mx2 = paddle2_startx; my2 = paddle2_starty; // put stuff back
  x1 = ball_startx; y1 = ball_starty;
  keypressed = keypressed*-1;
  dx=dx*-1; dy=dy*-1;
}

if(keypressed == 1) { // wait for keypress to begin
background(255);
fill(0);
ellipse(x1, y1, 20, 20); // draw ball

if((dist(mx1, my1, x1, y1) < (mh-mw-50))
    || (dist(mx1, my1, x1, y1) < (mw-mh-50)) 
    || (dist (mx2,my2, x1, y1) < (mh-mw-50)) 
    || (dist (mx2,my2, x1, y1) < (mh-mw-50))) { 
       dx = dx*(random(-1,-6)); // if ball hits paddle, reverse direction
}

if((y1 > height) || (y1 < 0) 
                 || (dist(mx1, my1, x1, y1) < (mh-mw-50)) 
                 || (dist(mx1, my1, x1, y1) < (mw-mh-50)) 
                 || (dist (mx2,my2, x1, y1) < (mh-mw-50)) 
                 || (dist (mx2,my2, x1, y1) < (mh-mw-50))) {                   
  dy = dy*-1; // if ball hits paddle or edge boundaries, reverse direction
}

x1 += dx; y1 += dy; // keep ball moving
}

//draw left paddle and follow mouseY
fill(0);
rect(mx1,my1,mw,mh);
my1 = mouseY;

fill(120); noStroke();

//imbue right paddle with semi-AI: randomly either move it to hit the ball, or miss

//this logic is still a bit fuzzy, as it catches the y position of the ball not immediately at its point of impact
//(in order to give paddle some time to move), and thus isn't always 100% right.
//also: need to write some code to insure the paddle stays within the sketch frame...
if(x1 >= width-150 && x1 < (width-150)+5) {                                           // when ball crosses a certain threshold...
  if(k == 1){                                                                         // variable to alternate action (so paddle doesn't move when the ball bounces back as well)
    if(random(0,10) >= 6) {                                                           // where number after ">=" is probability of moving paddle directly to ball y position
       Ani.to(this,1,"my2", constrain(y1,80,height-80));                              // ease to ball y position
       println("to ball");} 
     else {Ani.to(this,1.5,"my2",random(y1-(mh),y1+(mh))); println("not");} k=k*-1;}  //otherwise, ease to semi-random position
  else if(k == -1) { k=k*-1; }
}
 
//draw right paddle  
rect(mx2, my2, mw, mh);


// draw dotted line down center
dottedLine(width/2,0,width/2,height,50);

// draw scores
textFont(font, 15);
text("Score: " + points_player, 35, height-15);
text("Score: " + points_computer, width-35, height-15);

if(keypressed == 1) {fill(255,0);}
else { fill(120); }
textFont(font, 35);
textAlign(CENTER);
text("please press any key to start", width/2, height/2);

// check for stuck ball
/** Uhmm yeah so this doesn't work.
if(count%30 == 0) {
  if(xtest > x1+2) { //DO NOTHING }
  else { x1 = x1+2; }
}
*/
}


/** END OF DRAW LOOP **/

void mouseDragged() {
  if(dist(mouseX, mouseY, x1, y1) < 50) {
  x1 = mouseX;
  y1 = mouseY;
  println("dx: " + dx); println("dy: " + dy);
  }
  
  /**
  if(dist(mouseX,mouseY, mx1, my1) < 100) {
    //rect(mx1, my1, mouseX, mouseY);
    //mx1 = mouseX; 
    my1 = mouseY;
  }**/
  
  if(dist(mouseX,mouseY, mx2, my2) < 100) {
    //mx2 = mouseX; 
    my2 = mouseY;
}}

//pulled this subroutine from http://processing.org/discourse/yabb2/YaBB.pl?board=Syntax;action=display;num=1219255354
void dottedLine(float x1, float y1, float x2, float y2, float steps){
 for(int i=0; i<=steps; i++) {
   float x = lerp(x1, x2, i/steps);
   float y = lerp(y1, y2, i/steps);
   noStroke();
   ellipse(x, y,2,2);
 }
}

void keyPressed(){
  keypressed = keypressed*-1;
}

    

