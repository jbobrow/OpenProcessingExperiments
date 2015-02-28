
//////// Human object.

Human a, b, c, d, e;

Human[] people;
int many=0;

color bg=  color(159,191,255);
color fg=  color(225,255,225);
float horizon;

boolean okmove=true, okjiggle=true, pause=false;
boolean tracking=false;

  int n=0;
  int count=0;
  int quitcount= -3;

float xreport=500, yreport=20;

void setup() {
  //// Set up the screen
  size(640,480);
  smooth();
  strokeJoin(ROUND);  
  horizon=  height*1/6;
  //// Instantiate the humans;
  a=  new Human(6.2*12, "A", color(255,151,151), color(255,63,63), color(63,63,255) );
  b=  new Human(6.1*12, "B", color(255,181,181), color(255,255,63), color(127,63,63) );
  c=  new Human(5.1*12, "C", color(255,199,199), color(63,255,255), color(255,63,255) );
  d=  new Human(5*12, "D", color(255,191,171), color(63,255,63), color(255,127,63) );
  e=  new Human(3*12, "e", color(255,222,222), color(255,191,127), color(191) );
  restart();
  //// Make an array of humans.
  people=  new Human[10];
  people[0]=  a;
  people[1]=  b;
  people[2]=  c;
  people[3]=  d;
  many=  4;
}
void restart() {
  //// Re-initialize globals and objects.
  a.set(100,horizon+100, 2.25, 1.25);
  b.set( 100, horizon, 1.25, 1.5);
  c.set(200, horizon+100, 2.0, 1.25);
  d.set( 200, horizon, 1.0, 1.5);
  e.set( 400, horizon, 1.0, 1.5);
  n=0;
  count=0;
  okmove=true; okjiggle=true; pause=false;
}

void draw() { //// Draw the scene and the Humans.
count++;        // Frame counter.
scene();        //// Draw the scene (and text).
crashes();     //// Take care of "crashes" first.
updateall();  //// Move & draw humans.
}//// draw( ) ////

void scene() {  //// Draw the scene, add help text, handle pauses, etc.
// Sky & lake.
background(bg);
fill(fg);
rectMode(CORNERS);
rect(0,horizon, width,height);
trees(horizon);
;
//// Text on screen.
text( "ABCD ice skating", 200,10 );
text( "Press ? key for instructions", 450,10); 
if (pause) {
  help();
  if (quitcount >= 0) {    quitting();  }
}
}//// draw ////
void quitting() {    //// Quit messages; exit if really quitting.
String s;
if (quitcount==0) {
  s=  "ARE YOU \n        R E A L L Y \n                 SURE YOU WANT TO QUIT?";
  fill(255,0,255);
}else{
  fill(255,0,0);
  s=  "Are you sure you want to quit?\n    (if so, hit 'q' again!)     "+quitcount;
}
text( s, 20, horizon+20);
}//// quitting() ////

void updateall() {  //// Update all humans, etc.
a.update();
b.update();
c.update();
d.update();
e.update();
}//// updateall() ////
void crashes() {    //// Handle all crashes.
crash(a,b);
crash(a,c);
crash(a,d);
crash(b,c);
crash(b,d);
crash (c,d);
}// crashes( ) //
void crash( Human a, Human b) {  //// Handle one crash.:  Exchange velocities.
  if (isCrashed(a,b)) {
    //// Flash the crash!
    noStroke();
    fill( 0, 0, 0, 191 );
    ellipse( a.x, a.y, 1.5*(a.w+b.w), 1.5*(a.h+b.h) );
    fill( 255, 255, 255, 191 );
    ellipse( a.x, a.y, a.w+b.w, a.h+b.h );
    fill( 255, 0, 0, 127 );
    ellipse( a.x, a.y, a.w, a.h );
    ellipse( b.x, b.y, b.w, b.h );
    //// Exchange velocities. 
    float tmp;
    tmp=a.dx;  a.dx=b.dx; b.dx=tmp;
    tmp=a.dy;  a.dy=b.dy; b.dy=tmp;
    a.move();  a.move();  a.move();          // Bounce a few extra times!
    b.move();  b.move();  b.move();
  }
}
boolean isCrashed( Human a, Human b ) {  //// Return true if coords within height & width.
float wavg=  (a.w+b.w) / 2;    // Avg width & height
float havg=  (a.h+b.h) / 2;
float xx=  abs(a.x - b.x );    // Separations
float yy=  abs(a.y - b.y );
return xx < wavg && yy < havg;
}

void mousePressed() {  //// Where is mouse, when clicked?
if (a.isOver(mouseX,mouseY))   a.set(100,horizon+100, 2.25, 1.25);
if (b.isOver(mouseX,mouseY))   b.set( 100, horizon, 1.25, 1.5);
if (c.isOver(mouseX,mouseY))   c.set(200, horizon+100, 2.0, 1.25);
if (d.isOver(mouseX,mouseY))   d.set( 200, horizon, 1.0, 1.5);
}

void keyPressed() {  //// Which key was pressed?  Take appropriate action.
if (key == 'f') { okmove=false; okjiggle=false; }    // FREEZE!
if (key == 'j') okjiggle=  ! okjiggle;
if (key == 'm') okmove=  ! okmove;
if (key == 'r') restart();
if (key == '?' || key=='p') { 
  pause=  ! pause;
  if (pause) {
      okmove=false; okjiggle=false; 
  } else {
      okmove=true; okjiggle=true; 
  }
}
if (key == 'q') {
  if (quitcount == 0 ) exit();
  else if (quitcount > 0) quitcount--;            // Start countdown.
  else if (quitcount < 0) quitcount=  -quitcount;
  pause=  true;
  okmove=false; okjiggle=false; 
}
if (key == 'Q') {   if (--quitcount == 0 ) exit();  quitcount=1; pause=true; };
//
if (key == 'A') a.speed(1.25);    if (key == 'a') a.speed(0.75);
if (key == 'B') b.speed(1.25);    if (key == 'b') b.speed(0.75);
if (key == 'C') c.speed(1.25);    if (key == 'c') c.speed(0.75);
if (key == 'D') d.speed(1.25);    if (key == 'd') d.speed(0.75);
if (key == '+' || key=='=') speedall(2.);
if (key == '-') speedall(.5);
if (key == '@') tracking=  !tracking;    //// Report positions (DEBUG).
}//// END keyPressed() ////

void speedall( float speedup ) {  //// Speed up if > 1; slowdown if < 1;
if (speedup==0) return;
a.speed(speedup);
b.speed(speedup);
c.speed(speedup);
d.speed(speedup);
}


void trees(float y) {    ////
  float x=0, h, w;
  for (x=0; x<width; ) {
    w=  5 + random(20);
    h=  20 + 2 * w;
    fill(0,127,0);
    triangle( x,y+1+random(2), x+w/2,y-h, x+w,y+random(3) );
    x=  x+w;
  }
}

void help() {
  //// Display instructions.
  xreport=450; yreport=horizon+20;
  report( "KEYS:    (hit key again, to toggle)" );
  report( "----" );
  report( "j     stop/start jiggle" );
  report( "m  stop/start moving" );
  report( "p    pause (same as '?)" );
  report( "q    quit" );
  report( "r     restart" );  
  report( "+     all move faster" );
  report( "-     all move slower" );
  report( "A,B,C,D     move this Human faster" );
  report( "a,b,c,d     move this Human slower" );
  report( "(click on any human to restart him.)" );  
}// help() //
void report( String z ) {
  //// Report message to screen (for debugging, etc.)
  color csave=0;//=  fill;
  fill(0);
  text(z, xreport, yreport);
  yreport +=12;
  fill(csave);
}
void report( float z ) {
  //// Report value to screen (for debugging, etc.)
  color csave=0;//=  fill;
  fill(0);
  text(z, xreport, yreport);
  yreport +=12;
  fill(csave);
}





class Human {
  //////// Position of Human
  float x=100, y=100;     // Position
  float dx=1, dy=1;       // Velocity
  color skin=  color(255,191,191);
  color shirt=  skin;    // (Begin naked!)
  color pants=  skin;
  String name=".";
  
  void update() {
    //// move, jiggle, and show the humans  
    if (okmove) move();
    if (okjiggle) jiggle();
    show();
  }

  void show(float xset, float yset) {
    //// Draw the human at (x,y)
    x=  xset; y=yset;
    show();
  }
  void show() {
    //// Draw the human.

    rotate(c);

    noStroke();
    fill(skin);                // Draw the head.
    ellipseMode(CENTER);
    ellipse(x, y-h/2-hn-hf/2,   wf, hh+5);
    // (Add 5 to head size.)
    fill(255);          // Teeth
    stroke(255,0,0);
    strokeWeight(1);
    ellipse( x, y-h/2-hn,   wf*2/3, 3);
    noStroke();
    ellipse(x-2, y-h/2-hn-hf*3/4,   2, 2);
    ellipse(x+2, y-h/2-hn-hf*3/4,   2, 2);
    
    fill(shirt);
    rectMode(CENTER);
    rect(x,y-h/4, w,h/2-hhn/2);
    fill(0);
    text( name, x-4,y-h/4 );

    stroke(shirt);
    strokeWeight(6);
    float ds=2;            // Difference due to stroke weight.
    line(x-w/2-ds, y-h/2+hhn/2+ds, x-w/2-ds+a1,y-h/2+hhn/2+ha1+ds);        // Right arm.
    line(x-w/2-ds+a1,y-h/2+hhn/2+ha1+ds, x-w/2-ds+a1+a2,y-h/2+hhn/2+ha1+ha2+ds);
    line(x+w/2+ds, y-h/2+hhn/2+ds, x+w/2+ds-b1,y-h/2+hhn/2+hb1+ds);        // Left arm.
    line(x+w/2+ds-b1,y-h/2+hhn/2+hb1+ds, x+w/2+ds-b1-b2,y-h/2+hhn/2+hb1+hb2+ds);
    
    //  Note the elbow position (with a red dot).
    float xa2=x-w/2-ds+a1, ya2=y-h/2+hhn/2+ha1+ds;
    fill(255,0,0);
    ellipse(xa2,ya2, 2,2);

    fill(pants);
    stroke(pants);
    strokeWeight(6);
    line(x-w/2+3,y-3, x-w/2-a5,y-3+ha5);        // Right femur.
    line(x-w/2-a5,y+ha5, x-w/2+3+a6,y+ha5+ha6);
    line(x-w/2+3+a6,y+ha5+ha6, x-w/2+3+a6-ha7,y+ha5+ha6);
    
    stroke(pants);
    line(x+w/2-3,y-3, x+w/2+b5,y-3+hb5);        // Left femur.
    line(x+w/2+b5,y+hb5, x+w/2+3+b6,y+hb5+hb6);
    line(x+w/2+3+b6,y+hb5+hb6, x+w/2+3+b6+hb7,y+hb5+hb6);
/*
    line(x+w/2-3,y-3, x+w/2+b5,y+hb1);        // Left
    line(x+w/2+b5,y+hb1, x+w/2-3,y+hb1+hb2);
    line(x+w/2-3,y+hb1+hb2, x+w/2-3+hb7,y+hb1+hb2);
*/

    //  Note the knee position (with a blue dot).
    float xa6=x-w/2-ds-a5, ya6=y+ha5+ds;
    fill(0,0,255);
    ellipse(xa6,ya6, 2,2);
    
    // Tracking.
    if (tracking) {
      xreport=  x-w/2;
      yreport=  y+h/2+20;
      report( "("+round(x)+","+round(y)+")" );
      report( " "+round(dx*100)+"% "+round(dy*100)+"%" );
      report( "h"+h +",hh="+hh );
    }


    strokeWeight(1);    // Restore it.
    stroke(0);
  }
  void move( ) {
    //// Move Human position; also randomize limbs.
    //// Move by dx, dy
    x += dx;
    y += dy;
    // Bounce off walls.
    if (x < 0-dx || x > width-dx ) dx=  -dx;
    if (y < horizon || y > height-dy ) dy=  -dy;
  }
void jiggle() {  //// Limb movement.
if (count%3 == 0) {
  a1= -random(20);
  a2= a1+random(20);
  a3= -random(5);
  a5= random(10);
  a6= -random(10);
  a7= -random(10);

  b1= -random(10);
  b2= b1+random(10);
  b3= -random(5);
  b5= random(10);
  b6= -random(10);
  b7= -random(10);
}
if (count%5 == 0) {
  c=  0.05 - random(.1);
}
}// jiggle() ////
boolean isOver( float xx, float yy) {   //// Is coordinate near me?
return abs(xx-x) < w/4  ||  abs(yy-y) < h/4;
}

 

  
  //////// Human anatomical proportions and angles.
  float h=  72;    // Height
  float w=  h/4;    // Width (of torso)
  float wf= 2+w/2;    // Width of face.


  // Angles from vertical.  ++++ Use sines!!!
  float c=  0;      // centerline angle (from vertical; center at crotch)
  float a1=-10, a2=10, a3=-5;    // right-arm angles (humerus, radius/ulna, carpals) 
  float a5=10, a6=-10, a7=-2;    // right-leg angles (femur, tibia/fibula, heel)
  float a41,a42,a43,a44,a45, a81,a82,a83,a84,a85;  // digits and toes; 

  float b1=a1, b2=a2, b3=a3;    // right-arm angles (humerus, radius/ulna, carpals) 
  float b5=a5, b6=a6, b7=a7;    // right-leg angles (femur, tibia/fibula, heel)
  float b41,b42,b43,b44,b45, b81,b82,b83,b84,b85;  // digits and toes  

  //// VITRUVIAN MAN:  
  // Lengths (height) of appendages (a is right, b is left, f is face, n is neck)
  float ha1=h/8, ha2=h/4-h/10, ha3=h/10;    // right-arm lengths (humerus, radius/ulna, carpals) 
  float ha5=h/4, ha6=h/4, ha7=h/7;    // right-leg angles (femur, tibia/fibula+heel, foot)
  float ha41,ha42,ha43,ha44,ha45, ha81,ha82,ha83,ha84,ha85;  // digits and toes; 
  float hb1=ha1, hb2=ha2, hb3=ha3;    // left-arm lengths (humerus, radius/ulna, carpals) 
  float hb5=ha5, hb6=ha6, hb7=ha7;    // left-leg angles (femur, tibia/fibula+heel, foot)
  float hb41,hb42,hb43,hb44,hb45, hb81,hb82,hb83,hb84,hb85;  // digits and toes; 
  
  // Head heights.
  float hn=h/40, hh=2+h/8, hf=h/10, hhn=hn+hh;        // Neck, Face, Head (chin to top) 
  float hp1=h/10;            // Guess!
 
  /*  Modify the above, as necessary.
  SEE:  http://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Da_Vinci_Vitruve_Luc_Viatour.jpg/250px-Da_Vinci_Vitruve_Luc_Viatour.jpg
  The lower section of text gives these proportions:
    the length of the outspread arms is equal to the height of a man
    from the hairline to the bottom of the chin is one-tenth of the height of a man [hf]
    from below the chin to the top of the head is one-eighth of the height of a man [hh]
    from above the chest to the top of the head is one-sixth of the height of a man
    from above the chest to the hairline is one-seventh of the height of a man
    the maximum width of the shoulders is a quarter of the height of a man  [w]
    from the breasts to the top of the head is a quarter of the height of a man
    the distance from the elbow to the tip of the hand is a quarter of the height of a man [ha2+ha3]
    the distance from the elbow to the armpit is one-eighth of the height of a man  [ha1]
    the length of the hand is one-tenth of the height of a man  [ha3]
    the root of the penis is at half the height of a man
    the foot is one-seventh of the height of a man [ha7]
    from below the foot to below the knee is a quarter of the height of a man [ha6]
    from below the knee to the root of the penis is a quarter of the height of a man [ha5]
    the distances from the below the chin to the nose and the eyebrows and the hairline are equal to the ears and to one-third of the face
  */
  
  //// Constructors & set methods.
  Human() {}
  Human(float hset) {  // Height only.
    h=  hset;
    w=  hset/4;
  }
  Human(float hset, String nameset, color skinset, color shirtset, color pantsset) {
    h=  hset;
    w=  hset/4;
    name=  nameset;
    skin= skinset;
    shirt= shirtset;
    pants= pantsset;
  }
  Human(float hset, float wset, float xset, float yset) {
    // Height, width, and position (x,y)
    set( xset, yset);
    h=  hset;
    w=  wset;
  }
  Human(float hset, float wset, float xset, float yset, float dxset, float dyset) {
    // Height, width, and position (x,y) and dx,dy
    dx=  dxset;  dy=dyset;
    set( hset, wset, xset, yset);
  }
  void set(float xset, float yset) {
    x=  xset;
    y=  yset;
  }
  void set(float xset, float yset, float dxset, float dyset) {
    x=  xset;
    y=  yset;
    dx=  dxset;
    dy=  dyset;
  }
  
  float dxmax=width/10, dymax=height/10;
  void speed( float up ) {
    if (up==0) return;
    if (dx<dxmax) dx *= up;
    if (dy<dymax) dy *= up;
  }
  
  
}// END OF CLASS Human //




  
  
// END OF SKETCH //
