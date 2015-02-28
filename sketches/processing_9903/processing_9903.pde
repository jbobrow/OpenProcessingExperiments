
// simple division of the drawing area using recursion
// stained glass look
// steven kay, May 2010

int RECURSION_DEPTH=5; // increase to get smaller rectangles.. keep in range 2..12

void setup() {
  size(512,512,P3D);
  frameRate(.5);
}

void divide(float x,float y,float w, float h, int lev) {
  // recursive function
  if (lev==0) {
    // need to terminate sometime!
    // only draw rectangles at lowest level of recursion to speed up sketch
    // otherwise, we just end up drawing larger rectangles that get overdrawn by
    // smaller rectangles
    noStroke();
    float r=random(255);
    float g=random(255);
    float b=random(255);
    fill(0); // or use fill(r,g,b)
    rect(x,y,w,h);
    fill(255-r,255-g,255-b); // inverse colour
    rect(x+2,y+2,w-4,h-4); // to fill rectangle inside
    return;
  }
  // divide this rectangle at random..
  int which=int(random(0,5));
  switch(which) {
    case(0):
       // split into top/bottom half
       divide(x,y,w,h/2,lev-1);
       divide(x,y+(h/2),w,h/2,lev-1); 
       break;
    case(1):
       // split into left/right half
       divide(x,y,w/2,h,lev-1);
       divide(x+(w/2),y,w/2,h,lev-1);
       break;
    case(2):
       // split into vertical thirds
       divide(x,y,w,h/3,lev-1);
       divide(x,y+(h/3),w,h/3,lev-1); 
       divide(x,y+(h/3)+(h/3),w,h/3,lev-1); 
       break;
    case(3):
       // or hoizontal thirds
       divide(x,y,w/3,h,lev-1);
       divide(x+(w/3),y,w/3,h,lev-1);
       divide(x+(w/3)+(w/3),y,w/3,h,lev-1);
       break;   
    default:
       // or do nothing..
       divide(x,y,w,h,lev-1);
       break;
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(256,256,0);
  divide(-200,-200,400,400,RECURSION_DEPTH);
  popMatrix();
  filter(BLUR,4);
}


