
/**
 2011/11/12 by Peter Bosshard Schneider<br />
 Ribbon is based on "chain" from the processing examples.<br />
 if you click the mouse, the ribbon will follow the pointer.<br />
 if you stop moving the mouse for about 5 seconds the<br />
 programm starts to move the ribbon automatically again.<br />
 */
ArrayList segments;          // ArrayList to save the segments (springs) of the ribbon
int num_segments = 100;      // Number of segments

float gravity = 0.4;         // spring parameter
float mass = 2.0;            // spring parameter
float radius;                // radius of the ribbon loop
float angle;                 // angle for looping
float mx,my;                 // center of the loop
float x_pos;                 // mouse position 
float y_pos;
float lastx_pos;             // last mouseposition
float lasty_pos;
int cnt = 0;                 // counter to register inactivity of the mouse
boolean follow_mouse = false;// we don't follow the mouse on start

void setup() 
{
  // size(screenWidth,screenHeight,P2D); // full screen
  size(500, 500, P2D); 
  smooth();
  mx = width/2;              // start position at the center
  my = height/2;
  lastx_pos = mx;
  lasty_pos = my;
  segments = new ArrayList();// create the segments
  for (int i=0;i< num_segments;i++) {
    segments.add(new Spring2D(0.0,0.0, mass, gravity));
  }
}

void draw() 
{
 fill(0,25);
 noStroke();
 rect(0,0,width,height);
 angle = radians(frameCount%360);  // get angle from framecount
 radius = sin(radians(frameCount%270))*width*noise(0.738,0.33); // change radius in intervalls
 
 if(follow_mouse){
   x_pos = mouseX;
   y_pos = mouseY;
   // if the mouse is not moved then count 
   if((x_pos == lastx_pos)&&(y_pos == lasty_pos)) cnt++;
   if(cnt>300) follow_mouse = false;
   // register last mouse position
   lastx_pos = x_pos;
   lasty_pos = y_pos;
 }else{
   // automatically move ribbon
  x_pos = mx + cos(angle)*radius;
  y_pos = my + sin(angle)*radius;
 }
  
  // update and display first segment
  Spring2D curr_spring = (Spring2D)segments.get(0);
  curr_spring.update(x_pos, y_pos);
  curr_spring.display(x_pos, y_pos);

  // update and display all other segments
  for (int i=1;i<segments.size();i++) {
    curr_spring = (Spring2D)segments.get(i);
    Spring2D   last_spring = (Spring2D)segments.get(i-1);
    curr_spring.update(last_spring.x, last_spring.y);
    curr_spring.display(last_spring.x, last_spring.y);
  }
}

void mouseReleased(){
  follow_mouse = !follow_mouse;  // toggle follow mouse
  cnt = 0;                       // reset counter
  mx = mouseX;                   // register new center coordinates
  my = mouseY;
}



