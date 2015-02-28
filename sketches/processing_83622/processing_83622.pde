
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/9948*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
ArrayList hairHeap;
PImage img;



void setup() {
  size(450,450);
  img = loadImage("kodi.jpg");
  img.loadPixels();
  background(255);
  smooth();
  //makes it only draw when mouse is pressd
  //noLoop();
  hairHeap = new ArrayList();
  //hairHeap.add (new hair(x,y)); //starting point
}

void draw() {
  
  
  if (mousePressed == true) {
    hairHeap.add(new hair(mouseX, mouseY));
  }
//  noStroke();
//  fill(128);
//  rect(10,10,80,20);
// fill(255);
//  text("hairs: "+hairHeap.size(),15,25);
  for(int i=hairHeap.size()-1; i>=0; i--) {
    hair h = (hair) hairHeap.get(i);
    if (h.fDone) hairHeap.remove(i);
    else h.grow();
  }
}
//makes it stop and start with mousepress
//void mousePressed() {
//loop(); 
//}

//void mouseReleased() {
//noLoop();
//}

class hair {
  PVector loc, vel;
  float energy = 0;
  boolean fDone = false;

  hair(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(random(1)-0.5, random(1)-0.5);
  }

  void grow() {    
    energy += _eatImgLum();
    if (energy > 10) {
      energy -= 10;
      PVector dir = _nextDir();
      PVector d = PVector.sub(vel, dir);
      d.normalize();
      vel.add(d);
      vel.limit(1.5);
      loc.add(vel);
      if(loc.x < 0) loc.x = width-1;
      if(loc.x >= width) loc.x = 0;
      if(loc.y < 0) loc.y = height-1;
      if(loc.y >= height) loc.y = 0;
      _plop();
      if(energy>100) {
        energy -=100;
        hairHeap.add(new hair(loc.x, loc.y));
      }
    }
    energy -= 5;
    if (energy < 0) fDone = true;
  }
  
  PVector _nextDir() {
    PVector retVal = new PVector(0, 0);
    float retB = 0, b = 0;
    for (int yy = -1; yy<=1; yy++)
      for (int xx = -1; xx<=1; xx++) {
        b = _imgLum(int(loc.x+xx), int(loc.y+yy));
        if (b > retB) {
          retB = b;
          retVal = new PVector(xx, yy);
        }
      }
      if (b == 0) retVal = new PVector(random(2)-1, random(2)-1);
    retVal.normalize();
    return retVal;
  }
  
  float _eatImgLum() {
    float retVal = 0.0;
    int imgPos = int(loc.x) + int(loc.y) * width;
    if (imgPos < width*height && imgPos > 0) {
      float b = brightness(img.pixels[imgPos]);
      retVal = b*.65;
      img.pixels[imgPos] -= color(b-retVal);
    }
    return retVal;
  }

  float _imgLum(int x, int y) {
    float retVal = 0.0;
    int imgPos = x + y * width;
    if (imgPos < width*height && imgPos > 0)
      retVal = brightness(img.pixels[imgPos]);
    return retVal;
  }

  void _plop() {
    float b = brightness(get(int(loc.x),int(loc.y)))-20;
    if (b<0) b=0;
    stroke(b);
    point(loc.x,loc.y);
  }
}






