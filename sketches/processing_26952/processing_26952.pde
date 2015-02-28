
PFont HEY;
PFont BUTTER;
PImage Paula;

void setup() {
  size(500,600);
  background(0);
  HEY=loadFont("ComicSansMS-48.vlw");
  BUTTER=loadFont("ComicSansMS-Bold-48.vlw");
  Paula=loadImage("Paula.jpg");
}
void draw(){
    tint(226,227,57,255);
  image(Paula,0,0,500,600);
  
    fill(0,0,0);
    textFont(HEY);
    text("HEY YA'LL",random(500),random(600));
    
    fill(0,0,0);
    textFont(BUTTER);
    text("BUTTER BUTTER BUTTER",random(500),random(600));
}


