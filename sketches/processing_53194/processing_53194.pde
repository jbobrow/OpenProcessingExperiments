
// software mirror demonstration
// ARTS 444: Interaction II, Spring 2012
// University of Illinois
// 
// by Benjamin Grosser
// Feb 11, 2012

import processing.video.*;

// our capture variable
Capture video;

// a few variables to manage
// locations and lengths
int newx = 0;
int newy = 0;
int xjump = 22;
int yjump = 22;
float linemax = 80;
float linelen = linemax;
float rectdrift = 8;

// some booleans for changing options
boolean showvid = false;
boolean drawrect = false;
boolean drawline = true;
boolean drawbez = false;
boolean drawfade = false;


void setup() {

  // use screen.width/screen.height to always
  // go fullscreen, regardless of screen size
  // use the P2D renderer for speed on 2D drawing
  size(screen.width, screen.height, P2D);

  // declare our capture variable video
  // we don't need much resolution to make this
  // work, which is good because it would get slow
  // quick if we wanted 640x480
  video = new Capture(this, 80, 60, 15);

  frameRate(25);
  smooth();
}

void draw() {

  // setting a fill 

  // pressing 'r' gets us a semi-transp
  // rectangle over the whole thing, giving
  // a fade effect on the marks
  if (drawfade == true) {
    fill(255, 20);
    rect(0, 0, width, height);
  }
  
  // use nested for loops to traverse through the pixels[]
  // array.  first pick a row (the Y), then run through 
  // each pixel in that row (the X).  once done with that 
  // row, then advance Y to the next.  
  
  // so this set of for() loops runs through each frame of
  // on each call to draw

  // for each row of each frame of video (Y)
  for (int y = 0; y < video.height; y++) {

    // for each column within that row (X)
    // notice that we're running through X 
    // *backwards* ... this does a horizontal
    // flip on the video, giving us a 'mirror' 
    // effect
    for (int x = video.width-1; x > -1; x--) { 

      // use our location formula to
      // grab the color at this pixel
      int loc = x + y * video.width;
      
      // now store the color at that location
      color c = video.pixels[loc];
      
      // use rect() as our mirror mark maker
      if(drawrect == true) {
         stroke(40,100);
         fill(c,220);
         rect(newx+random(rectdrift),newy+random(rectdrift),
         xjump-random(rectdrift),yjump-random(rectdrift));
      }
       
       
      // use line() as our mirror mark maker

      if (drawline == true) {
        
        strokeWeight(1);
        stroke(c, random(255));
        fill(c, 220);

        int pick = int(random(4));

        linelen = random(linemax);
        
        if (pick == 0) {
          line(newx, newy, newx+random(linelen), newy+random(linelen));
        } 
        else if (pick == 1) {
          line(newx, newy, newx-random(linelen), newy+random(linelen));
        } 
        else if (pick == 2) {
          line(newx, newy, newx+random(linelen), newy-random(linelen));
        } 
        else {
          line(newx, newy, newx-random(linelen), newy-random(linelen));
        }
      }


      // use bezier() as our mark maker

      if (drawbez == true) {
        
        strokeWeight(1);
        stroke(c, random(255));
        
        int pick = int(random(4));
        
        linelen = random(linemax);
                
        noFill();
        if (pick == 0) {
          bezier(newx, newy, 
          newx+random(linelen/2), newy+random(linelen/2), 
          newx+random(linelen/2), newy+random(linelen/2), 
          newx+random(linelen), newy+random(linelen));
        } 
        else if (pick == 1) {
          bezier(newx, newy, 
          newx-random(linelen/2), newy+random(linelen/2), 
          newx-random(linelen/2), newy+random(linelen/2), 
          newx-random(linelen), newy+random(linelen));
        } 
        else if (pick == 2) {
          bezier(newx, newy, 
          newx+random(linelen/2), newy-random(linelen/2), 
          newx+random(linelen/2), newy-random(linelen/2), 
          newx+random(linelen), newy-random(linelen));
        } 
        else {
          bezier(newx, newy, 
          newx-random(linelen/2), newy-random(linelen/2), 
          newx-random(linelen/2), newy-random(linelen/2), 
          newx-random(linelen), newy-random(linelen));
        }
      }


      /*
     // ELLIPSE
       ellipse(newx,newy,
       random(4)+xjump-xjump/4,
       random(4)+yjump-yjump/4);
       */

      // this manages our start locations
      // for the rects.  at the end of each
      // x location, increment our newX by 
      // the size of our rects (xjump)
      newx += xjump;

    }
    
    // we've finished a row, so reset newx
    // back to 0!
    newx = 0;
    
    // just as with newx above, now that we've
    // finished a row, increment newy by however
    // tall our rects are (yjump)
    newy += yjump;
  }
  
  // we've finished the frame 
  // so set Y back to 0!
  newy = 0;
  
  // shows the raw video feed in the bottom
  // left-hand corner in case it's needed
  if (showvid == true) {
    image(video, 0, height - video.height);
  }
  
}

// this just keeps the Capture event
// bringing in new pixels to work with
// from the camera
void captureEvent(Capture c) {
  c.read();
}


// some keyboard control
void keyPressed() {
  
  if (key == 'c') {
    if (showvid == false) { showvid = true; } 
    else { showvid = false; }
  }
  
  if (key == 'r') {
    if (drawrect == false) {
      drawrect = true;
    } 
    else {
      drawrect = false;
    }
  }
  
  if (key == 'f') {
    if (drawfade == false) {
      drawfade = true;
    } 
    else {
      drawfade = false;
    }
  }
  
  if (key == 'l') {
    if (drawline == false) {
      drawline = true;
    } 
    else {
      drawline = false;
    }
  }
  if (key == 'b') {
    if (drawbez == false) {
      drawbez = true;
    } 
    else {
      drawbez = false;
    }
  }
  if (keyCode == UP) {
    linemax+=5;
    rectdrift++;
  } 
  if (keyCode == DOWN) {
    linemax-=5;
    rectdrift--;
  }
  
  if (key == 's') {
    saveFrame();
  }
}


