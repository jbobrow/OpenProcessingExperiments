
//cut out
PImage woman;
PImage skel;
PImage spid;

void setup() {
  size (300,500);
  background(255);
  smooth();
  woman = loadImage("woman.jpg");
  skel = loadImage("skeleton.jpg");
  spid = loadImage("spider.jpg");
}

void draw () {
  background(255);
  smooth();
 //woman
 image(woman,0,200);
 //spider/skeleton
 if(mousePressed) {
   image(skel,0,200);
   image(spid,200,0);
 }
}

