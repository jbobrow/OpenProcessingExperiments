
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 modified by Marius Ivaskevicius
 interactive
 move mouse around to get different shapes
 click mouse to add color for a short time
 */
int skipFrameCounter=0;
int skipFrames=2;
boolean record=false; //enable this to record every (skipFrames)'th frame to files
float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
int r=255;
int b=0;
boolean goBlue=true;
int colorCounter=0;
int colorCountTo=1000;
int specialColorValue=0;
boolean specialColor=false;
void setup() {
  size(500, 500);
  colorMode(HSB);
  // initial position in the centre of the screen
  x = width/2;
  y = height/2;
  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
  if(record){frameRate(10);}
}
float handRadMultiplayer=3;
float bodySwingRadius=3;
void draw() {
  for(int i=0;i<360;i++){
    // blend the old frames into the background
    //blendMode(BLEND);
    //fill(0, 5);
    //rect(0, 0, width, height);
    rad = radians(frameCount%360+i);
    // calculate new position
    x += dx;
    y += dy;
    float max = 1;
    float min = 0.5;
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x > width-100 || x < 100) {
      dx = dx > 0 ? -1 : 1;//random values here make the agent get stuck in edge
    }
    if (y > height-100 || y < 100) {
      dy = dy > 0 ? -1 : 1;
    }
    handRadMultiplayer=map(mouseX,0,width,1,100);
    float bx = x + handRadMultiplayer * sin(rad);
    float by = y + handRadMultiplayer * cos(rad);
    fill(180);
    bodySwingRadius=map(mouseY,0,height,1,10);
    float radius = 600 * sin(rad*0.1);
    float handX = bx + radius * sin(rad*bodySwingRadius);
    float handY = by + radius * cos(rad*bodySwingRadius);
    if(goBlue){
      if(b<255){
        r--;
        b++;
      }else{goBlue=false;}
    }else{
      if(r<255){
        r++;
        b--;
      }else{goBlue=true;}
    }
    if(specialColor){
      stroke(specialColorValue,255,r,50);
      if(colorCounter++>colorCountTo){
        colorCounter=0;
        specialColor=false;
      }
    }
    else{stroke(r,50);}
    line(bx, by, handX, handY);
    //ellipse(handX, handY, 2, 2);
  }
  if(skipFrameCounter++>skipFrames && record){
    skipFrameCounter=0;
    saveFrame("hs####.jpg");
  }
}
void mouseClicked(){
  println("handRadMultiplayer:",handRadMultiplayer,"bodySwingRadius",bodySwingRadius);
  specialColor=true;
  specialColorValue=int(random(255));
}
