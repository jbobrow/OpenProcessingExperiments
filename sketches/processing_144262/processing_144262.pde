
boolean withinbounds = true;
boolean reachedvertex = false;
boolean mousereleased = true;
int dist1 = 0;
int dist2 = 0;
int dist3 = 0;
void mouseReleased() {
   mousereleased = true; 
}
void setup() {
  size(500, 200);
  triangle(250,50,192,150,308,150);
}
class Dot {
  int myx;
  int myy;
  boolean updatedcoords = false;
  //int xoffset = 0;
  //int yoffset = 0;
  Dot(int x, int y) {
    myx = x;
    myy = y;
  }
  void display() {
    rectMode(CENTER);
    if (withinbounds) {
    fill(255,0,0);
    }
    dist1 = (myx-250)*(myx-250) + (myy-50)*(myy-50);
    dist2 = (myx-192)*(myx-192) + (myy-150)*(myy-150);
    dist3 = (myx-308)*(myx-308) + (myy-150)*(myy-150);
    reachedvertex =  (dist1 < 15*15 ||dist2 < 15*15 ||dist3 < 15*15);
    if (reachedvertex) {
        fill(255,255,0);
    }
    if (mousePressed && d.overme()) {
      //xoffset = mouseX - myx;
      //yoffset = mouseY - myy;
      mousereleased = false;
      myx=mouseX;
      myy=mouseY;
      updatedcoords=true;
    } 
    if (!updatedcoords) {
      rect(myx, myy, 10, 10);
    } else {
    if (updatedcoords && mousereleased) { 
    rect(myx, myy, 10, 10);
    }
    
    }
  }  
  boolean overme() {
     return ((mouseX>myx-5)&&(mouseX<myx+5)&&(mouseY>myy-5)&&(mouseY<myy+5));
  }
}
Dot d = new Dot(250,110);
void draw() {
   if (withinbounds) {
      //if (mousePressed && d.overme()) {
         d.display(); 
         if (reachedvertex) {
           rect(d.myx, d.myy, 10,10);
       noLoop(); 
    }
      //}
   } 
}


