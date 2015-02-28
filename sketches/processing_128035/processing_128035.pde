
// simple simple concept
ArrayList<PImage> pages = new ArrayList<PImage>();
int page = 0;
boolean flag = false;

// setup
void setup() {
  size(640,480);
  smooth();
  // load pages
  for(int i = 0; i < 8; i++) {
    PImage tempImg = loadImage("page"+str(i+1)+".png");
    pages.add(tempImg);
  }
}

// draw
void draw() {
  PVector mouse = new PVector(mouseX, mouseY);
  PVector button = mouse.get();
  if(page==2) button = new PVector(590,310);
  if(page==4) button = new PVector(270,400);
  image(pages.get(page),0,0);
  if(mousePressed && !flag) {
    flag = true;
    if(mouse.dist(button) < 30.0) {
      if(page < pages.size() - 1) page++;
    }
  }
  if(!mousePressed) {
    flag = false;
  }
}


